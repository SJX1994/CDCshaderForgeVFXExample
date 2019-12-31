using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LineRenderBridge : MonoBehaviour
{
    [SerializeField]
    private Transform StartPoint;
    [SerializeField]
    private Transform EndPoint;
    [SerializeField]
    private int lineLength;
    private List<LineSegment> lineSegments = new List<LineSegment>();
    private LineRenderer lineRenderer;
    private float lineWidth = 0.28f;
    //？
    private float ropeSegLen = 0.01f;



    // Use this for initialization
    void Start()
    {
        this.lineRenderer = transform.GetComponent<LineRenderer>();
        Vector3 lineStartPoint = StartPoint.position;
        for (int i = 0; i < lineLength; i++)
        {
            this.lineSegments.Add(new LineSegment(lineStartPoint));

            //  lineStartPoint.position = (StartPoint.position + EndPoint.position) / 2;
        }

    }

    // Update is called once per frame
    void Update()
    {
        this.DrawLine();
    }
    private void FixedUpdate()
    {
        for (int i = 0; i < 50; i++)
        {
            this.ApplyConstraint();
        }
    }
    private void ApplyConstraint()
    {
        //startPoint
        LineSegment firstSegment = this.lineSegments[0];
        firstSegment.posNow = this.StartPoint.position;
        this.lineSegments[0] = firstSegment;
        //endPoint
        LineSegment endSegment = this.lineSegments[this.lineSegments.Count - 1];
        endSegment.posNow = this.EndPoint.position;
        this.lineSegments[this.lineSegments.Count - 1] = endSegment;
        //修正线段方向
        for (int i = 0; i < this.lineLength - 1; i++)
        {
            LineSegment firstSeg = this.lineSegments[i];
            LineSegment secondSeg = this.lineSegments[i + 1];
            float dist = (firstSeg.posNow - firstSeg.posOld).magnitude;
            float error = Mathf.Abs(dist - this.ropeSegLen);
            Vector3 changeDir = Vector3.zero;
            if (dist > ropeSegLen)
            {
                changeDir = (firstSeg.posNow - secondSeg.posNow).normalized;
            }
            else if (dist < ropeSegLen)
            {
                changeDir = (secondSeg.posNow - firstSeg.posNow).normalized;
            }
            //可能不需要
            // Vector3 changeAmount = changeDir * error;
            // if (i != 0)
            // {
            //     firstSeg.posNow -= changeAmount * 0.5f;
            //     this.lineSegments[i] = firstSeg;
            //     secondSeg.posNow += changeAmount * 0.5f;
            //     this.lineSegments[i + 1] = secondSeg;
            // }
            // else
            // {
            //     secondSeg.posNow += changeAmount;
            //     this.lineSegments[i + 1] = secondSeg;
            // }
        }

    }
    private void DrawLine()
    {
        float lineWidth = this.lineWidth;
        lineRenderer.startWidth = lineWidth;
        lineRenderer.endWidth = lineWidth - 0.08f;
        Vector3[] linePositions = new Vector3[this.lineLength];
        for (int i = 0; i < this.lineLength; i++)
        {
            linePositions[i] = this.lineSegments[i].posNow;
        }
        lineRenderer.positionCount = linePositions.Length;
        lineRenderer.SetPositions(linePositions);
    }
}
public struct LineSegment
{
    public Vector3 posNow;
    public Vector3 posOld;
    public LineSegment(Vector3 pos)
    {
        this.posNow = pos;
        this.posOld = pos;
    }
}

