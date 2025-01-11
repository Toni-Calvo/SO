// libraries used to accomplish the Server.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <unistd.h>

#include <mysql.h>
#include <mysql/mysql.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <pthread.h>
#include <fcntl.h>
#include <unistd.h>
#include <ctype.h>



/* Defining the constants, these values can be changed, that's why we use constants because if we want to change any value, 
we should only have to change the constant*/
#define PORT 8080                     // Port number for the server.  for version 2 of the project, we will use this port number.

#define id_max_length 10
#define email_max_length 50
#define username_max_length 30
#define password_max_length 30
#define max_users 256

#define email_min_length 5
#define username_min_length 5
#define password_min_length 5
#define message_max_length 128

#define sql_query_max_length 1024
#define read_buffer_length 512
#define write_buffer_length 512
// buffer sizes are used to store data temporarily when reading from or writing to sockets 

#define database_name "bd"
#define database_username "root"
#define database_password "mysql"
#define database_host "localhost"   // will be changed for version3 to "shiva2.upc.edu".


// Defining the user structure and the user list structure.
typedef struct {
    char username[username_max_length];
    int socket;                // This will be user's socket.
} User;                        // def. of a user. 


typedef struct {
    User users[max_users];
    int user_count;
} UserList;       
/*UserList will contain the online users, that's why with username and the socket 
it will be enough, because the detailed information of a user(if it exists) will be saved
in the database, particularly in the Table "jugador". */


UserList my_list;           
int socket_num;             //Server's socket number.
int sockets[256];

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;      //Mutex for thread safety.
pthread_t threads[256];                                 //Threads for each user.



// functions to manage the user list:

// this function will return 0 if the user can be added, -1 if the process fails (we will use the mutux for thread safety).
int add_user(UserList *list, char user[30], int sock) {
    pthread_mutex_lock(&mutex);
    if (list->user_count == max_users) {
        pthread_mutex_unlock(&mutex);
        return -1;
    }
    strcpy(list->users[list->user_count].username, user);
	printf("User %s connected.\n", user);
    list->users[list->user_count].socket = sock;
    list->user_count++;
    pthread_mutex_unlock(&mutex);
    return 0;

}


// this function return 0 if the given user is eliminated, -1 if the process fails.
int remove_user(UserList *list, int socket) {
    char name[username_max_length];
    int pos = 0;
    int found = 0;
    pthread_mutex_lock(&mutex);
    int i = 0;
    while (i < list->user_count && !found) {
        if (list->users[i].socket == socket) {
            found = 1;
            pos = i;
            strcpy(name, list->users[i].username);
        }
        i++;
    }
    if (found) {
        printf("User %s will be removed from the position %d\n", name, pos);
        for (int j = pos; j < list->user_count - 1; j++) {
            strcpy(list->users[j].username, list->users[j + 1].username);
            list->users[j].socket = list->users[j + 1].socket;
        }
        list->user_count--;
        pthread_mutex_unlock(&mutex);
        return 0;
    }
}



// this function will return the socket of the given user, -1 if the user is not found.
int get_socket(UserList *list, char user[username_max_length]) {
    pthread_mutex_lock(&mutex);
    int found = 0;
    int i = 0;

    char lUser[username_max_length];
    for (int j = 0; j < strlen(user); j++) {
        lUser[j] = tolower(user[j]);
    }
    
    char lUser2[username_max_length];
    while (i < list->user_count && !found) {
        strcpy(lUser2, "");
        for (int j = 0; j < strlen(list->users[i].username); j++) {
            lUser2[j] = tolower(list->users[i].username[j]);
        }

        if (strcmp(lUser2, lUser) == 0) {
            found = 1;
            printf("%s's socket found.\n", user);
        }
        else {
            i++;
        }
    }
    if (found) {
        pthread_mutex_unlock(&mutex);
        return list->users[i].socket;
    }
    else {
        printf("%s's socket not found.\n", user);
        pthread_mutex_unlock(&mutex);
        return -1;
    }
}


// this function will save the ActiveUsers list:
void user_list(char *result) {
    pthread_mutex_lock(&mutex);
    strcpy(result, "");   // empty the result
    int n = my_list.user_count;
    sprintf(result, "%d/", n);
    for (int i = 0; i < n; i++) {
		printf("User %s is connected; ", my_list.users[i].username);
        sprintf(result, "%s%s/", result, my_list.users[i].username);
    }
    result[strlen(result) - 1] = '\0'; // remove the last '/'
    printf("\nResult: %s\n", result);
    pthread_mutex_unlock(&mutex);
}


// returns the IDs of all the games you can join
int get_games(char *result, MYSQL *conn) {
	char pre[write_buffer_length];
	strcpy(pre, "");
	pthread_mutex_lock(&mutex);
	char query[sql_query_max_length];
	MYSQL_RES *res;
	MYSQL_ROW row;
	sprintf(query, "SELECT IDPartida FROM partidas WHERE Duracion = 0");
	if (mysql_query(conn, query)) {
		fprintf(stderr, "%s\n", mysql_error(conn));
		return -1;
	}
	res = mysql_store_result(conn);
	if (res == NULL) {
		return -1;           
	}
	row = mysql_fetch_row(res);
	int counter = 0;
	while (row != NULL) {
		printf("Partida %s encontrada\n", row[0]);
		sprintf(pre, "%s%s/", pre, row[0]);
		row = mysql_fetch_row(res);
		counter++;
	}
	mysql_free_result(res);
	sprintf(result, "4/%i/%s", counter, pre);
	pthread_mutex_unlock(&mutex);
	return 0;
}


// this function will do the same as the above one, this one is for debugging purposes.
void see_active_users() {
    char result[write_buffer_length];
    char list[write_buffer_length];
    pthread_mutex_lock(&mutex);
    strcpy(result, "");
    int n = my_list.user_count;
    for(int i = 0; i < n; i++) {
        sprintf(result, "%s%s", result, my_list.users[i].username);
    }
    result[strlen(result)-1] = '\0';
    sprintf(list, "1/%s", result);
    pthread_mutex_unlock(&mutex);
    printf("Active users: %s\n", list);
}


// This function returns the number of sockets.
int getSockets(UserList *list, int sock[3000]) {
    int i = 0;
    pthread_mutex_lock(&mutex);
    int n = list->user_count;
    while (i < n) {
        sock[i] = list->users[i].socket;
        i++;
    }
    pthread_mutex_unlock(&mutex);
    return i;
}



// Query functions for the database:

// 1. This function will return 0 if the username and the password of that username is correct, -1 if the user is not found (we will use querey for this because we have to look in the database).
int correct_user_pass(char name[username_max_length], char password[password_max_length], MYSQL *conn) {
    char query[sql_query_max_length];
    MYSQL_RES *res;
    MYSQL_ROW row;
    sprintf(query, "SELECT * FROM jugador WHERE username = '%s' AND Contrasenya = '%s'", name, password);
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if (res == NULL) {
        return -1;      // username & password not correct
    }
    row = mysql_fetch_row(res);
    if (row == NULL) {
        return -1;    // username & password not correct
    }
    mysql_free_result(res);
    return 0;       // username & password correct
}

// removes a user from a game's lobby
int removeFromGame(char user[username_max_length], char idP[id_max_length], MYSQL *conn) {
	char query[sql_query_max_length];
	MYSQL_RES *res;
	MYSQL_ROW row;
	pthread_mutex_lock(&mutex);
	for (int i = 1; i != 5; i++) {
		sprintf(query, "UPDATE partidas SET IDJugador%i = NULL WHERE IDPartida = %s AND (IDJugador%i IN (SELECT ID FROM jugador WHERE username='%s'));", i, idP, i, user);
		if (mysql_query(conn, query)) {
			fprintf(stderr, "%s\n", mysql_error(conn));
			return -1;
		}
	}
	mysql_free_result(res);
	printf("Removed propperly\n");
	reorderLobby(idP, &conn);
	pthread_mutex_unlock(&mutex);
	return 0;
}


int reorderLobby(char idP[id_max_length], MYSQL *conn) {
	char query[sql_query_max_length];
	MYSQL_RES *res;
	MYSQL_ROW row;
	int IDs[3];
	int num = 0;
	printf("IDs Created\n");
	// Guardar los jugadores de la sala
	for (int i = 1; i != 5; i++) {
		sprintf(query, "SELECT IDJugador%i FROM partidas WHERE IDPartida=%s", i, idP);
		if (mysql_query(conn, query)) {
			fprintf(stderr, "%s\n", mysql_error(conn));
			return -1;
		}
		res = mysql_store_result(conn);
		if (res != NULL) {
			row = mysql_fetch_row(res);
			if (row != NULL) {
				IDs[num] = atoi(row[0]);
				printf("ID assigned\n");
				num++;
			}
		}
		printf("ID empty\n");
		mysql_free_result(res);
	}
	// delete lobby
	if (num == 0) {
		printf("Deletion\n");
		delete_sala(idP, conn);
	}
	// Reordenar usando la lista
	for (int i = 1; i != num + 1; i++) {
		printf("Reorder\n");
		sprintf(query, "UPDATE partidas SET IDJugador%i = %i WHERE IDPartida = %s", i, IDs[i], idP);
		if (mysql_query(conn, query)) {
			fprintf(stderr, "%s\n", mysql_error(conn));
			return -1;
		}
	}
	// Borrar el resto de valores
	for (int i = num + 1; i != 5; i++) {
		printf("Erased\n");
		sprintf(query, "UPDATE partidas SET IDJugador%i = NULL WHERE IDPartida = %s", i, idP);
		if (mysql_query(conn, query)) {
			fprintf(stderr, "%s\n", mysql_error(conn));
			return -1;
		}
	}
	printf("Finished\n");
	return 0;
}


// 2. This function return 0 if the username exists in the data base, -1 if the username does not exist.
int user_exists(char name[username_max_length], MYSQL *conn) {
    char query[sql_query_max_length];
    MYSQL_RES *res;
    MYSQL_ROW row;
    sprintf(query, "SELECT * FROM jugador WHERE username = '%s'", name);
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if (res == NULL) {
        return -1;      // username does not exist
    }
    row = mysql_fetch_row(res);
    if (row == NULL) {
        return -1;    // username does not exist
    }
    mysql_free_result(res);
    return 0;       // username exists
}


// 3. This function will return 0 if the email exists in the database, -1 if the email does not exist.
int email_exists(char email[email_max_length], MYSQL *conn) {
    char query[sql_query_max_length];
    MYSQL_RES *res;
    MYSQL_ROW row;
    sprintf(query, "SELECT * FROM jugador WHERE Correo = '%s'", email);
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if (res == NULL) {
        return -1;      // email does not exist
    }
    row = mysql_fetch_row(res);
    if (row == NULL) {
        return -1;    // email does not exist
    }
    mysql_free_result(res);
    return 0;       // email exists
}



// 4. This function will return the ID of the last user in the database.
/* We will suppose that the IDs of the players are ordered numerically when a user connects.
So the last person to connect will have the max ID and in this way it will be much easier to add
a new player and assigning a new ID*/
int get_last_id(MYSQL *conn) {
    char query[sql_query_max_length];
    MYSQL_RES *res;
    MYSQL_ROW row;
    sprintf(query, "SELECT MAX(ID) FROM jugador");
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if (res == NULL) {
        return -1;           
    }
    row = mysql_fetch_row(res);
    if (row == NULL) {
        return -1;
    }
    mysql_free_result(res);
    return atoi(row[0]);            // return the max ID
}

int get_last_id_partida(MYSQL *conn) {
	char query[sql_query_max_length];
	MYSQL_RES *res = NULL;  // Inicializa res como NULL para facilitar la liberación de memoria
	MYSQL_ROW row;
	
	// Construye la consulta
	sprintf(query, "SELECT MAX(IDPartida) FROM partidas");
	if (mysql_query(conn, query)) {
		fprintf(stderr, "Error en la consulta: %s\n", mysql_error(conn));
		return -1;  // Devuelve un código de error si la consulta falla
	}
	// Almacena el resultado de la consulta
	res = mysql_store_result(conn);
	if (res == NULL) {
		fprintf(stderr, "Error al almacenar el resultado: %s\n", mysql_error(conn));
		return -1;  // Devuelve un código de error si no se pudo almacenar el resultado
	}
	// Obtiene la primera fila del resultado
	row = mysql_fetch_row(res);
	if (row == NULL || row[0] == NULL) {
		// Si la fila o el valor en row[0] son NULL, no hay un ID máximo
		mysql_free_result(res);  // Libera la memoria antes de salir
		return -1;
	}
	// Convierte el valor a entero, una vez que se ha confirmado que row[0] no es NULL
	int last_id = atoi(row[0]);
	
	// Libera el resultado antes de devolver el valor
	mysql_free_result(res);
	
	return last_id;  // Devuelve el ID máximo
}
/*int get_last_id_partida(MYSQL *conn) {
    char query[sql_query_max_length];
    MYSQL_RES *res;
    MYSQL_ROW row;
    sprintf(query, "SELECT MAX(IDPartida) FROM partidas");
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if (res == NULL) {
        return -1;           
    }
    row = mysql_fetch_row(res);
    if (row == NULL) {
        return -1;
    }
    mysql_free_result(res);
    return atoi(row[0]);            // return the max ID
}

*/

/* 5. This function will add a new user to the database (if the user does not exits already).
Will return 0 if the user is added, -1 if the user is not added. */
int add_user_to_database(char name[username_max_length], char email[email_max_length], char password[password_max_length], char dob[10], MYSQL *conn) {
    MYSQL_RES *res;
    MYSQL_ROW row;
    char query[sql_query_max_length];
    int id = get_last_id(conn);
    if (id == -1) {
        return -1;
    }
    id++;
    if ((user_exists(name, conn) == -1) && (email_exists(email, conn) == -1)) {
        sprintf(query, "INSERT INTO jugador VALUES (%d, '%s', '%s', '%s', '%s')", id, name, email, password, dob);
        
        if (mysql_query(conn, query) != 0) {
            printf("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
            return -1;
        }
        return 0;
    }

    else {
        printf("User already exists\n");
        return -1;
    }
}



/* 6. This function will eliminate the user from the database.
Will return 0 if the user is eliminated, -1 if not*/
int remove_user_from_database(char name[username_max_length], MYSQL *conn) {
    MYSQL_RES *res;
    MYSQL_ROW row;
    char query[sql_query_max_length];
    int user_id;

    if (user_exists(name, conn) == -1) {
        printf("User does not exist, cannot delete.\n");
        return -1;
    }

    //Get the user ID
    sprintf(query, "SELECT ID FROM jugador WHERE username = '%s'", name);
    if (mysql_query(conn, query) != 0) {
        printf("Error fetching user ID: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if ((row = mysql_fetch_row(res)) == NULL) {
        printf("Error: User ID could not be retrieved.\n");
        mysql_free_result(res);
        return -1;
    }
    user_id = atoi(row[0]);
    mysql_free_result(res);

    //Delete related data from "RelacionIDsPartidas"
    sprintf(query, "DELETE FROM RelacionIDsPartidas WHERE IDJugador = %d", user_id);
    if (mysql_query(conn, query) != 0) {
        printf("Error deleting from RelacionIDsPartidas: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }

    //Delete the user references in "partidas"
    sprintf(query, "UPDATE partidas SET IDJugador1 = NULL WHERE IDJugador1 = %d", user_id);
    if (mysql_query(conn, query) != 0) {
        printf("Error updating partidas (IDJugador1): %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    sprintf(query, "UPDATE partidas SET IDJugador2 = NULL WHERE IDJugador2 = %d", user_id);
    if (mysql_query(conn, query) != 0) {
        printf("Error updating partidas (IDJugador2): %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    sprintf(query, "UPDATE partidas SET IDJugador3 = NULL WHERE IDJugador3 = %d", user_id);
    if (mysql_query(conn, query) != 0) {
        printf("Error updating partidas (IDJugador3): %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    sprintf(query, "UPDATE partidas SET IDJugador4 = NULL WHERE IDJugador4 = %d", user_id);
    if (mysql_query(conn, query) != 0) {
        printf("Error updating partidas (IDJugador4): %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }

    //Delete games with no players left
    sprintf(query, "DELETE FROM partidas WHERE IDJugador1 IS NULL AND IDJugador2 IS NULL AND IDJugador3 IS NULL AND IDJugador4 IS NULL");
    if (mysql_query(conn, query) != 0) {
        printf("Error deleting empty partidas: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }

    //Remove user from conectados
    sprintf(query, "DELETE FROM conectados WHERE nombre = '%s'", name);
    if (mysql_query(conn, query) != 0) {
        printf("Error deleting from conectados: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }

    //Delete user from jugador
    sprintf(query, "DELETE FROM jugador WHERE ID = %d", user_id);
    if (mysql_query(conn, query) != 0) {
        printf("Error deleting from jugador: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }

    printf("User and all related data successfully deleted.\n");
    return 0;
}



/* 7. This function will return the number of total users in our database*/
int total_users(MYSQL *conn) {
    MYSQL_RES *res;
    MYSQL_ROW row;
    char query[sql_query_max_length];
    sprintf(query, "SELECT COUNT(*) FROM jugador");
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if (res == NULL) {
        return -1;
    }
    row = mysql_fetch_row(res);
    if (row == NULL) {
        return -1;
    }
    mysql_free_result(res);
    return atoi(row[0]);
}



/* 8. This function will return the username of all users in the database */
void getUsernames(char *users, MYSQL *conn) {
    MYSQL_RES *res;
    MYSQL_ROW row;
    char query[sql_query_max_length];
    char result[write_buffer_length];
    int counter = 0;
    sprintf(query, "SELECT username FROM jugador");
    if (mysql_query (conn, query) != 0) {
		printf ("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
		exit(1);
	}
    res = mysql_store_result(conn);
    row = mysql_fetch_row(res);
    strcpy(result, "");    // empty the result (initialize)
    while (row != NULL) {
        sprintf(result, "%s%s/", result, row[0]);
        row = mysql_fetch_row(res);
        counter++;
    }
    result[strlen(result) - 1] = '\0'; // remove the last '/'
    sprintf(users, "%d/%s", counter, result);
    printf("Users: %s\n", users);
}




// auxiliar functions: (improvisation)

// Function to broadcast the list of connected users to all clients.
void broadcast_user_list() {
    char notification[write_buffer_length];
    char response[write_buffer_length];
    
    // Create the list of active users.
    user_list(response);
    sprintf(notification, "7/%s", response);
    printf("Broadcasting user list: %s\n", response);

    // Get all connected sockets and broadcast the list.
    int sock[3000];
    int num = getSockets(&my_list, sock);
    for (int i = 0; i < num; i++) {
        write(sock[i], notification, strlen(notification));
    }
}


// Check if a user with the given username is already logged in.
// Returns 1 if the user is logged in, 0 otherwise.
int is_user_logged_in(UserList *list, const char *username) {
    pthread_mutex_lock(&mutex);
    for (int i = 0; i < list->user_count; i++) {
        if (strcmp(list->users[i].username, username) == 0) {
            pthread_mutex_unlock(&mutex);
            return 1;  // User is already logged in
        }
    }
    pthread_mutex_unlock(&mutex);
    return 0;  // User is not logged in
}


int info_sala(char idPartida[id_max_length], char *result, MYSQL *conn) {
    MYSQL_RES *res;
    MYSQL_ROW row;
    char query[sql_query_max_length];
    strcpy(result, "9/");    // empty the result (initialize)

    pthread_mutex_lock(&mutex);
    sprintf(query, "SELECT duracion FROM partidas WHERE (IDPartida=%s)", idPartida);    // 0: partida no iniciada, 1: partida en curso
    if (mysql_query (conn, query)) {
        printf ("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
	if (res == NULL) {
		return -2;
	}
    row = mysql_fetch_row(res);
	if (row == NULL || row[0] == NULL) {
		mysql_free_result(res);
		return -3;
	}
    if (strcmp(row[0], "0") == 0) {
        strcat(result, "0/");
    }
    else {
        strcat(result, "1/");
    }
	char username[username_max_length];
	int check = getUser1FromIDPartida(idPartida, username, conn);
	strcat(result, username);
	strcat(result, "/");

    for (int i = 2; i < 5; i++) {
        sprintf(query, "SELECT username FROM jugador WHERE (ID IN (SELECT IDJugador%i FROM partidas WHERE (IDPartida=%s)))", i, idPartida);
        if (mysql_query (conn, query)) {
            printf ("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
            break;
        }
		res = mysql_store_result(conn);
		if (res == NULL) {
			break;
		}
		row = mysql_fetch_row(res);
		if (row == NULL || row[0] == NULL) {
			mysql_free_result(res);
			break;
		}
        strcat(result, row[0]);
        strcat(result, "/");
    }
    pthread_mutex_unlock(&mutex);
    
    printf("Info sala: %s\n", result);
    return 0;
}


int info_partida(char idPartida[id_max_length], char *result, MYSQL *conn) {
    MYSQL_RES *res;
    MYSQL_ROW row;
    char query[sql_query_max_length];
    strcpy(result, "11/");

    pthread_mutex_lock(&mutex);
    sprintf(query, "SELECT duracion FROM partidas WHERE IDPartida='%s'", idPartida);    // Turno
    if (mysql_query (conn, query) != 0) {
        printf ("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        exit(1);
    }
    res = mysql_store_result(conn);
	if (res == NULL)
		return -1;
	
    row = mysql_fetch_row(res);
	if (row == NULL)
		return -1;
    strcat(result, row[0]);
    strcat(result, "/");

    for (int i = 1; i < 5; i++) {
        sprintf(query, "SELECT p%i FROM partidas WHERE IDPartida='%s'", i, idPartida);  // Puntuaciones
        if (mysql_query (conn, query) != 0) {
            printf ("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
            exit(1);
        }
		res = mysql_store_result(conn);
		if (res == NULL)
			continue;
		
		row = mysql_fetch_row(res);
		if (row == NULL)
			continue;
        strcat(result, row[0]);
        strcat(result, "/");
    }
    pthread_mutex_unlock(&mutex);
}


int update_turn(char idPartida[id_max_length], char turno[10], MYSQL *conn) {
    char query[sql_query_max_length];
    pthread_mutex_lock(&mutex);
    sprintf(query, "UPDATE partidas SET duracion=%s WHERE IDPartida='%s'", turno, idPartida);
    if (mysql_query(conn, query) != 0) {
        printf("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    pthread_mutex_unlock(&mutex);
    return 0;
}


int get_question(char cathegory[username_max_length], char *response, MYSQL *conn) {
    MYSQL_RES *res;
    MYSQL_ROW row;
    char query[sql_query_max_length];
    strcpy(response, "8/");
    sprintf(query, "SELECT * FROM Preguntas%s ORDER BY RAND() LIMIT 1", cathegory);
    if (mysql_query (conn, query)) {
        printf ("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
	if (res == NULL)
		return -1;
    row = mysql_fetch_row(res);
	if (row == NULL)
		return -1;
	if (row[0] != NULL && row[1] != NULL && row[2] != NULL && row[3] != NULL && row[4] != NULL) {
		strcat(response, row[0]);
		strcat(response, "/");
		strcat(response, row[1]);
		strcat(response, "/");
		strcat(response, row[2]);
		strcat(response, "/");
		strcat(response, row[3]);
		strcat(response, "/");
		strcat(response, row[4]);
	}
	else
		return -1;
	
    printf("Question: %s\n", response);
    return 0;
}


int delete_sala(char idPartida[id_max_length], MYSQL *conn) {
    char query[sql_query_max_length];
    pthread_mutex_lock(&mutex);
	printf("ID a borrar: %s", idPartida);
    sprintf(query, "DELETE FROM partidas WHERE IDPartida='%s'", idPartida);
    if (mysql_query(conn, query) != 0) {
        printf("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    pthread_mutex_unlock(&mutex);
    return 0;
}


int sumar_punto(char idPartida[id_max_length], char user[username_max_length], MYSQL *conn) {
    char query[sql_query_max_length];
    pthread_mutex_lock(&mutex);
    sprintf(query, "UPDATE partidas SET p%s=p%s+1 WHERE IDPartida=%s", user, user, idPartida);
    if (mysql_query(conn, query) != 0) {
        printf("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    pthread_mutex_unlock(&mutex);
    return 0;
}


int get_user_id(char username[username_max_length], MYSQL *conn) {
    char query[sql_query_max_length];
    MYSQL_RES *res;
    MYSQL_ROW row;
    sprintf(query, "SELECT ID FROM jugador WHERE username='%s'", username);
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if (res == NULL) {
        return -1;
    }
    row = mysql_fetch_row(res);
    if (row == NULL) {
        return -1;
    }
    mysql_free_result(res);
	printf("Usuario: %s, ID: %s\n", username, row[0]);
    return atoi(row[0]);
}


int getUser1FromIDPartida(char idPartida[id_max_length], char *username, MYSQL *conn) {
    char query[sql_query_max_length];
    MYSQL_RES *res;
    MYSQL_ROW row;
    sprintf(query, "SELECT username FROM jugador WHERE ID IN (SELECT IDJugador1 FROM partidas WHERE IDPartida=%s)", idPartida);
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if (res == NULL) {
        return -1;
    }
    row = mysql_fetch_row(res);
    if (row == NULL) {
        return -1;
    }
    strcpy(username, row[0]);
    mysql_free_result(res);
    return 0;
}


int crear_sala(int idPartida, int idUser, char *response, MYSQL *conn) {
	char query[sql_query_max_length];
    sprintf(query, "INSERT INTO partidas VALUES (%i, %i, NULL, NULL, NULL, '2000-01-01 12:00:00', 0, NULL, 0, 0, 0, 0)", idPartida, idUser);
    if (mysql_query(conn, query) != 0) {
        printf("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    return 0;
}


int find_sala(char username[username_max_length], MYSQL *conn) {
    char query[sql_query_max_length];
    MYSQL_RES *res;
    MYSQL_ROW row;
    sprintf(query, "SELECT IDPartida FROM partidas WHERE (IDJugador1 IN (SELECT ID FROM jugador WHERE username='%s') OR IDJugador2 IN (SELECT ID FROM jugador WHERE username='%s') OR IDJugador3 IN (SELECT ID FROM jugador WHERE username='%s') OR IDJugador4 IN (SELECT ID FROM jugador WHERE username='%s'))", username, username, username, username);
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if (res == NULL) {
        return -1;
    }
    row = mysql_fetch_row(res);
    if (row == NULL) {
        return -1;
    }
    mysql_free_result(res);
    return atoi(row[0]);
}


int findNextPlayerSpot(int idPartida, MYSQL *conn) {
    MYSQL_RES *res;
    MYSQL_ROW row;
    char query[sql_query_max_length];
    sprintf(query, "SELECT IDJugador1, IDJugador2, IDJugador3, IDJugador4 FROM partidas WHERE IDPartida=%i", idPartida);
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if (res == NULL) {
        return -1;
    }
    row = mysql_fetch_row(res);
    if (row == NULL) {
        return -1;
    }
    int id = 0;
    for (int i = 1; i < 5; i++) {
        if (row[i-1] == NULL) {
            id = i;
            break;
        }
        id = -1;
    }
    return id;
}

int isUserInGame(char username[username_max_length], int idPartida, MYSQL *conn) {
    char query[sql_query_max_length];
    MYSQL_RES *res;
    MYSQL_ROW row;
    sprintf(query, "SELECT ID FROM jugador WHERE username='%s'", username);
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if (res == NULL) {
        return -1;
    }
    row = mysql_fetch_row(res);
    if (row == NULL) {
        return -1;
    }
    int id = atoi(row[0]);
    mysql_free_result(res);
    sprintf(query, "SELECT IDJugador1, IDJugador2, IDJugador3, IDJugador4 FROM partidas WHERE IDPartida=%i", idPartida);
    if (mysql_query(conn, query)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return -1;
    }
    res = mysql_store_result(conn);
    if (res == NULL) {
        return -1;
    }
    row = mysql_fetch_row(res);
    if (row == NULL) {
        return -1;
    }
    for (int i = 1; i < 5; i++) {
        if (row[i-1] != NULL && atoi(row[i-1]) == id) {
            return 1;
        }
    }
    return 0;
}


int join_sala(char username[username_max_length], int idPartida, char *response, MYSQL *conn) {
    MYSQL_RES *res;
    MYSQL_ROW row;
    char query[sql_query_max_length];
    pthread_mutex_lock(&mutex);
    if (isUserInGame(username, idPartida, conn) == 1) {
        sprintf(response, "14/Error");
        return -1;
    }
    int id = get_user_id(username, conn);
    int player = findNextPlayerSpot(idPartida, conn);
    if (player == -1) {
        sprintf(response, "14/Error");
        return -1;
    }
    sprintf(query, "UPDATE partidas SET IDJugador%i=%i WHERE IDPartida=%i", player, id, idPartida);
    if (mysql_query(conn, query) != 0) {
        printf("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    pthread_mutex_unlock(&mutex);
    sprintf(response, "14/%i", idPartida);
    return 0;
}

int deletePartidas() {
	printf("Borrando Partidas\n");
    MYSQL *conn;
    conn = mysql_init(NULL);

    if (conn == NULL) {
        printf("Error %u: %s\n", mysql_errno(conn), mysql_error(conn));
        exit(1);
    }
    conn = mysql_real_connect(conn, database_host, database_username, database_password, database_name, 0, NULL, 0);
    if (conn == NULL) {
        printf("Error %u: %s\n", mysql_errno(conn), mysql_error(conn));
        exit(1);
    }

    char query[sql_query_max_length];
    strcpy(query, "DELETE FROM partidas");
    if (mysql_query(conn, query) != 0) {
        printf("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
	
	printf("Partidas Borrada\n");
    return 0;
}

// this function is to get the petition from the client.

// Function to broadcast chat messages to users within the same *sala*
void handle_chat_message(const char *sender_username, const char *message) {
    MYSQL *conn;
    conn = mysql_init(NULL);
    if (conn == NULL) {
        printf("Error %u: %s\n", mysql_errno(conn), mysql_error(conn));
        exit(1);
    }

    conn = mysql_real_connect(conn, database_host, database_username, database_password, database_name, 0, NULL, 0);
    if (conn == NULL) {
        printf("Error %u: %s\n", mysql_error(conn));
        return;
    }

    // Find the room ID for the sender to broadcast the message to the correct room
    int sala_id = find_sala(sender_username, conn);
    if (sala_id == -1) {
        printf("User %s is not in a room\n", sender_username);
        return;
    }

    /*IRC-style formatted message that includes sender’s username, message type, and content
    It is not necessary to know how this part of the code, because this is a protocol to chat,
    since we are using server (later, we'll be using SHIVA) this makes our task much easier.*/
    char formatted_message[write_buffer_length];
    snprintf(formatted_message, sizeof(formatted_message), ":%s PRIVMSG #%d :%s", sender_username, sala_id, message);   // snprintf is used to avoid buffer overflow
    pthread_mutex_lock(&mutex);
    for (int i = 0; i < my_list.user_count; i++) {
        if (find_sala(my_list.users[i].username, conn) == sala_id) {
            write(my_list.users[i].socket, formatted_message, strlen(formatted_message));
        }
    }
    pthread_mutex_unlock(&mutex);
    mysql_close(conn);
}



// this function is to get the petition from the client.
void *attendClients(void *socket) {
    int list = 0;
    int ret;
    int sock_conn;
    char petition[read_buffer_length];
    char notification[write_buffer_length];
    char response[write_buffer_length];
    char bdd_users[write_buffer_length];
    char total[write_buffer_length];

    // initialization of the lists:
    strcpy(notification, ""); 
    strcpy(response, "");
    strcpy(bdd_users, "");
    strcpy(total, "");

    int *s = (int *)socket;
    sock_conn = *s;

    MYSQL *conn;
    conn = mysql_init(NULL);

    if (conn == NULL) {
        printf("Error %u: %s\n", mysql_errno(conn), mysql_error(conn));
        exit(1);
    }
    conn = mysql_real_connect(conn, database_host, database_username, database_password, database_name, 0, NULL, 0);
    if (conn == NULL) {
        printf("Error %u: %s\n", mysql_errno(conn), mysql_error(conn));
        exit(1);
    }

    int stop = 0;
    while (stop == 0) {
        ret = read(sock_conn, petition, sizeof(petition));

        printf("Received \n");

        if (ret == -1) 
            continue;
        else if (ret == 0) 
            break;
        
        /* If a request (petition) is received,  it’s null-terminated (petition[ret] = '\0') to handle it as a string.
           If ret == -1, the loop continues, indicating a failed read. If ret == 0, it means the client disconnected, 
           and the loop breaks.*/
        petition[ret] = '\0';
        
        printf("Petition number: ", petition);

            char *p = strtok(petition, "/");
            int option = atoi(p);

            char username[username_max_length];
            char password[password_max_length];
            char email[email_max_length];
            char dob[10];
            char idPartida[id_max_length];
            char turno[10];

            strcpy(username, "");
            strcpy(password, "");
            strcpy(email, "");

            if (option == 0) {
				printf("Disconnect\n");
                stop = 1;    // stop the connection
                int i = 0;
                int sock[3000];
				p = strtok(NULL, "/");
				strcpy(response, "");
				strcpy(username, p);
				p = strtok(NULL, "/");
				strcpy(idPartida, p);
				printf("Saved All Variables\n");
				removeFromGame(username, idPartida, conn);
                int remove = remove_user(&my_list, sock_conn);

                if (remove == 0) {          // Handle user disconnect
                    printf("The user has been removed\n");
                    write(sock_conn, "0/", 2);
                    // broadcast_user_list();  // Broadcast updated list after disconnection
                    user_list(response);
                    sprintf(notification, "7/%s", response);
                    getSockets(&my_list, sock);

                    /*
                    int num = getSockets(&my_list, sock);
                    for (i = 0; i < num; i++) {
                        write(sock[i], notification, strlen(notification));
                    }
                    */
                } 
				strcpy(response, "");
				write(sock_conn, response, strlen(response));
            }

            else if (option == 1) {       // Handle Login (connection)
				printf("Login\n");
                p = strtok(NULL, "/");
                strcpy(username, p);

                p = strtok(NULL, "/");
                strcpy(password, p);


                // Check if the user is already logged in
                if (is_user_logged_in(&my_list, username)) {
                    strcpy(response, "Already Logged");
                } 
                
                else if (correct_user_pass(username, password, conn) == 0) {
                    // Login successful, add user to list
                    add_user(&my_list, username, sock_conn);
                    strcpy(response, "Login");
					printf("The socket number is: %d\n", sock_conn);
                    // broadcast_user_list();  // Broadcast updated list after connection
                }

                else {
                    strcpy(response, "Login failed: Invalid username or password.");
                }
                write(sock_conn, response, strlen(response));
            }
			
			else if (option == 2) {			// Salir de la sala
				printf("Saliendo de la sala\n");
				strcpy(response, "");
				p = strtok(NULL, "/");
				strcpy(username, p);
				
				p = strtok(NULL, "/");
				int idP = atoi(p);
				
				removeFromGame(username, idP, conn);
				write(sock_conn, response, strlen(response));
			}

            else if (option == 3) {        // Handle user registration
				printf("Register\n");
                strcpy(response, "");
                p = strtok(NULL, "/");
                strcpy(username, p);

                p = strtok(NULL, "/");
                strcpy(password, p);

                p = strtok(NULL, "/");
                strcpy(email, p);

                p = strtok(NULL, "/");
                strcpy(dob, p);

                printf("Username: %s\n", username);
                printf("Password: %s\n", password);
                printf("Email: %s\n", email);
                printf("Date of birth: %s\n", dob);

                int add = add_user_to_database(username, email, password, dob, conn);

                if (add == 0) {
                    strcpy(response, "Registro");
                }
                else {
                    if (user_exists(username, conn) == 0) {
                        strcpy(response, "Usuario Existente");
                    }
                    else if (email_exists(email, conn) == 0){
                        strcpy(response, "Correo Existente");
                    }
                    else {
                        strcpy(response, "User not added");
                    }
                }
                printf("Response: %s\n", response);
                write(sock_conn, response, strlen(response));
            }
			
			
			else if (option == 4) {				// Lista de partidas
				printf("Lista de partidas\n");
				strcpy(response, "");
				int cond = get_games(&response, conn);
				if (cond == 0) {
					printf("%s\n", response);
					write(sock_conn, response, strlen(response));
				}
				else {
					strcpy(response, "4/fallo");
					printf("%s\n", response);
					write(sock_conn, response, strlen(response));
				}
			}

            
            else if (option == 5) {             // Update turn
				printf("Update turn\n");
                p = strtok(NULL, "/");
                strcpy(idPartida, p);
                p = strtok(NULL, "/");
                strcpy(turno, p);
                update_turn(idPartida, turno, conn);
                strcpy(response, "5/");
                write(sock_conn, response, strlen(response));
            }


            else if (option == 6) {           // Send all usernames in database
				printf("Get All Users\n");
                getUsernames(total, conn);
                pthread_mutex_lock(&mutex);   // since in the function we are using the mutex, we have to lock it.
                sprintf(response, "6/%s", total);
                printf("The users are: %s\n", response);
                write(sock_conn, response, strlen(response));
                pthread_mutex_unlock(&mutex);  // unlock the mutex
            }


            else if (option == 7) {           
                // option 7 is to get the list of active users.
				printf("Get All Connected Users\n");
				char connectedPlayers[write_buffer_length];
                user_list(connectedPlayers);
                printf("Connected Players: %s\n", connectedPlayers);
                sprintf(response, "7/%s", connectedPlayers);
                printf("The active users are: %s\n", response);
                write(sock_conn, response, strlen(response));
            }


            else if (option == 8) {         // Get a question from the given cathegory
				printf("Get a Question\n");
                p = strtok(NULL, "/");
                get_question(p, response, conn);
                write(sock_conn, response, strlen(response));
            }


            else if (option == 9) {         // Informacion de la sala
				printf("Info Lobby\n");
				p = strtok(NULL, "/");
				int res = info_sala(p, response, conn);
                printf("Response: %s\n", response);
				write(sock_conn, response, strlen(response));
            }

            
            else if (option == 10) {        // Iniciar partida
				printf("Start Game\n");
                p = strtok(NULL, "/");
                strcpy(idPartida, p);
                strcpy(turno, "1");
                update_turn(idPartida, turno, conn);
                strcpy(response, "10/Game Started");
                write(sock_conn, response, strlen(response));
            }


            else if (option == 11) {        // Informacion de la partida
				printf("Info Game\n");
                p = strtok(NULL, "/");
                strcpy(idPartida, p);
                int res = info_partida(idPartida, response, conn);
                write(sock_conn, response, strlen(response));
            }


            else if (option == 12) {        // Borrar sala
				printf("Delete Game\n");
                p = strtok(NULL, "/");
                strcpy(idPartida, p);
                int res = delete_sala(idPartida, conn);
                strcpy(response, "12/");
                write(sock_conn, response, strlen(response));
            }


            else if (option == 13) {        // Sumar punto
				printf("Add Point\n");
                p = strtok(NULL, "/");
                strcpy(idPartida, p);
                p = strtok(NULL, "/");
                strcpy(username, p);
                sumar_punto(idPartida, username, conn);
                strcpy(response, "13/");
                write(sock_conn, response, strlen(response));
            }


            else if (option == 14) {        // Unirse a una sala
				printf("Join Lobby\n");
                p = strtok(NULL, "/");
                strcpy(username, p);
                p = strtok(NULL, "/");
				int idP = atoi(p);
				printf("User: %s\nGameID: %i\n", username, idP);
                join_sala(username, idP, response, conn);
                write(sock_conn, response, strlen(response));
            }


            else if (option == 15) {        // Crear sala
				printf("Create Lobby\n");
				p = strtok(NULL, "/");
				if (p != NULL) {
					strcpy(username, p);
				} else {
					fprintf(stderr, "Error: strtok devolvió NULL\n");
					strcpy(username, "default_username"); // o manejar error de forma adecuada
				}
				printf("User: %s.\nResponse: '%s'\n", username, response);
				int idP = get_last_id_partida(conn) + 1;
				int idU = get_user_id(username, conn);
				
				strcpy(response, "15");
				if (idP == -1 || idP == 0){
					strcat(response, "/1");
					idP = 1;
				}else 
				{
					char idGame[10];
					sprintf(idGame, "/%i", idP);
					strcat(response, idGame);
				}
				
				
				printf("User ID: %i, Game ID: %i\n", idU, idP);
				
				int i = crear_sala(idP, idU, response, conn);
				if (i == -1) {
					fprintf(stderr, "Error: No se pudo crear la sala\n");
					return -1; // o maneja el error de forma adecuada
				}
				printf("Response: %s\n", response);
				
				if (sock_conn >= 0) {
					write(sock_conn, response, strlen(response));
				} else {
					fprintf(stderr, "Error: Socket de conexion no valido\n");
				}
            }

            else if (option == 16) {  // Protocol for chat: 16/sender/roomID/message
				p = strtok(NULL, "/");
				char sender[username_max_length];
				strcpy(sender, p);  // this is the username of the sender

                p = strtok(NULL, "/");
                char reciever[username_max_length];  
                strcpy(reciever, p);  // this is the username of the reciever

                p = strtok(NULL, "/");
				char message[message_max_length];
				strcpy(message, p);  // this is the message

                printf("Chat message from %s to %s: %s\n", sender, reciever, message);
                strcpy(response, "16/Message sent");
                write(sock_conn, response, strlen(response));

				for (int i = 0; i < my_list.user_count; i++) {
					printf("User: %s; Socket: %i\n", my_list.users[i].username, my_list.users[i].socket);
				}
				int sender_socket = get_socket(&my_list, sender);
				int reciever_socket = get_socket(&my_list, reciever);

                printf("Sender socket: %d\n", sender_socket);
                printf("Reciever socket: %d\n", reciever_socket);
                
                pthread_mutex_lock(&mutex);
                char notification[write_buffer_length];
                sprintf(notification, "16/%s/%s", sender, message);
                printf("Sending to %s; message: %s\n", reciever, notification);
                write(reciever_socket, notification, strlen(notification));
                
                printf("Message sent\n");
				
                pthread_mutex_unlock(&mutex);
            }

            else if (option == 17) {  // protocol to send the invitation
            /*
            Client Side (User A): This user already has a list of online users, and will have a button Send Invitation to send the invitation.
            17/UserA/UserB
            If the user B is online, the server will send a notification to the user B.
            17/UserA
            Then, sends a confirmation back to the user A.
            17/Invitation sent to UserB
            */
                printf("Send Invitation\n");
                p = strtok(NULL, "/");
                char sender[username_max_length];
                strcpy(sender, p);  // this is the username of the sender

                p = strtok(NULL, "/");
                char invitee[username_max_length];
                strcpy(invitee, p);  // this is the username of the invitee

                // First, we have to check if the invitee is online
                int invitee_socket = get_socket(&my_list, invitee);
                if (invitee_socket == -1) {
                    sprintf(response, "17/%s/Offline", invitee);
                }
                else {
                    sprintf(notification, "17/%s", sender);
                    write(invitee_socket, notification, strlen(notification));
                    sprintf(response, "17/Invitation sent to %s", invitee);
                }
                write(sock_conn, response, strlen(response));
            }

            else if (option == 18) { // protocol to handle invitation response
            /*
            Client Side (User B): A popup appears: UserA has invited you to play:
            - if (Accept(sends(18/UserA/UserB/Accept)))
            - else if (Decline(sends(18/UserA/UserB/Decline)))
            Then the server process this option 18, creates a game session and notify User A.
            */
                printf("Handle Invitation Response\n");
                p = strtok(NULL, "/");
                char sender[username_max_length];
                strcpy(sender, p);  // this is the username of the sender

                p = strtok(NULL, "/");
                char invitee[username_max_length];
                strcpy(invitee, p);  // this is the username of the invitee

                p = strtok(NULL, "/");
                char decision[10];
                strcpy(decision, p);  // this is the decision of the invitee: Accept or Decline.

                int sender_socket = get_socket(&my_list, sender);
                if (sender_socket == -1) {
                    sprintf(response, "18/%s/Offline", sender);
                    write(sock_conn, response, strlen(response));
                }
                else {
                    if (strcmp(decision, "Accept")== 0) {
                        sprintf(notification, "18/%s/Accepted", invitee);
                        write(sender_socket, notification, strlen(notification));

                        // Now, we add both players to a new game (room):
                        int sender_id = get_user_id(sender, conn);
                        int invitee_id = get_user_id(invitee, conn);
                        int game_id = get_last_id_partida(conn) + 1;
                        crear_sala(game_id, sender_id, response, conn);
                        join_sala(invitee, game_id, response, conn);
                    }
                    else if (strcmp(decision, "Decline") == 0) {
                        sprintf(notification, "18/%s/Declined", invitee);
                        write(sender_socket, notification, strlen(notification));
                    }
                    sprintf(response, "18/Response sent to %s", sender);
                    write(sock_conn, response, strlen(response));
                }
            }

   }
    close(sock_conn);
    mysql_close(conn);
    pthread_exit(NULL);
}



int main() {
    my_list.user_count = 0;
    pthread_t tid;
    int sockfd, new_sock;
    struct sockaddr_in server_addr, client_addr;
    socklen_t addr_len = sizeof(client_addr);

    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd == -1) {
        perror("Failed to create socket");
        exit(EXIT_FAILURE);
    }

    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = INADDR_ANY;
    server_addr.sin_port = htons(PORT);

    if (bind(sockfd, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        perror("Failed to bind socket");
        exit(EXIT_FAILURE);
    }

    if (listen(sockfd, 5) < 0) {
        perror("Failed to listen");
        exit(EXIT_FAILURE);
    }
    
	deletePartidas();

    printf("Waiting for connections on port %d...\n", PORT);

    while (1) {
        new_sock = accept(sockfd, (struct sockaddr *)&client_addr, &addr_len);
        if (new_sock < 0) {
            perror("Connection accept error");
            continue;
        }

        int *client_socket = malloc(sizeof(int));
        *client_socket = new_sock;
        pthread_create(&tid, NULL, attendClients, (void *)client_socket);
    }

    close(sockfd);
    return 0;
}

