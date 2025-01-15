using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Reflection.Emit;
using System.Text;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class inviteMenu : MonoBehaviour
{
    public Button userBtn;
    public TMP_Text errorBox;

    void Start()
    {
        string response;
        if (GlobalVariables.inviteJoin == "Invite") {
            errorBox.text = "Selecciona un usuario para invitar a tu sala.";
            response = GlobalVariables.SendRequest("7/"); // Solicita la lista de jugadores conectados
        }
        else {
            errorBox.text = "Selecciona una sala a la que unirte.";
            response = GlobalVariables.SendRequest("4/"); // Solicita la lista de partidas
            Debug.Log(response);
        }

        // Crear lista de jugadores conectados
        List<string> users = new List<string>(response.Split("/")); // 7/nPlayers/username1/username2/.../usernameN
        users.RemoveAt(0);
        Debug.Log(GlobalVariables.inviteJoin);
        // Crea un boton por cada usuario conectado
        for (int i = 1; i < users.Count; i++)
        {
            Debug.Log(users[i]);
            if (users[i] == "")
                continue;
            if (GlobalVariables.inviteJoin == "Invite" && users[i] == GlobalVariables.currentUsername)
                continue;
            if (GlobalVariables.inviteJoin == "Join" && Convert.ToInt32(users[i]) == GlobalVariables.idPartida)
                continue;
                
            GameObject newUserBtn = DefaultControls.CreateButton(new DefaultControls.Resources());
            userBtn = newUserBtn.GetComponent<Button>();
            userBtn.transform.SetParent(GameObject.Find("Canvas").transform);
            userBtn.transform.position = new Vector3(1920/2, 1080/2 + 475 - 75*i, 0);
            userBtn.GetComponent<RectTransform>().sizeDelta = new Vector2(1920, 75);
            userBtn.image.color = new Color32(255, 255, 255, 0);
            userBtn.GetComponentInChildren<Text>().text = users[i];
            userBtn.GetComponentInChildren<Text>().fontSize = 32;
            userBtn.GetComponentInChildren<Text>().color = new Color32(255, 255, 255, 255);
            userBtn.GetComponentInChildren<Text>().fontStyle = FontStyle.Bold;
            assignListener(userBtn, users[i]);
        }
    }
    
    private void assignListener(Button userBtn, string user)
    {
        userBtn.onClick.AddListener(() => userBtnClick(user));
    }

    // Vuelta al menu
    public void backClick()
    {
        SceneManager.LoadScene("MainMenu");
    }

    // Unirse a sala
    private void joinSala(string user) {
        string response = GlobalVariables.SendRequest($"14/{GlobalVariables.currentUsername}/{user}"); // Unirse a sala

        if (response == "14/Error") {
            errorBox.text = "Esa sala ya no existe.";
            return;
        }
        int nuevaID = Convert.ToInt32(response.Split("/")[1]);

        if (nuevaID == GlobalVariables.idPartida) {
            errorBox.text = "Ya estas en esa sala.";
            return;
        }

        GlobalVariables.SendRequest($"12/{GlobalVariables.idPartida}"); // Eliminar sala
        GlobalVariables.idPartida = nuevaID;
        Debug.Log($"Joining Game {GlobalVariables.idPartida}");
        GlobalVariables.joinedGame = true;
        SceneManager.LoadScene("MainMenu");
    }

    // Invitar a sala
    private void inviteToSala(string user) {
        GlobalVariables.SendRequest($"21/{GlobalVariables.currentUsername}/{GlobalVariables.idPartida}/{user}"); // Invitar a sala
        Debug.Log($"Inviting {user} to Game {GlobalVariables.idPartida}");
        SceneManager.LoadScene("MainMenu");
    }

    // Click en boton de usuario
    public void userBtnClick(string user)
    {
        Debug.Log($"Clicked {user}");

        foreach (string player in GlobalVariables.players) {
            if (player.ToLower() == user.ToLower()) {
                if (GlobalVariables.inviteJoin == "Invite")
                    errorBox.text = $"{user} ya esta en tu sala.";
                else
                    errorBox.text = "Ya estas en esa sala.";
                return;
            }
        }

        Debug.Log(GlobalVariables.inviteJoin);
        if (GlobalVariables.inviteJoin == "Invite") 
            inviteToSala(user);
        else
            joinSala(user);
    }
}
