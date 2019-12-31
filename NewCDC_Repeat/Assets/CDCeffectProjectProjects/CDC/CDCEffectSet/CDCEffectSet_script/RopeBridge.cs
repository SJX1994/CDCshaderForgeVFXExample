using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RopeBridge : MonoBehaviour
{
    [SerializeField]
    public Transform StartPoint;
    [SerializeField]
    public Transform EndPoint;
    [SerializeField]
    public Transform Partical;
    [SerializeField]
    private float size = 5f;

    private LineRenderer lineRenderer;
    private List<RopeSegment> ropeSegments = new List<RopeSegment>();
    private float ropeSegLen = 0.25f;
    private int segmentLength = 5;


    // Use this for initialization
    void Start()
    {
        float particalScale = 3.3f;
        //粒子的缩放
        Partical.localScale = new Vector3(size * particalScale, size * particalScale, size * particalScale);

        this.lineRenderer = this.GetComponent<LineRenderer>();
        Vector3 ropeStartPoint = StartPoint.position;
        segmentLength = Mathf.RoundToInt(Vector3.Distance(StartPoint.position, EndPoint.position) * 0.3f);
        for (int i = 0; i < segmentLength; i++)
        {
            this.ropeSegments.Add(new RopeSegment(ropeStartPoint));
            ropeStartPoint.y -= ropeSegLen;
        }

    }

    // Update is called once per frame
    void Update()
    {
        this.DrawRope();

    }

    private void FixedUpdate()
    {
        ApplyConstraint();
    }

    // private void Simulate()
    // {
    //     // SIMULATION
    //     Vector2 forceGravity = new Vector2(0f, -1f);

    //     for (int i = 1; i < this.segmentLength; i++)
    //     {
    //         RopeSegment firstSegment = this.ropeSegments[i];
    //         Vector3 velocity = firstSegment.posNow - firstSegment.posOld;
    //         firstSegment.posOld = firstSegment.posNow;
    //         firstSegment.posNow += velocity;
    //         firstSegment.posNow += forceGravity * Time.fixedDeltaTime;
    //         this.ropeSegments[i] = firstSegment;
    //     }

    //     //CONSTRAINTS
    //     for (int i = 0; i < 50; i++)
    //     {
    //         this.ApplyConstraint();
    //     }
    // }

    private void ApplyConstraint()
    {
        //Constrant to First Point 
        RopeSegment firstSegment = this.ropeSegments[0];
        firstSegment.posNow = this.StartPoint.position;
        this.ropeSegments[0] = firstSegment;


        //Constrant to Second Point 
        RopeSegment endSegment = this.ropeSegments[this.ropeSegments.Count - 1];
        endSegment.posNow = this.EndPoint.position;
        this.ropeSegments[this.ropeSegments.Count - 1] = endSegment;

        for (int i = 0; i < this.segmentLength - 1; i++)
        {

            RopeSegment firstSeg = this.ropeSegments[i];
            RopeSegment secondSeg = this.ropeSegments[i + 1];
            Partical.LookAt(ropeSegments[1].posNow);

            float dist = (firstSeg.posNow - secondSeg.posNow).magnitude;
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

            Vector3 changeAmount = changeDir * error;
            if (i != 0)
            {
                firstSeg.posNow -= changeAmount * 0.5f;
                this.ropeSegments[i] = firstSeg;
                secondSeg.posNow += changeAmount * 0.5f;
                this.ropeSegments[i + 1] = secondSeg;
            }
            else
            {
                secondSeg.posNow += changeAmount;
                this.ropeSegments[i + 1] = secondSeg;
            }
        }
    }

    private void DrawRope()
    {
        float size = this.size;
        lineRenderer.startWidth = size;
        lineRenderer.endWidth = size - 0.08f;

        Vector3[] ropePositions = new Vector3[this.segmentLength];
        for (int i = 0; i < this.segmentLength; i++)
        {
            ropePositions[i] = this.ropeSegments[i].posNow;
        }

        lineRenderer.positionCount = ropePositions.Length;
        lineRenderer.SetPositions(ropePositions);
    }

    public struct RopeSegment
    {
        public Vector3 posNow;
        public Vector3 posOld;

        public RopeSegment(Vector3 pos)
        {
            this.posNow = pos;
            this.posOld = pos;
        }
    }
}
