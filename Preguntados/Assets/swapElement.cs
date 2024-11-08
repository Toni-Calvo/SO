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

    void Start()
    {
        // Selecciona el primer elemento de la pantalla
        system = EventSystem.current;
        firstElement.Select();
    }

    void Update()
    {
        // Comprueba si se ha pulsado la tecla tabulador para iterar elementos
        if (Input.GetKeyDown(KeyCode.Tab))
        {
            Selectable next = system.currentSelectedGameObject.GetComponent<Selectable>().FindSelectableOnDown();
            if (next != null)
            {
                next.Select();
            }
        }
        // Comprueba si se ha pulsado la tecla enter para enviar el formulario
        else if (Input.GetKeyDown(KeyCode.Return))
        {
            submitBtn.onClick.Invoke();
        }
    }
}
