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
    while (i < list->user_count && !found) {
        if (strcmp(list->users[i].username, user) == 0) {
            found = 1;
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
    printf("Result: %s\n", result);
    pthread_mutex_unlock(&mutex);
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
    if (user_exists(name, conn) == 0) {
        sprintf(query, "DELETE FROM jugador WHERE username = '%s'", name);
        if (mysql_query(conn, query) != 0) {
            printf("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
            return -1;
        }
        return 0;
    }
    else {
        printf("User does not exist therefore can not be eliminated.\n");
        return -1;
    }
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


int info_sala(char username[username_max_length], char *result, MYSQL *conn) {
    MYSQL_RES *res;
    MYSQL_ROW row;
    char query[sql_query_max_length];
    strcpy(result, "9/");    // empty the result (initialize)
	strcat(result, username);
	strcat(result, "/");

    pthread_mutex_lock(&mutex);
    sprintf(query, "SELECT duracion FROM partidas WHERE (IDJugador1 IN (SELECT ID FROM jugador WHERE username='%s'))", username);    // 0: partida no iniciada, 1: partida en curso
    if (mysql_query (conn, query) != 0) {
        printf ("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        exit(1);
    }
    res = mysql_store_result(conn);
    row = mysql_fetch_row(res);
    if (strcmp(row[0], "0") == 0) {
        strcat(result, "0/");
    }
    else {
        strcat(result, "1/");
    }

    for (int i = 2; i < 5; i++) {
        sprintf(query, "SELECT username FROM jugador WHERE (ID IN (SELECT IDJugador%i FROM partidas WHERE (IDJugador1 IN (SELECT ID FROM jugador WHERE username='%s'))))", i, username);
        if (mysql_query (conn, query) != 0) {
            printf ("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
            exit(1);
        }
        res = mysql_store_result(conn);
        row = mysql_fetch_row(res);
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
    row = mysql_fetch_row(res);
    strcat(result, row[0]);
    strcat(result, "/");

    for (int i = 1; i < 5; i++) {
        sprintf(query, "SELECT p%i FROM partidas WHERE IDPartida='%s'", i, idPartida);  // Puntuaciones
        if (mysql_query (conn, query) != 0) {
            printf ("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
            exit(1);
        }
        res = mysql_store_result(conn);
        row = mysql_fetch_row(res);
        strcat(result, row[0]);
        strcat(result, "/");
    }
    pthread_mutex_unlock(&mutex);
}


int update_turn(char idPartida[id_max_length], char turno[10], MYSQL *conn) {
    char query[sql_query_max_length];
    pthread_mutex_lock(&mutex);
    sprintf(query, "UPDATE partidas SET duracion='%s' WHERE IDPartida='%s'", turno, idPartida);
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
    if (mysql_query (conn, query) != 0) {
        printf ("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        exit(1);
    }
    res = mysql_store_result(conn);
    row = mysql_fetch_row(res);
    strcat(response, row[0]);
    strcat(response, "/");
    strcat(response, row[1]);
    strcat(response, "/");
    strcat(response, row[2]);
    strcat(response, "/");
    strcat(response, row[3]);
    strcat(response, "/");
    strcat(response, row[4]);
    printf("Question: %s\n", response);
    return 0;
}


int delete_sala(char idPartida[id_max_length], MYSQL *conn) {
    char query[sql_query_max_length];
    pthread_mutex_lock(&mutex);
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


int create_sala(char name[username_max_length], char *response, MYSQL *conn) {
	printf("Creando sala");
    MYSQL_RES *res;
    MYSQL_ROW row;
    char query[sql_query_max_length];
    int id = get_last_id_partida(conn) + 1;
	printf("%i\n", id);
	int userID = get_user_id(name, conn);
    pthread_mutex_lock(&mutex);
    sprintf(query, "INSERT INTO partidas VALUES (%i, %i, NULL, NULL, NULL, '2000-01-01 12:00:00', 0, NULL, 0, 0, 0, 0)", id, userID);
    if (mysql_query(conn, query) != 0) {
        printf("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    pthread_mutex_unlock(&mutex);
    sprintf(response, "15/%i", id);
    return 0;
}


int find_sala(char username[username_max_length], MYSQL *conn) {
    char query[sql_query_max_length];
    MYSQL_RES *res;
    MYSQL_ROW row;
    pthread_mutex_lock(&mutex);
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
    pthread_mutex_unlock(&mutex);
    mysql_free_result(res);
    return atoi(row[0]);
}


int join_sala(char username[username_max_length], char userPartida[username_max_length], char *response, MYSQL *conn) {
    MYSQL_RES *res;
    MYSQL_ROW row;
    char query[sql_query_max_length];
    int id = get_user_id(username, conn);
    int idPartida = find_sala(userPartida, conn);
    sprintf(query, "UPDATE partidas SET IDJugador%i=%i WHERE IDPartida=%i", id, id, idPartida);
    if (mysql_query(conn, query) != 0) {
        printf("Error: %u %s\n", mysql_errno(conn), mysql_error(conn));
        return -1;
    }
    sprintf(response, "14/%i", idPartida);
    return 0;
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
        
        printf("Petition: %s\n", petition);

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
                stop = 1;    // stop the connection
                int i = 0;
                int sock[3000];
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

            }

            else if (option == 1) {       // Handle Login (connection)
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

            else if (option == 3) {        // Handle user registration
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

            
            else if (option == 5) {             // Update turn
                p = strtok(NULL, "/");
                strcpy(idPartida, p);
                p = strtok(NULL, "/");
                strcpy(turno, p);
                update_turn(idPartida, turno, conn);
                strcpy(response, "5/");
                write(sock_conn, response, strlen(response));
            }


            else if (option == 6) {           // Send all usernames in database
                getUsernames(total, conn);
                pthread_mutex_lock(&mutex);   // since in the function we are using the mutex, we have to lock it.
                sprintf(response, "6/%s", total);
                printf("The users are: %s\n", response);
                write(sock_conn, response, strlen(response));
                pthread_mutex_unlock(&mutex);  // unlock the mutex
            }


            else if (option == 7) {           
                // option 7 is to get the list of active users.
				char connectedPlayers[write_buffer_length];
                user_list(connectedPlayers);
                printf("Connected Players: %s\n", connectedPlayers);
                sprintf(response, "7/%s", connectedPlayers);
                printf("The active users are: %s\n", response);
                write(sock_conn, response, strlen(response));
            }


            else if (option == 8) {         // Get a question from the given cathegory
                p = strtok(NULL, "/");
                get_question(p, response, conn);
                write(sock_conn, response, strlen(response));
            }


            else if (option == 9) {         // Informacion de la sala
				p = strtok(NULL, "/");
				strcpy(username, p);
				int res = info_sala(username, response, conn);
				write(sock_conn, response, strlen(response));
            }

            
            else if (option == 10) {        // Iniciar partida
                p = strtok(NULL, "/");
                strcpy(idPartida, p);
                strcpy(turno, "1");
                update_turn(idPartida, turno, conn);
                strcpy(response, "10/");
                write(sock_conn, response, strlen(response));
            }


            else if (option == 11) {        // Informacion de la partida
                p = strtok(NULL, "/");
                strcpy(idPartida, p);
                int res = info_partida(idPartida, response, conn);
                write(sock_conn, response, strlen(response));
            }


            else if (option == 12) {        // Borrar sala
                p = strtok(NULL, "/");
                strcpy(idPartida, p);
                int res = delete_sala(idPartida, conn);
                strcpy(response, "12/");
                write(sock_conn, response, strlen(response));
            }


            else if (option == 13) {        // Sumar punto
                p = strtok(NULL, "/");
                strcpy(idPartida, p);
                p = strtok(NULL, "/");
                strcpy(username, p);
                sumar_punto(idPartida, username, conn);
                strcpy(response, "13/");
                write(sock_conn, response, strlen(response));
            }


            else if (option == 14) {        // Unirse a una sala
                p = strtok(NULL, "/");
                strcpy(username, p);
                char userPartida[username_max_length];
                p = strtok(NULL, "/");
                strcpy(userPartida, p);
                join_sala(username, userPartida, response, conn);
                write(sock_conn, response, strlen(response));
            }


            else if (option == 15) {        // Crear sala
                p = strtok(NULL, "/");
                strcpy(username, p);
				printf("user: %s\nResponse: '%s'\n", username, response);
                create_sala(username, response, conn);
                write(sock_conn, response, strlen(response));
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

