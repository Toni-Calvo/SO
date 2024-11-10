using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Diagnostics.CodeAnalysis;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class pregunta : MonoBehaviour
{
    public TMP_Text tipoPregunta;
    public TMP_Text p1;
    public TMP_Text p2;
    public TMP_Text p3;
    public TMP_Text p4;
    public Button pregunta_Btn;
    private float timer;
    private float refreshTimer;
    private float contLabel;
    private bool condition;
    private int selectedType;

    void Start()
    {
        // Escribe a los jugadores en la sala
        setLabels();

        // Inicializa los timers
        timer = 5;  // ruleta
        contLabel = 0; // ruleta

        tipoPregunta.text = "";

        // Desactiva la ruleta
        condition = false;

        // Viene de preguntaMenu
        if (GlobalVariables.inGame)
        {
            // Mantener turno + sumar racha
            if (GlobalVariables.correct)
            {
                GlobalVariables.correct = false;
                // Sumar racha
                if (GlobalVariables.racha != 3)
                    GlobalVariables.racha++;
                // Sumar score
                else
                {
                    GlobalVariables.SendRequest($"13/{GlobalVariables.idPartida}/{GlobalVariables.turn + 1}"); // sumar puntuacion -> 13/idPartida/username
                    // no espero respuesta
                    escuchaServidor();
                }

            }
            else
            {
                if (GlobalVariables.players.Count == GlobalVariables.turn + 1)
                    GlobalVariables.turn = 0;
                else
                    GlobalVariables.turn++;

                GlobalVariables.racha = 0;
                GlobalVariables.SendRequest($"5/{GlobalVariables.idPartida}/{GlobalVariables.turn}"); // Cambiar turno -> 5/idPartida
            }
        }

        escuchaServidor();
        // Activa el boton de pregunta para la persona que tenga el turno
        if (GlobalVariables.players[GlobalVariables.turn] == GlobalVariables.currentUsername)
            pregunta_Btn.gameObject.SetActive(true);
    }

    void Update()
    {
        // Activar la ruleta
        if (condition)
            activarRuleta();
        // Escucha del servidor
        else 
        { 
            refreshTimer -= Time.deltaTime;
            if (refreshTimer < 0)
                escuchaServidor();
        }

        
    }

    // Actualiza el estado de la partida (turno + scores)
    private void escuchaServidor()
    {
        refreshTimer = 5;
        
        string response = GlobalVariables.SendRequest($"11/{GlobalVariables.idPartida}"); // Solicitar puntuaciones + turno -> turno/nQuesitosPlayer1/nQuesitosPlayer2/nQuesitosPlayer3/nQuesitosPlayer4

        // Si cambia de turno actualiza los scores
        if (GlobalVariables.turn != Convert.ToInt32(response.Split("/")[1]) - 1)
        {
            GlobalVariables.turn = Convert.ToInt32(response.Split("/")[1]) - 1;
            actualizaScores(response);
            setLabels();
        }
    }

    // Actualiza las puntuaciones de los jugadores
    private void actualizaScores(string response)
    {
        GlobalVariables.scoreP1 = Convert.ToInt32(response.Split("/")[1]);
        GlobalVariables.scoreP1 = Convert.ToInt32(response.Split("/")[2]);
        if (GlobalVariables.players.Count > 2)
        {
            GlobalVariables.scoreP3= Convert.ToInt32(response.Split("/")[3]);
            if (GlobalVariables.players.Count > 3)
            {
                GlobalVariables.scoreP4 = Convert.ToInt32(response.Split("/")[4]);
            }
        }
    }

    // Girar la ruleta + pedir pregunta -> cambio a preguntaMenu
    private void activarRuleta()
    {
        timer -= Time.deltaTime; // 5 segundos para cambiar a preguntaMenu
        contLabel += Time.deltaTime; // intervalo de 0.5 segundos para simular giro de la ruleta

        // Cambiar a preguntaMenu
        if (timer <= 0)
        {
            SceneManager.LoadSceneAsync("preguntaMenu");
        }
        // Fijar el tipo de pregunta
        else if (timer <= 2)
        {
            tipoPregunta.text = GlobalVariables.cathegories[selectedType];
        }
        // Simular giro de ruleta
        else if (contLabel >= 0.5)
        {
            if (tipoPregunta.text == "Historia")
            {
                tipoPregunta.text = "Geograf�a";
            }
            else if (tipoPregunta.text == "Geograf�a")
            {
                tipoPregunta.text = "Ciencia";
            }
            else if (tipoPregunta.text == "Ciencia")
            {
                tipoPregunta.text = "Arte";
            }
            else if (tipoPregunta.text == "Arte")
            {
                tipoPregunta.text = "Entretenimiento";
            }
            else if (tipoPregunta.text == "Entretenimiento")
            {
                tipoPregunta.text = "Historia";
            }
        }
    }

    // Escribe a los jugadores + sus puntuaciones
    private void setLabels()
    {
        p1.text = GlobalVariables.players[0] + $"{GlobalVariables.scoreP1}/5";
        p2.text = GlobalVariables.players[1] + $"{GlobalVariables.scoreP2}/5";

        if (GlobalVariables.players.Count > 2)
        {
            p3.text = GlobalVariables.players[2] + $"{GlobalVariables.scoreP3}/5";
            if (GlobalVariables.players.Count > 3)
            {
                p4.text = GlobalVariables.players[3] + $"{GlobalVariables.scoreP4}/5";
            }
            else
            {
                p4.gameObject.SetActive(false);
            }
        }
        else
        {
            p3.gameObject.SetActive(false);
            p4.gameObject.SetActive(false);
        }
    }

    // Activar el giro de la ruleta + solicitar pregunta
    public void preguntaClick()
    {
        // Girar ruleta
        condition = true;
        // Desactivar boton de pregunta
        pregunta_Btn.gameObject.SetActive(false);
        tipoPregunta.text = "Historia";

        // Escoger tipo de pregunta al azar
        selectedType = UnityEngine.Random.Range(0, GlobalVariables.cathegories.Count);
        string response = GlobalVariables.SendRequest($"8/{GlobalVariables.cathegories[selectedType]}"); // Solicitar pregunta
        // Guardar pregunta y respuestas
        GlobalVariables.currentQuestion = response.Split("/")[0];
        GlobalVariables.currentA1 = response.Split("/")[1];
        GlobalVariables.currentA2 = response.Split("/")[2];
        GlobalVariables.currentA3 = response.Split("/")[3];
        GlobalVariables.currentA4 = response.Split("/")[4];
    }
}
