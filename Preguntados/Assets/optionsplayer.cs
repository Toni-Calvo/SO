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

public class optionsplayer : MonoBehaviour
{
    private Transform entryContainer;
    private Transform entryTemplate;


    private void Awake()
    {
        string response;
        response = GlobalVariables.SendRequest("6/");
        List<string> users = new List<string>(response.Split("/"));
        

        entryContainer = GameObject.Find("HighscoreentryContainer")?.transform;
    

        entryTemplate = entryContainer.Find("HighScoreEntryTemplate");
        if (entryTemplate == null)
        {
            Debug.LogError("No se encontró el objeto 'HighScoreEntryTemplate' dentro de 'HighscoreentryContainer'. Verifica el nombre y asegúrate de que sea un hijo directo.");
            return;
        }

        entryTemplate.gameObject.SetActive(false);

        float templateHeight = 45f;
        int[] scores = { 10000, 900, 850, 800, 750, 1000 };

        for (int i = 0; i < users.Count; i++)
        {
            Transform entryTransform = Instantiate(entryTemplate, entryContainer);
            RectTransform entryRectTransform = entryTransform.GetComponent<RectTransform>();
            entryRectTransform.anchoredPosition = new Vector2(0, -templateHeight * i);

            entryTemplate.gameObject.SetActive(true);


            int rank = i;
            string rankString;
            switch (rank)
            {
                default: rankString = rank + "TH"; break;
                case 1: rankString = "1ST"; break;
                case 2: rankString = "2ND"; break;
                case 3: rankString = "3RD"; break;

            }

            entryTransform.Find("pos").GetComponent<Text>().text = rankString;
            entryTransform.Find("name").GetComponent<Text>().text = users[i+1];
            entryTransform.Find("score").GetComponent<Text>().text = scores[i].ToString();


        }
        

    }

    // Vuelta al menu
    public void backClick()
    {
        SceneManager.LoadScene("MainMenu");
    }
}
