using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ParticalLoopBool : MonoBehaviour
{
    [SerializeField]
    private bool isLoop;
    // Use this for initialization
    void Start()
    {
        if (isLoop == false)
        {
            GetChildrenPartical(false);
        }
        else
        {
            GetChildrenPartical(true);
        }
    }

    // Update is called once per frame
    void Update()
    {

    }
    private void GetChildrenPartical(bool isLooping)
    {
        foreach (Transform obj in transform)
        {
            for (int i = 0; i < obj.childCount; i++)
            {
                Transform subObj = obj.GetChild(i);
                if (subObj.GetComponent<ParticleSystem>() != null)
                {
                    ParticleSystem subObjLoop = subObj.GetComponent<ParticleSystem>();
                    var main = subObjLoop.main;
                    main.loop = isLooping;
                }
            }

        }
    }
}
