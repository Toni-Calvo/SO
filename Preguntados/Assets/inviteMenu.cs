using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;
using UnityEditor.PackageManager;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class inviteMenu : MonoBehaviour
{
    public Button userBtn;

    void Start()
    {
        string response = GlobalVariables.SendRequest("7/"); // Solicita la lista de jugadores conectados
        Debug.Log(response);

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
            userBtn.onClick.AddListener(() => userBtnClick(userBtn));
        }
    }
    
    // Vuelta al menu
    public void backClick()
    {
        SceneManager.LoadSceneAsync("MainMenu");
    }

    public void userBtnClick(Button btn)
    {
        Debug.Log($"Clicked {btn.GetComponentInChildren<Text>().text}");
        if (btn.GetComponentInChildren<Text>().text == GlobalVariables.currentUsername)
            return;

        GlobalVariables.SendRequest("14/"); // Unirse a sala
        GlobalVariables.joinedGame = true;
        SceneManager.LoadSceneAsync("MainMenu");
    }
}
