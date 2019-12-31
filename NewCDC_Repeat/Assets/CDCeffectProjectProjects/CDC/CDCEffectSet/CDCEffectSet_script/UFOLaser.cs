//reference：https://www.youtube.com/watch?v=Bqcu94VuVOI
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class UFOLaser : MonoBehaviour
{
    [SerializeField]
    private float lineDrawSpeed;
    [SerializeField]
    private float width = .45f;
    private LineRenderer lineRenderer;
    [SerializeField]
    private Transform start;
    [SerializeField]
    private Transform end;

    [SerializeField]
    private ParticleSystem particle;
    [SerializeField]
    private ParticleSystem particleEnd;
    private float distance;
    private float counter;

    private bool isPlay = true;

    void InitLinerender()
    {
        lineRenderer = transform.GetComponent<LineRenderer>();
        lineRenderer.SetPosition(0, start.position);
        lineRenderer.startWidth = width;
        lineRenderer.endWidth = width;
        distance = Vector3.Distance(start.position, end.position);
        particleEnd.Stop();
    }
    void ShootingUpdate()
    {
        if (counter < distance - 0.1f)
        {
            counter += .1f / lineDrawSpeed;
            float x = Mathf.Lerp(0, distance, counter);
            Vector3 startPoint = start.position;
            Vector3 endPoint = end.position;
            //单个点的位置
            Vector3 singleLinePoint = Vector3.Lerp(start.position, end.position, counter);
            particle.transform.position = singleLinePoint;
            lineRenderer.SetPosition(1, singleLinePoint);
            if (singleLinePoint == endPoint)
            {


                particleEnd.transform.position = end.position;
                if (isPlay == true)
                {
                    isPlay = false;
                    particleEnd.Play();


                }

                var shape = particle.shape;
                shape.randomPositionAmount = 0;
            }
        }
    }
    // Start is called before the first frame update
    void Start()
    {
        InitLinerender();
    }

    // Update is called once per frame
    void Update()
    {
        ShootingUpdate();
    }
}
