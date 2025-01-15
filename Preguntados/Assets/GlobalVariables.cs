using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Sockets;
using System.Text;
using UnityEngine;

public class GlobalVariables : MonoBehaviour
{
    /*
     Este archivo sirve para funciones y variables necesitadas en todas las escenas del juego 
    */
    
    public const string serverIP = "10.4.119.5";
    public const int serverPort = 50080;
    public static int maxRacha = 1; // Entra a ruleta
    public static int maxPuntuacion = 3; // Entra a ruleta
    private static TcpClient client;
    public static List<partida> games;// Entra a MainMenu
    public static string registeredUsername; // Entra a login
    public static string currentUsername; // Entra a mainMenu
    public static List<string> cathegories; // Entra a ruleta
    public static bool joinedGame; // Entra a mainMenu
    public static string inviteQuery; // Entra a invitation
    public static int idPartida; // Entra a mainMenu
    public static string currentQuestion; // Entra a pregunta
    public static string currentA1; // Entra a pregunta
    public static string currentA2; // Entra a pregunta
    public static string currentA3; // Entra a pregunta
    public static string currentA4; // Entra a pregunta
    public static List<string> players; // Entra a mainMenu y ruleta
    public static int scoreP1; // Entra a ruleta
    public static int scoreP2; // Entra a ruleta
    public static int scoreP3; // Entra a ruleta
    public static int scoreP4; // Entra a ruleta
    public static bool correct; // Entra a ruleta
    public static bool inGame; // Entra a ruleta
    public static int turn; // Entra a ruleta
    public static int racha; // Entra a ruleta
    public static bool ruletaLock; // Entra a ruleta
    public static string inviteJoin; // Entra a mainMenu
    public static string ganador; // Entra a endGame


    public static void firstStart() {
        games = new List<partida>();
    }
    
    public static void setActualGame(int id)
    {
        for (int i = 0; i < games.Count; i++)
        {
            if (games[i].idPartida == id)
            {
                saveGame();
                loadGame(i);
                games.RemoveAt(i);
                break;
            }
        }
    }


    public static void saveGame() {
        partida game = new partida();
        game.idPartida = idPartida;
        game.currentQuestion = currentQuestion;
        game.currentA1 = currentA1;
        game.currentA2 = currentA2;
        game.currentA3 = currentA3;
        game.currentA4 = currentA4;
        game.players = players;
        game.scoreP1 = scoreP1;
        game.scoreP2 = scoreP2;
        game.scoreP3 = scoreP3;
        game.scoreP4 = scoreP4;
        game.correct = correct;
        game.inGame = inGame;
        game.turn = turn;
        game.racha = racha;
        game.ruletaLock = ruletaLock;
        game.inviteJoin = inviteJoin;
        game.ganador = ganador; 
        games.Add(game);
    }

    public static void loadGame(int index) {
        partida game = games[index];
        idPartida = game.idPartida;
        currentQuestion = game.currentQuestion;
        currentA1 = game.currentA1;
        currentA2 = game.currentA2;
        currentA3 = game.currentA3;
        currentA4 = game.currentA4;
        players = game.players;
        scoreP1 = game.scoreP1;
        scoreP2 = game.scoreP2;
        scoreP3 = game.scoreP3;
        scoreP4 = game.scoreP4;
        correct = game.correct;
        inGame = game.inGame;
        turn = game.turn;
        racha = game.racha;
        ruletaLock = game.ruletaLock;
        inviteJoin = game.inviteJoin;
        ganador = game.ganador;
    }

    // Inicia todas las puntuaciones de los jugadores en falso (inicio de partida)
    public static void loadScores()
    {
        GlobalVariables.scoreP1 = 0;
        GlobalVariables.scoreP2 = 0;
        GlobalVariables.scoreP3 = 0;
        GlobalVariables.scoreP4 = 0;
    }

    // Inicializacion del turno, estado del juego, racha y puntuacion maxima
    public static void initializeVariables()
    {
        GlobalVariables.inGame = false;
        GlobalVariables.turn = 0;
        GlobalVariables.racha = 0;
        GlobalVariables.correct = false;
        GlobalVariables.ruletaLock = false;
    }

    // Carga las categorias de las preguntas
    public static void loadCathegories()
    {
        GlobalVariables.cathegories = new List<string>();
        GlobalVariables.cathegories.Add("Historia");
        GlobalVariables.cathegories.Add("Geografia");
        GlobalVariables.cathegories.Add("Ciencia");
        GlobalVariables.cathegories.Add("Arte");
        GlobalVariables.cathegories.Add("Entretenimiento");
    }

    // Envia una solicitud al servidor y recibe una respuesta
    public static string SendRequest(string request)
    {
        try
        {
            // Conectar al servidor
            client = new TcpClient(serverIP, serverPort);
            NetworkStream stream = client.GetStream();

            // Enviar solicitud al servidor
            byte[] data = Encoding.ASCII.GetBytes(request);
            stream.Write(data, 0, data.Length);

            // Leer respuesta del servidor
            byte[] buffer = new byte[1024];
            int bytesRead = stream.Read(buffer, 0, buffer.Length);
            string response = Encoding.ASCII.GetString(buffer, 0, bytesRead);

            // Cerrar conexi�n
            stream.Close();
            client.Close();

            return response;
        }
        catch (Exception ex)
        {
            return $"Error: {ex}.";
        }
    }
}