using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class swapElement : MonoBehaviour
{
    EventSystem system;
    public Selectable firstElement;
    public Button submitBtn;

    // Start is called before the first frame update
    void Start()
    {
        system = EventSystem.current;
        firstElement.Select();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Tab))
        {
            Selectable next = system.currentSelectedGameObject.GetComponent<Selectable>().FindSelectableOnDown();
            if (next != null)
            {
                next.Select();
                Debug.Log("Next");
            }
        }
        else if (Input.GetKeyDown(KeyCode.Return))
        {
            submitBtn.onClick.Invoke();
        }
    }
}
