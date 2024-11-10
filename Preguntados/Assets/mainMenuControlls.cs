using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;

public class mainMenuControlls : MonoBehaviour
{
    public TMP_Text p1;
    public TMP_Text p2;
    public TMP_Text p3;
    public TMP_Text p4;
    private float timer;


    void Start()
    {
        // Carga las categorias del juego
        GlobalVariables.loadCathegories();

        // Timer de escucha del servidor
        timer = 5;

        // Inicializacion del turno, estado del juego y racha
        GlobalVariables.inGame = false;
        GlobalVariables.turn = 0;
        GlobalVariables.racha = 0;

        // Comprueba si viene del login
        if (!GlobalVariables.joinedGame)
        {
            string response = GlobalVariables.SendRequest($"15/{GlobalVariables.currentUsername}"); // Crear sala
            GlobalVariables.idPartida = Convert.ToInt32(response.Split("/")[1]);
            GlobalVariables.players = new List<string> { GlobalVariables.currentUsername };
        }
        // Se ha unido a una sala
        else
            escuchaServidor();

        actualizaLabels();
    }

    void Update()
    {
        timer -= Time.deltaTime;
        // Escucha del servidor
        if (timer <= 0)
            escuchaServidor();
    }

    // Actualiza las personas en sala
    private void actualizaLabels()
    {
        p1.text = $"P1: {GlobalVariables.players[0]}";
        if (GlobalVariables.players.Count > 1)
        {
            p2.text = $"P2: {GlobalVariables.players[1]}";
            if (GlobalVariables.players.Count > 2)
            {
                p3.text = $"P3: {GlobalVariables.players[2]}";
                if (GlobalVariables.players.Count > 3)
                    p4.text = $"P4: {GlobalVariables.players[3]}";
            }
        }
    }

    // Cambia a la pantalla de invitacion
    public void listConnected()
    {
        escuchaServidor();
        if (GlobalVariables.players.Count == 1)
        {
            GlobalVariables.SendRequest($"12/{GlobalVariables.idPartida}"); // Eliminar sala
            SceneManager.LoadSceneAsync("InviteMenu");
        }
    }

    // Inicia el juego
    public void play()
    {
        if (GlobalVariables.players.Count > 1)
        {
            string response = GlobalVariables.SendRequest($"10/"); // Iniciar la partida
            if (response == "Game Started")
            {
                GlobalVariables.loadScores();
                SceneManager.LoadSceneAsync("Ruleta");
            }
        }
    }

    // Solicita la lista de jugadores en la sala y si ha iniciado partida
    private void escuchaServidor()
    {
        timer = 5;

        Debug.Log("Escuchando servidor");
        string response = GlobalVariables.SendRequest($"9/{GlobalVariables.players[0]}"); // Solicitar lista de jugadores en la sala + juego iniciado -> 0: no , 1: si / jugadores

        Debug.Log(response);
        // Juego iniciado por el host de la sala (P1)
        if (response.Split("/")[0] == "1")
        {
            GlobalVariables.loadScores();
            SceneManager.LoadSceneAsync("Ruleta");
        }

        // Actualiza la lista de jugadores en la sala
        GlobalVariables.players = new List<string>(response.Split("/"));
        GlobalVariables.players.RemoveAt(0);    // Elimina el 9
        GlobalVariables.players.RemoveAt(0);    // Elimina el estado de la partida (0,1)
        actualizaLabels();
    }

    // Desconectar y volver al Login
    public void disconnect()
    {
        GlobalVariables.SendRequest("0/"); // Desconectar
        GlobalVariables.joinedGame = false;
        SceneManager.LoadSceneAsync("LoginMenu");
    }
}