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
    public Camera cam;
    private float timer;
    private float refreshTimer;
    private float contLabel;
    private bool condition;
    private int selectedType;
    public Button game1Btn;
    public Button game2Btn;
    public Button game3Btn;
    public Button newgame;

    void Start()
    {
        // Escribe a los jugadores en la sala
        setLabels();
        iniciaBotones();

        cam.backgroundColor = new Color(0.188f, 0.2961f, 0.47f, 0f);

        // Inicializa los timers
        timer = 5;  // ruleta
        contLabel = 0; // ruleta

        tipoPregunta.text = "";

        // Desactiva la ruleta
        condition = false;


        // Evitar multiples ejecuciones de la funcion
        if (GlobalVariables.ruletaLock)
            return;

        GlobalVariables.ruletaLock = true;

        // Viene de preguntaMenu
        if (GlobalVariables.inGame)
        {
            Debug.Log("InGame");
            // Mantener turno + sumar racha
            if (GlobalVariables.correct)
            {
                Debug.Log("Correct");
                GlobalVariables.correct = false;
                // Sumar racha
                if (GlobalVariables.racha != GlobalVariables.maxRacha)
                    GlobalVariables.racha++;
                // Sumar score
                else
                {
                    GlobalVariables.racha = 0;
                    GlobalVariables.SendRequest($"13/{GlobalVariables.idPartida}/{GlobalVariables.turn + 1}"); // sumar puntuacion -> 13/idPartida/username
                    Debug.Log("Sumar puntuacion");
                    // no espero respuesta
                    escuchaServidor();
                }

            }
            else
            {
                Debug.Log($"Incorrect, Actual Turn {GlobalVariables.turn}");
                if (GlobalVariables.players.Count == GlobalVariables.turn + 1)
                    GlobalVariables.turn = 0;
                else
                    GlobalVariables.turn++;

                GlobalVariables.racha = 0;
                Debug.Log($"Changing turn to: {GlobalVariables.turn}");
                GlobalVariables.SendRequest($"5/{GlobalVariables.idPartida}/{GlobalVariables.turn + 1}"); // Cambiar turno -> 5/idPartida/nuevoTurno
            }
        }

        GlobalVariables.inGame = true;

        setLabels();
        escuchaServidor();
        // Activa el boton de pregunta para la persona que tenga el turno
        if (GlobalVariables.players[GlobalVariables.turn].ToLower() == GlobalVariables.currentUsername.ToLower())
            pregunta_Btn.gameObject.SetActive(true);
        else
            pregunta_Btn.gameObject.SetActive(false);
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
    
    // Inicia los botones de la mecanica multipartida
    private void iniciaBotones() {
        newgame.gameObject.SetActive(true);
        game1Btn.gameObject.SetActive(false);
        game2Btn.gameObject.SetActive(false);
        game3Btn.gameObject.SetActive(false);
        if (GlobalVariables.games.Count > 0)
        {
            game1Btn.gameObject.SetActive(true);
            game1Btn.GetComponentInChildren<TMP_Text>().text = $"{GlobalVariables.games[0].idPartida}";
            if (GlobalVariables.games.Count > 1)
            {
                game2Btn.gameObject.SetActive(true);
                game2Btn.GetComponentInChildren<TMP_Text>().text = $"{GlobalVariables.games[1].idPartida}";
                if (GlobalVariables.games.Count > 2)
                {
                    game3Btn.gameObject.SetActive(true);
                    newgame.gameObject.SetActive(false);
                    game3Btn.GetComponentInChildren<TMP_Text>().text = $"{GlobalVariables.games[2].idPartida}";
                }
            }
        }
    }

    // cambia de partida
    public void changeGame()
    {
        GlobalVariables.setActualGame(Convert.ToInt32(UnityEngine.EventSystems.EventSystem.current.currentSelectedGameObject.GetComponentInChildren<TMP_Text>().text));
        SceneManager.LoadScene("MainMenu");
    }

    public void newgameClick()
    {
        GlobalVariables.saveGame();
        GlobalVariables.joinedGame = false; // Crea una nueva partida
        SceneManager.LoadScene("MainMenu");
    }

    // Actualiza el estado de la partida (turno + scores)
    private void escuchaServidor()
    {
        refreshTimer = 1;
        
        string response = GlobalVariables.SendRequest($"11/{GlobalVariables.idPartida}"); // Solicitar puntuaciones + turno -> turno/nQuesitosPlayer1/nQuesitosPlayer2/nQuesitosPlayer3/nQuesitosPlayer4
        Debug.Log(response);

        // Si cambia de turno actualiza los scores
        if (GlobalVariables.turn != Convert.ToInt32(response.Split("/")[1]) - 1)
            GlobalVariables.turn = Convert.ToInt32(response.Split("/")[1]) - 1;

        if (GlobalVariables.players[GlobalVariables.turn].ToLower() == GlobalVariables.currentUsername.ToLower())
            pregunta_Btn.gameObject.SetActive(true);
        else
            pregunta_Btn.gameObject.SetActive(false);

        actualizaScores(response);
        setLabels();
        
    }

    // Actualiza las puntuaciones de los jugadores
    private void actualizaScores(string response)
    {
        GlobalVariables.scoreP1 = Convert.ToInt32(response.Split("/")[2]);
        GlobalVariables.scoreP2 = Convert.ToInt32(response.Split("/")[3]);
        if (GlobalVariables.scoreP1 == GlobalVariables.maxPuntuacion)
            acabaPartida(GlobalVariables.players[0]);
        if (GlobalVariables.scoreP2 == GlobalVariables.maxPuntuacion)
            acabaPartida(GlobalVariables.players[1]);
        if (GlobalVariables.players.Count > 2)
        {
            GlobalVariables.scoreP3 = Convert.ToInt32(response.Split("/")[4]);
            if (GlobalVariables.scoreP3 == GlobalVariables.maxPuntuacion)
                acabaPartida(GlobalVariables.players[2]);
            if (GlobalVariables.players.Count > 3)
            {
                GlobalVariables.scoreP4 = Convert.ToInt32(response.Split("/")[5]);
                if (GlobalVariables.scoreP4 == GlobalVariables.maxPuntuacion)
                    acabaPartida(GlobalVariables.players[3]);
            }
        }
    }

    private void acabaPartida(string player) 
    {
        GlobalVariables.ganador = player;
        SceneManager.LoadScene("EndGame");
    }

    // Girar la ruleta + pedir pregunta -> cambio a preguntaMenu
    private void activarRuleta()
    {
        timer -= Time.deltaTime; // 5 segundos para cambiar a preguntaMenu
        contLabel += Time.deltaTime; // intervalo de 0.5 segundos para simular giro de la ruleta

        // Cambiar a preguntaMenu
        if (timer <= 0)
        {
            SceneManager.LoadScene("Pregunta");
        }
        // Fijar el tipo de pregunta
        else if (timer <= 2)
        {
            tipoPregunta.text = GlobalVariables.cathegories[selectedType];
            cam.backgroundColor = getColor(selectedType);
        }
        // Simular giro de ruleta
        else if (contLabel >= 0.2)
        {
            contLabel = 0;
            if (tipoPregunta.text == "Historia")
            {
                tipoPregunta.text = "Geografia";
                cam.backgroundColor = Color.yellow;
            }
            else if (tipoPregunta.text == "Geografia")
            {
                tipoPregunta.text = "Ciencia";
                cam.backgroundColor = Color.green;
            }
            else if (tipoPregunta.text == "Ciencia")
            {
                tipoPregunta.text = "Arte";
                cam.backgroundColor = Color.red;
            }
            else if (tipoPregunta.text == "Arte")
            {
                tipoPregunta.text = "Entretenimiento";
                cam.backgroundColor = Color.magenta;
            }
            else
            {
                tipoPregunta.text = "Historia";
                cam.backgroundColor = Color.grey;
            }
        }
    }

    private Color getColor(int valor)
    {
        if (valor == 0)
            return Color.grey;
        else if (valor == 1)
            return Color.yellow;
        else if (valor == 2)
            return Color.green;
        else if (valor == 3)
            return Color.red;
        else
            return Color.magenta;
    }

    // Escribe a los jugadores + sus puntuaciones
    private void setLabels()
    {
        p1.text = $"{GlobalVariables.players[0]} {GlobalVariables.scoreP1}/3";
        p2.text = $"{GlobalVariables.players[1]} {GlobalVariables.scoreP2}/3";

        if (GlobalVariables.players.Count > 2)
        {
            p3.text = $"{GlobalVariables.players[2]} {GlobalVariables.scoreP3}/3";
            if (GlobalVariables.players.Count > 3)
            {
                p4.text = $"{GlobalVariables.players[3]} {GlobalVariables.scoreP4}/3";
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

        // Escoger tipo de pregunta al azar
        selectedType = UnityEngine.Random.Range(0, GlobalVariables.cathegories.Count);
        
        string response = GlobalVariables.SendRequest($"8/{GlobalVariables.cathegories[selectedType]}"); // Solicitar pregunta
        // Guardar pregunta y respuestas
        GlobalVariables.currentQuestion = response.Split("/")[1];
        GlobalVariables.currentA1 = response.Split("/")[2];
        GlobalVariables.currentA2 = response.Split("/")[3];
        GlobalVariables.currentA3 = response.Split("/")[4];
        GlobalVariables.currentA4 = response.Split("/")[5];
    }
}
