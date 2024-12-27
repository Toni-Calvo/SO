using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Reflection.Emit;
using System.Text;
using TMPro;
using UnityEditor.PackageManager;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class inviteMenu : MonoBehaviour
{
    public Button userBtn;
    public TextMeshPro errorBox;

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

        // Crea un boton por cada usuario conectado
        for (int i = 1; i < users.Count; i++)
        {
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
        SceneManager.LoadSceneAsync("MainMenu");
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

        GlobalVariables.idPartida = nuevaID;
        Debug.Log($"Joining Game {GlobalVariables.idPartida}");
        GlobalVariables.joinedGame = true;
        SceneManager.LoadSceneAsync("MainMenu");
    }

    // Invitar a sala
    private void inviteToSala(string user) {
        string response = GlobalVariables.SendRequest($"/{GlobalVariables.currentUsername}/{user}"); // Invitar a sala

        if (response == "4/Error") {
            errorBox.text = "Esa sala ya no existe.";
            return;
        }

        int nuevaID = Convert.ToInt32(response.Split("/")[1]);

        if (nuevaID == GlobalVariables.idPartida) {
            errorBox.text = "Ya estas en esa sala.";
            return;
        }

        GlobalVariables.idPartida = nuevaID;
        Debug.Log($"Inviting {user} to Game {GlobalVariables.idPartida}");
        GlobalVariables.joinedGame = true;
        SceneManager.LoadSceneAsync("MainMenu");
    }

    // Click en boton de usuario
    public void userBtnClick(string user)
    {
        Debug.Log($"Clicked {user}");
        if (user == GlobalVariables.currentUsername) {
            if (GlobalVariables.inviteJoin == "Invite")
                errorBox.text = "No puedes invitarte a ti mismo.";
            else
                errorBox.text = "Ya estas en esa sala.";
            return;
        }

        if (GlobalVariables.inviteJoin == "Invite") 
            inviteToSala(user);
        else
            joinSala(user);
    }
}
