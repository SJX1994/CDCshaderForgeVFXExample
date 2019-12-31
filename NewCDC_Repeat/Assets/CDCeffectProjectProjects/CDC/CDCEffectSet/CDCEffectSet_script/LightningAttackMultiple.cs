//设计思路：[需要动态加载]
//定义一个范围a
//1:遍历一遍范围a内的点是否可以攻击（N个）
//2:计算N个点的中点
//3：雷电先射向中点，之后分散射向N个目标
//4:一闪之后慢慢消失?

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightningAttackMultiple : MonoBehaviour
{
    [SerializeField]
    private Transform start;
    [SerializeField]
    private ParticleSystem attackedObjParticalEffect;
    [SerializeField]
    private float lineDrawSpeed = 2f;
    private float counter;
    [SerializeField]
    private float width = 9f;
    [SerializeField]
    private float m_GetAttackRange;
    [SerializeField]
    private Transform[] m_TargetAttackableObjs;

    private List<Vector3> points = new List<Vector3>();
    private Vector3 midPoint;


    private LineRenderer lineRenderer;

    private float distance;
    bool isPlaied = false;



    // Start is called before the first frame update
    void Start()
    {
        InitData();
        CheckCanAttack();
    }

    // Update is called once per frame
    void Update()
    {
        //雷击（传入vector3）
        LightingAttackMidPoint(midPoint);
    }
    void InitData()
    {

        midPoint = Vector3.zero;
        points.Clear();

        lineRenderer = transform.GetComponent<LineRenderer>();
        lineRenderer.SetPosition(0, start.position);
        lineRenderer.startWidth = width;
        lineRenderer.endWidth = width;
    }
    void CheckCanAttack()
    {
        if (m_TargetAttackableObjs == null)
        {
            Debug.Log("没有攻击目标");
        }
        if (m_TargetAttackableObjs.Length > 1)
        {
            for (int i = 0; i < m_TargetAttackableObjs.Length; i++)
            {
                if (m_TargetAttackableObjs[i] == null)
                {
                    Debug.Log("第" + i + "个物体，未找到或者已被删除，请赋值");
                    Destroy(transform.gameObject);
                    break;
                }
                else
                {
                    //定义一个范围a
                    float distance = (m_TargetAttackableObjs[i].position - transform.position).magnitude;
                    // Debug.Log("敌人距离" + distance);
                    if (distance < m_GetAttackRange)
                    {
                        //记录vector3,算出中点，返回Vector3中点
                        midPoint = CountMidPointPosition(m_TargetAttackableObjs[i].position);


                    }
                }
            }


        }
        else
        {
            midPoint = m_TargetAttackableObjs[0].position;
            LightingAttackMidPoint(midPoint);
        }

    }
    Vector3 CountMidPointPosition(Vector3 m_TargetAttackableObj)
    {

        points.Add(m_TargetAttackableObj);
        //计算中点
        float centerX = 0;
        float centerY = 0;
        float centerZ = 0;


        for (int i = 0; i < points.Count; i++)
        {
            centerX += points[i].x;
            centerY += points[i].y;
            centerZ += points[i].z;

        }
        float theCenterX = centerX / points.Count;
        float theCenterY = centerY / points.Count;
        float theCenterZ = centerZ / points.Count;
        Vector3 theCenter = new Vector3(theCenterX, theCenterY, theCenterZ);
        //        Debug.Log("中点坐标" + theCenter);
        //        Debug.Log(points.Count);
        return theCenter;
    }
    void LightingAttackMidPoint(Vector3 midPoint)
    {
        //todo雷击动画表现
        LightView(start.position, midPoint, lineRenderer);
        //动画播放完毕后，播放分散攻击动画
        if (points.Count > 1 && isPlaied == false)
        {
            isPlaied = true;
            StartCoroutine(SeparationAttack((lineDrawSpeed / 10) * 2));

        }
        else
        {
            return;
        }

    }
    IEnumerator SeparationAttack(float waitTime)
    {
        yield return new WaitForSeconds(waitTime);
        for (int i = 0; i < points.Count; i++)
        {



            GameObject lightPoint = new GameObject();


            lightPoint.AddComponent<LineRenderer>();
            LineRenderer singleLine = lightPoint.GetComponent<LineRenderer>();
            singleLine.material = transform.GetComponent<Renderer>().material;
            singleLine.numCapVertices = 6;
            LightView(midPoint, m_TargetAttackableObjs[i].position, singleLine);
            lightPoint.transform.parent = transform;
        }
        for (int i = 0; i < m_TargetAttackableObjs.Length; i++)
        {
            ShowPartical(m_TargetAttackableObjs[i].position);
        }
    }
    void LightView(Vector3 startPoint, Vector3 endPoint, LineRenderer lineRendererView)
    {
        lineRendererView.SetPosition(0, startPoint);
        lineRendererView.startWidth = width;
        lineRendererView.endWidth = width;

        distance = Vector3.Distance(startPoint, endPoint);
        if (counter < distance)
        {
            counter += .1f / lineDrawSpeed;
            float x = Mathf.Lerp(0, distance, counter);

            Vector3 singleLinePoint = Vector3.Lerp(startPoint, endPoint, counter);
            lineRendererView.SetPosition(1, singleLinePoint);

        }
    }
    void ShowPartical(Vector3 Position)
    {
        ParticleSystem ps = Instantiate(attackedObjParticalEffect, Position, Quaternion.identity);
        ps.transform.SetParent(transform);
    }
}
