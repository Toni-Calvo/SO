using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class mainMenuControlls : MonoBehaviour
{
    public TMP_Text p1;
    public TMP_Text p2;
    public TMP_Text p3;
    public TMP_Text p4;
    public TMP_Text info;
    private float updateTimer;
    private float inboxTimer;
    public TMP_Text GameIDLbl;
    public TMP_Text chat;
    public TMP_InputField chatInput;


    void Start()
    {
        // Timer de escucha del servidor
        updateTimer = 1;
        inboxTimer = 1.5F;
        
        // Carga las categorias del juego
        GlobalVariables.loadCathegories();

        info.text = "";

        // Inicializacion del turno, estado del juego y racha
        GlobalVariables.initializeVariables();

        // Comprueba si viene del login
        if (!GlobalVariables.joinedGame)
        {
            string response = GlobalVariables.SendRequest($"15/{GlobalVariables.currentUsername}"); // Crear sala
            Debug.Log($"New game: {response}");
            GlobalVariables.idPartida = Convert.ToInt32(response.Split("/")[1]);
            GlobalVariables.players = new List<string>();
            GlobalVariables.players.Add(GlobalVariables.currentUsername);
            GlobalVariables.games.Add(GlobalVariables.idPartida);
        }
        // Se ha unido a una sala
        else
            escuchaServidor();
        
        actualizaLabels();
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Return))
            SendChat();

        updateTimer -= Time.deltaTime;
        inboxTimer -= Time.deltaTime;
        // Escucha del servidor
        if (updateTimer <= 0)
        {
            escuchaServidor();
            actualizaLabels();
        }
        if (inboxTimer <= 0)
        {
            actualizaChat();
            inboxTimer = 1;
        }
    }

    private void actualizaChat()
    {
        string response = GlobalVariables.SendRequest($"19/{GlobalVariables.currentUsername}"); // Recibir mensajes del chat
        Debug.Log(response);
        string[] trozos = response.Split("/");
        for (int i = 0; i < Convert.ToInt32(trozos[1]); i++)
        {
            chat.text += $"[{trozos[2*i + 2]}]: {trozos[2*i + 3]}\n";
        }
    }

    // Actualiza las personas en sala
    private void actualizaLabels()
    {
        GameIDLbl.text = $"Game ID: {GlobalVariables.idPartida}";
        p1.text = $"P1: {GlobalVariables.players[0]}";

        if (GlobalVariables.players.Count > 1)
        {
            p2.text = $"P2: {GlobalVariables.players[1]}";
            if (GlobalVariables.players.Count > 2)
            {
                p3.text = $"P3: {GlobalVariables.players[2]}";
                if (GlobalVariables.players.Count > 3)
                    p4.text = $"P4: {GlobalVariables.players[3]}";
                else
                    p4.text = "";
            }
            else
            {
                p3.text = "";
                p4.text = "";
            }
        }
        else
        {
            p2.text = "";
            p3.text = "";
            p4.text = "";
        }
    }

    // Envia un mensaje al chat
    private void SendChat(){
        if (chatInput.text != "" || chatInput.text != " ")
        {
            for (int i = 0; i < GlobalVariables.players.Count; i++)
            {
                Debug.Log($"16/{GlobalVariables.currentUsername}/{GlobalVariables.players[i]}/{chatInput.text}");
                GlobalVariables.SendRequest($"16/{GlobalVariables.currentUsername}/{GlobalVariables.players[i]}/{chatInput.text}");
            }
            chatInput.text = "";
        }
    }

    // Cambia a la pantalla de join
    public void joinClicked()
    {
        escuchaServidor();
        if (GlobalVariables.players.Count > 1)
        {
            info.text = "Vacia la sala antes de unirte";
            return;
        }
        GlobalVariables.SendRequest($"12/{GlobalVariables.idPartida}"); // Eliminar sala
        GlobalVariables.inviteJoin = "Join";
        SceneManager.LoadScene("InviteMenu");
    }

    public void inviteClicked()
    {
        escuchaServidor();
        if (GlobalVariables.players.Count == 4)
        {
            info.text = "Sala llena";
            return;
        }
        GlobalVariables.inviteJoin = "Invite";
        SceneManager.LoadScene("InviteMenu");
    }

    // Inicia el juego
    public void play()
    {
        escuchaServidor();
        if (GlobalVariables.currentUsername.ToLower() == GlobalVariables.players[0].ToLower())
        {
            Debug.Log("User is host");
            Debug.Log(GlobalVariables.players.Count);
            Debug.Log(GlobalVariables.players[0]);
            if (GlobalVariables.players.Count > 1)
            {
                string response = GlobalVariables.SendRequest($"10/{GlobalVariables.idPartida}"); // Iniciar la partida
                Debug.Log(response);
                if (response == "10/Game Started")
                {
                    GlobalVariables.loadScores();
                    SceneManager.LoadScene("Ruleta");
                }
            }
            else
                info.text = "Se necesitan 2 jugadores";
        }
        else
            info.text = "El host inicia el juego";
    }

    // Solicita la lista de jugadores en la sala y si ha iniciado partida
    private void escuchaServidor()
    {
        updateTimer = 1;

        Debug.Log("Escuchando servidor ID: " + GlobalVariables.idPartida);
        string response = GlobalVariables.SendRequest($"9/{GlobalVariables.idPartida}"); // Solicitar lista de jugadores en la sala + juego iniciado -> 0: no , 1: si / jugadores

        Debug.Log(response);
        // Juego iniciado por el host de la sala (P1)
        if (response.Split("/")[1] == "1")
        {
            GlobalVariables.loadScores();
            SceneManager.LoadScene("Ruleta");
        }

        // Actualiza la lista de jugadores en la sala
        GlobalVariables.players = new List<string>(response.Split("/"));
        GlobalVariables.players.RemoveAt(0);    // Elimina el 9
        GlobalVariables.players.RemoveAt(0);    // Elimina el estado de la partida (0,1)
        GlobalVariables.players.RemoveAt(GlobalVariables.players.Count - 1);    // Elimina el ultimo
    }

    // Desconectar y volver al Login
    public void disconnect()
    {
        GlobalVariables.SendRequest($"0/{GlobalVariables.currentUsername}/{GlobalVariables.idPartida}"); // Desconectar
        GlobalVariables.joinedGame = false;
        SceneManager.LoadScene("LoginMenu");
    }
}