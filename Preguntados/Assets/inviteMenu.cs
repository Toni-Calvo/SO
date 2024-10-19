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
    private const string serverIp = "192.168.56.102"; // IP del servidor
    private const int serverPort = 8080; // Puerto del servidor
    private TcpClient client;
    IPEndPoint endpoint;

    void Start()
    {
        string request = $"7/";
        string response = SendRequest(request);
        Debug.Log(response);
        
        List<string> users = new List<string>(response.Split("/"));
        for (int i = 1; i < users.Count; i++)
        {
            continue;
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
            return $"Error: {ex}.";
        }
    }
}
