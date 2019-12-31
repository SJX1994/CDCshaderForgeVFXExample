using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ForLightingAttackCollision : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        LineRenderer lineRenderer = transform.GetComponent<LineRenderer>();
        MeshCollider meshCollider = transform.gameObject.AddComponent<MeshCollider>();
        Mesh mesh = new Mesh();
        lineRenderer.BakeMesh(mesh, true);
        meshCollider.sharedMesh = mesh;
    }

    // Update is called once per frame
    void Update()
    {

    }
}
