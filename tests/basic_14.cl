__kernel void test_int_add2(__global int2 *srcA, __global int2 *srcB, __global int2 *dst)
{
    int  tid = get_global_id(0);

    dst[tid] = srcA[tid] + srcB[tid];
}
