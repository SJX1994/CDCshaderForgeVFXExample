using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeParticalScal : MonoBehaviour
{
    [SerializeField]
    private float size;
    // Use this for initialization
    void Start()
    {

        if (transform.childCount != 0)
        {
            foreach (Transform obj in transform)
            {
                //obj.localScale = new Vector3(size * obj.localScale.x, size * obj.localScale.y, size * obj.localScale.z);
                if (obj.GetComponent<TrailRenderer>() != null)
                {
                    DoingScaleForTrialRender(obj.GetComponent<TrailRenderer>(), size);
                }
                else
                {
                    DoingScaleForPartical(obj, size);
                }
            }
        }

    }
    public void DoingScaleForPartical(Transform newItem, float size)
    {

        Transform itemTransform = newItem.GetComponent<Transform>();
        itemTransform.localScale = new Vector3(size * itemTransform.localScale.x, size * itemTransform.localScale.y, size * itemTransform.localScale.z);
    }
    public void DoingScaleForTrialRender(TrailRenderer trialRender, float size)
    {

        TrailRenderer itemTrail = trialRender.GetComponent<TrailRenderer>();
        itemTrail.startWidth = size;
    }
    // Update is called once per frame
    void Update()
    {

    }
}
