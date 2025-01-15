using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;

public class invitation : MonoBehaviour
{
    public TMP_Text label;
    string[] trozos;
    // Start is called before the first frame update
    void Start()
    {
        trozos = GlobalVariables.inviteQuery.Split("/");
        label.text = $"El  usuario {trozos[2]} te ha invitado a su partida. ¿Deseas unirte?";
    }

    public void aceptar()
    {
        string response = GlobalVariables.SendRequest($"14/{GlobalVariables.currentUsername}/{trozos[1]}"); // Unirse a sala
        GlobalVariables.SendRequest($"12/{GlobalVariables.idPartida}"); // Eliminar sala
        GlobalVariables.idPartida = Convert.ToInt32(trozos[1]);
        Debug.Log($"Joining Game {GlobalVariables.idPartida}");
        GlobalVariables.joinedGame = true;
        SceneManager.LoadScene("MainMenu");
    }

    public void rechazar()
    {
        SceneManager.LoadScene("MainMenu");
    }
}
