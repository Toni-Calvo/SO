using System;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;
using UnityEditor.PackageManager;
using UnityEngine;
using UnityEngine.UIElements;

public class inviteMenu : MonoBehaviour
{
    void Start()
    {
        // Solicita la lista de jugadores conectados
        string request = $"7/"; // Lista de jugadores conectados
        string response = GlobalVariables.SendRequest(request);
        Debug.Log(response);
        
        // Crear lista de jugadores conectados
        List<string> users = new List<string>(response.Split("/"));
        for (int i = 1; i < users.Count; i++)
        {
            continue;
        }
    }

}
