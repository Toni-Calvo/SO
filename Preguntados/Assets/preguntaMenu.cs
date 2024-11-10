using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class preguntaMenu : MonoBehaviour
{
    public TMP_Text pregunta;
    public TMP_Text timerText;
    public Button R1;
    public Button R2;
    public Button R3;
    public Button R4;
    private float timer;
    private int seconds;
    private bool block;
    private List<float[]> positions;
    private int pos;

    // Asignar a los botones posiciones aleatorias
    private void SetButtonPositions()
    {
        pos = Random.Range(0, 4);
        R1.transform.position = new Vector3(positions[pos][0], positions[pos][1], 0);
        positions.RemoveAt(pos);
        pos = Random.Range(0, 3);
        R2.transform.position = new Vector3(positions[pos][0], positions[pos][1], 0);
        positions.RemoveAt(pos);
        pos = Random.Range(0, 2);
        R3.transform.position = new Vector3(positions[pos][0], positions[pos][1], 0);
        positions.RemoveAt(pos);
        R4.transform.position = new Vector3(positions[0][0], positions[0][1], 0);
    }

    // Cargar las posiciones de los botones
    private void loadButtonPositions()
    {
        positions = new List<float[]>();
        positions.Add(new float[] { 291.48f, 282.64f });
        positions.Add(new float[] { 809.52f , 282.64f });
        positions.Add(new float[] { 291.48f, 110.54f });
        positions.Add(new float[] { 809.52f, 110.54f });
    }

    void Start()
    {
        // Posiciones de los botones
        loadButtonPositions();
        SetButtonPositions();

        // Temporizadores
        timer = 30; // Tiempo para responder
        seconds = 30; // Segundos restantes
        // Bloqueo de botones
        block = false;

        // Escribir las preguntas y respuestas
        pregunta.text = GlobalVariables.currentQuestion;
        R1.GetComponentInChildren<TMP_Text>().text = GlobalVariables.currentA1; // R1 es la correcta siempre
        R2.GetComponentInChildren<TMP_Text>().text = GlobalVariables.currentA2;
        R3.GetComponentInChildren<TMP_Text>().text = GlobalVariables.currentA3;
        R4.GetComponentInChildren<TMP_Text>().text = GlobalVariables.currentA4;
    }

    void Update()
    {
        // Contestado
        if (block)
        {
            timer -= Time.deltaTime;
            if (seconds - timer >= 1)
            {
                seconds--;
                timerText.text = seconds.ToString();
            }

            if ( timer <= 0)
            {
                SceneManager.LoadSceneAsync("Ruleta");
            }
        }
        // Sin contestar
        else
        {
            timer -= Time.deltaTime;
            if (seconds - timer >= 1)
            {
                seconds--;

                // Se acabó el tiempo
                if (seconds < 0)
                {
                    block = true;
                    timer = 2;
                    seconds = 2;
                    R1.image.color = Color.green;
                    R2.image.color = Color.red;
                    R3.image.color = Color.red;
                    R4.image.color = Color.red;
                }
                // Actualizar el tiempo
                else
                    timerText.text = seconds.ToString();
            }
        }
    }

    // Pulsada respuesta correcta
    public void r1Click()
    {
        if (!block)
        {
            R1.image.color = Color.green;
            block = true;
            GlobalVariables.correct = true;
            timer = 2;
            seconds = 2;
        }
    }

    // Pulsada respuesta incorrecta
    public void r2Click()
    {
        if (!block)
        {
            R2.image.color = Color.red;
            block = true;
            timer = 2;
            seconds = 2;
        }
    }

    // Pulsada respuesta incorrecta
    public void r3Click()
    {
        if (!block)
        {
            R3.image.color = Color.red;
            block = true;
            timer = 2;
            seconds = 2;
        }
    }

    // Pulsada respuesta incorrecta
    public void r4Click()
    {
        if (!block)
        {
            R4.image.color = Color.red;
            block = true;
            timer = 2;
            seconds = 2;
        }
    }
}
