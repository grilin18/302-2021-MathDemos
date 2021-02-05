using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BezierCubic : MonoBehaviour
{
    public Transform positionA;
    public Transform positionB;
    public Transform handle;

    [Range(0, 1)] public float percent = 0;

    public int curveResolution = 10;

    // Update is called once per frame
    void Update()
    {
        transform.position = CalcPositionOnCurve(percent);
    }

    private Vector3 CalcPositionOnCurve(float percent)
    {
        // pC = lerp between pA and handle
        Vector3 positionC = AnimMath.Lerp(positionA.position, handle.position, percent);

        // pD = lerp between handle and pB
        Vector3 positionD = AnimMath.Lerp(handle.position, positionB.position, percent);

        // pF = lerp between pC and pD
        Vector3 positionF = AnimMath.Lerp(positionC, positionD, percent);

        return positionF;
    }

    private void OnDrawGizmos()
    {
        Vector3 p1 = positionA.position;

        for (int i = 0; i < curveResolution; i++)
        {
            float p = i / (float)curveResolution;
            Vector3 p2 = CalcPositionOnCurve(p);

            Gizmos.DrawLine(p1, p2);

            p1 = p2;
        }

        Gizmos.DrawLine(p1, positionB.position);
    }
}
