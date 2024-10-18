using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;
using TMPro;
using UnityEditor.PackageManager;
using UnityEngine;
using UnityEngine.SceneManagement;

public class loginRegisterMenus : MonoBehaviour
{
    public TMP_InputField user, mail, passwrd, date;
    public TMP_Text errorBox;
    string username, password, email, birthdate;
    private const string serverIp = "192.168.56.102"; // IP del servidor
    private const int serverPort = 8080; // Puerto del servidor
    private TcpClient client;
    IPEndPoint endpoint;

    public void quitGame()
    {
        Application.Quit();
    }

    public void moveToRegister()
    {
        SceneManager.LoadSceneAsync("RegisterMenu");
    }

    public void moveToLogin()
    {
        SceneManager.LoadSceneAsync("LoginMenu");
    }

    public void register()
    {
        if (setVariables(false))
        {
            Debug.Log($"Registered: {username}, {password}, {email}, {birthdate}.");
            string request = $"3/{username}/{password}/{email}/{birthdate}";
            string response = SendRequest(request);
            if (response == "Registro")
            {
                // Registro
            }
            else if (response == "Usuario existente")
            {
                errorBox.text = "Username already taken.";
            }
            else if (response == "Correo existente")
            {
                errorBox.text = "Mail already used.";
            }
        }
        else
        {
            Debug.Log("Register Error");
            errorBox.text = "Please fill in the blanks!";
        }
    }

    public void login()
    {
        if (setVariables(true))
        {
            Debug.Log($"Logged: {username}, {password}.");
            string request = $"1/{username}/{password}";
            string response = SendRequest(request);
            if (response == "Login")
            {
                // Logear
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

    public string SendRequest(string request)
    {
        try
        {
            // Conectar al servidor
            client = new TcpClient(serverIp, serverPort);
            NetworkStream stream = client.GetStream();

            // Enviar solicitud al servidor
            byte[] data = Encoding.ASCII.GetBytes(request);
            stream.Write(data, 0, data.Length);

            // Leer respuesta del servidor
            byte[] buffer = new byte[1024];
            int bytesRead = stream.Read(buffer, 0, buffer.Length);
            string response = Encoding.ASCII.GetString(buffer, 0, bytesRead);

            // Cerrar conexión
            stream.Close();
            client.Close();

            return response;
        }
        catch (Exception ex)
        {
            errorBox.text = "Unexpected error. Please try again.";
            return $"Error: {ex}.";
        }
    }

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
