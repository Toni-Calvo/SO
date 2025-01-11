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
    
    public const string serverIP = "192.168.56.102";
    public const int serverPort = 8080;
    public static int maxRacha = 1; // Entra a ruleta
    public static int maxPuntuacion = 1; // Entra a ruleta
    private static TcpClient client;
    public static List<int> games; // Entra a MainMenu
    public static string registeredUsername; // Entra a login
    public static string currentUsername; // Entra a mainMenu
    public static bool joinedGame; // Entra a mainMenu
    public static int idPartida; // Entra a mainMenu
    public static string currentQuestion; // Entra a pregunta
    public static string currentA1; // Entra a pregunta
    public static string currentA2; // Entra a pregunta
    public static string currentA3; // Entra a pregunta
    public static string currentA4; // Entra a pregunta
    public static List<string> players; // Entra a mainMenu y ruleta
    public static List<string> cathegories; // Entra a ruleta
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

    // Inicia todas las puntuaciones de los jugadores en falso (inicio de partida)
    public static void loadScores()
    {
        scoreP1 = 0;
        scoreP2 = 0;
        scoreP3 = 0;
        scoreP4 = 0;
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

    // Inicializacion del turno, estado del juego, racha y puntuacion maxima
    public static void initializeVariables()
    {
        GlobalVariables.inGame = false;
        GlobalVariables.turn = 0;
        GlobalVariables.racha = 0;
        GlobalVariables.correct = false;
        GlobalVariables.ruletaLock = false;
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
