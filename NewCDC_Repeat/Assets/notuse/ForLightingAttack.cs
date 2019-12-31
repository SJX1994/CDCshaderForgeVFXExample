using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//reference:https://forum.unity.com/threads/how-to-add-collider-to-a-line-renderer.505307/
[RequireComponent(typeof(LineRenderer))]
public class ForLightingAttack : MonoBehaviour
{
    [SerializeField]
    private int segments;
    [SerializeField]
    private int gap;
    [SerializeField]
    private int xRadius;
    [SerializeField]
    private int yRadius;
    LineRenderer line;
    EdgeCollider2D edge;
    List<Vector2> colliderPoints = new List<Vector2>();


    void Awake()
    {
        line = transform.GetComponent<LineRenderer>();

        line.positionCount = segments + 1 - (segments / gap);
        line.useWorldSpace = false;
        //角度
        CreatePoints();
        AddCollider();

    }

    void CreatePoints()
    {
        float x;
        float y;
        float z = 0;
        float angle = 0;
        Vector3 col = new Vector3(0, 0, 0);
        for (int i = 0; i < segments + 1 - (segments / gap); i++)
        {
            x = Mathf.Sin(Mathf.Deg2Rad * angle) * xRadius;
            y = Mathf.Cos(Mathf.Deg2Rad * angle) * yRadius;
            //遍历每一段,存储位置信息
            line.SetPosition(i, new Vector3(x, y, z));
            col = new Vector3(x, y, z);
            colliderPoints.Add(col);
            angle += (360f / segments);

        }
    }
    void AddCollider()
    {
        List<Vector2> colliderPointsList2 = new List<Vector2>();
        //遍历两点形成一条线
        for (int i = 0; i < colliderPoints.Count; i++)
        {
            colliderPointsList2.Add(new Vector3(colliderPoints[i].x, colliderPoints[i].y, 0f));
        }
        for (int i = colliderPoints.Count - 1; i > 0; i--)
        {
            colliderPointsList2.Add(new Vector3(colliderPoints[i].x, colliderPoints[i].y, 0f));
        }
        edge = line.gameObject.AddComponent<EdgeCollider2D>();
        edge.points = colliderPointsList2.ToArray();
    }

}
