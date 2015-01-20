#pragma OPENCL EXTENSION cl_khr_global_int32_extended_atomics : enable
__kernel void test_atomic_fn(volatile __global int *destMemory, __global int *oldValues)
{
    int  tid = get_global_id(0);

    size_t numBits = sizeof( destMemory[0] ) * 8;
    int  bitIndex = tid & ( numBits - 1 );

    oldValues[tid] = atomic_xor( &destMemory[0], 1 << bitIndex );

}
