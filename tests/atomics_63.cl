#pragma OPENCL EXTENSION cl_khr_global_int32_base_atomics : enable
__kernel void test_atomic_fn(volatile __global uint *destMemory, __global uint *oldValues)
{
    int  tid = get_global_id(0);

    int oldValue, origValue, newValue;
    do { 
        origValue = destMemory[0];
        newValue = origValue + tid + 2;
        oldValue = atomic_cmpxchg( &destMemory[0], origValue, newValue );
    } while( oldValue != origValue );
    oldValues[tid] = oldValue;

}
