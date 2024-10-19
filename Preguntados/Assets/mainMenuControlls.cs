using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class mainMenuControlls : MonoBehaviour
{
    public void listConnected()
    {
        SceneManager.LoadSceneAsync("InviteMenu");
    }
}
