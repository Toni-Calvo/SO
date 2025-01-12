using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;

public class loginRegisterMenus : MonoBehaviour
{
    public TMP_InputField user, mail, passwrd, date;
    public TMP_Text errorBox;
    string username, password, email, birthdate;

    void Start()
    {
        GlobalVariables.games = new List<int>();
        // Para saber si el menu se carga en una sala de juego
        GlobalVariables.joinedGame = false;

        // Guarda el nombre de usuario
        if (GlobalVariables.registeredUsername != null)
            user.text = GlobalVariables.registeredUsername;
    }

    // Cierra el juego
    void quitGame()
    {
        Application.Quit();
    }

    // Cambia a la pantalla de registro
    public void moveToRegister()
    {
        GlobalVariables.registeredUsername = null;
        SceneManager.LoadSceneAsync("RegisterMenu");
    }

    // Cambia a la pantalla de login
    public void moveToLogin()
    {
        SceneManager.LoadSceneAsync("LoginMenu");
    }

    // Registra un nuevo usuario
    public void register()
    {
        if (setVariables(false))
        {
            Debug.Log($"Registered: {username}, {password}, {email}, {birthdate}.");
            string response = GlobalVariables.SendRequest($"3/{username}/{password}/{email}/{birthdate}"); // Registro
            if (response == "Registro")
            {
                GlobalVariables.registeredUsername = username;
                SceneManager.LoadSceneAsync("LoginMenu");
            }
            else if (response == "Usuario existente")
            {
                errorBox.text = "Username already taken.";
            }
            else if (response == "Correo existente")
            {
                errorBox.text = "Mail already used.";
            }
            else
            {
                errorBox.text = "Incorrect date.";
            }
        }
        else
        {
            Debug.Log("Register Error");
            errorBox.text = "Please fill in the blanks!";
        }
    }

    // Inicia sesi�n
    public void login()
    {
        if (setVariables(true))
        {
            Debug.Log($"Logged: {username}, {password}.");
            string response = GlobalVariables.SendRequest($"1/{username}/{password}"); // Login
            Debug.Log(response);
            if (response == "Login")
            {
                GlobalVariables.currentUsername = username;
                SceneManager.LoadSceneAsync("MainMenu");
            }
            else
            {
                errorBox.text = "Username or Password incorrect.";
                passwrd.text = "";
            }
        }
        else
        {
            Debug.Log("Login Error");
            errorBox.text = "Please fill in the blanks!";
        }
    }

    // Establece las variables de usuario
    private bool setVariables(bool fromLogin)
    {
        if (fromLogin)
        {
            if ((user.text == "") || (passwrd.text == ""))
                return false;

            username = user.text;
            password = passwrd.text;
            return true;
        }
        else
        {
            if ((user.text == "" || (passwrd.text == "") || (mail.text == "") || (date.text == "")))
                return false;

            username = user.text;
            password = passwrd.text;
            email = mail.text;
            birthdate = date.text;
            return true;
        }
    }
}
