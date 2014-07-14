#pragma OPENCL EXTENSION cl_khr_global_int32_extended_atomics : enable
__kernel void test_atomic_fn(volatile __global uint *destMemory, __global uint *oldValues)
{
    int  tid = get_global_id(0);

    oldValues[tid] = atomic_max( &destMemory[0], oldValues[tid] );

}
