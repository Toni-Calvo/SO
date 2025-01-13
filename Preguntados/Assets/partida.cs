using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class partida : MonoBehaviour
{
    public int idPartida; // Entra a mainMenu
    public string currentQuestion; // Entra a pregunta
    public string currentA1; // Entra a pregunta
    public string currentA2; // Entra a pregunta
    public string currentA3; // Entra a pregunta
    public string currentA4; // Entra a pregunta
    public List<string> players; // Entra a mainMenu y ruleta
    public int scoreP1; // Entra a ruleta
    public int scoreP2; // Entra a ruleta
    public int scoreP3; // Entra a ruleta
    public int scoreP4; // Entra a ruleta
    public bool correct; // Entra a ruleta
    public bool inGame; // Entra a ruleta
    public int turn; // Entra a ruleta
    public int racha; // Entra a ruleta
    public bool ruletaLock; // Entra a ruleta
    public string inviteJoin; // Entra a mainMenu
    public string ganador; // Entra a endGame

}

    
