using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class endGame : MonoBehaviour
{
    public TMP_Text winnerLabel;
    public TMP_Text scoresLabel;
    public Camera cam;
    public float contador = 0.0f;

    // Start is called before the first frame update
    void Start()
    {
        // Texto del ganador de la partida
        winnerLabel.text = "The winner is " + GlobalVariables.ganador;
        // Cambia el color de la camara dependiendo del ganador
        if (GlobalVariables.ganador.ToLower() == GlobalVariables.currentUsername.ToLower())
            cam.backgroundColor = new Color(0.0f, 1.0f, 0.0f);
        else
            cam.backgroundColor = new Color(1.0f, 0.0f, 0.0f);

        // Muestra las puntuaciones de todos los jugadores
        scoresLabel.text = GlobalVariables.players[0] + ": " + GlobalVariables.scoreP1 + "\n" + GlobalVariables.players[1] + ": " + GlobalVariables.scoreP2;
        if (GlobalVariables.players.Count > 2)
        {
            scoresLabel.text += "\n" + GlobalVariables.players[2] + ": " + GlobalVariables.scoreP3;
            if (GlobalVariables.players.Count > 3)
            {
                scoresLabel.text += "\n" + GlobalVariables.players[3] + ": " + GlobalVariables.scoreP4;
            }
        }
    }
    void Update()
    {
        contador += Time.deltaTime;
        if (contador >= 10)
        {
            returnToMainMenu();
        }
    }

    public void returnToMainMenu()
    {
        GlobalVariables.initializeVariables();
        GlobalVariables.joinedGame = false;
        SceneManager.LoadScene("MainMenu");
    }

}
