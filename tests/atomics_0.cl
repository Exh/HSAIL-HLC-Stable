#pragma OPENCL EXTENSION cl_khr_global_int32_base_atomics : enable
__kernel void test_atomic_fn(volatile __global int *destMemory, __global int *oldValues)
{
    int  tid = get_global_id(0);

	oldValues[tid] = atom_add( &destMemory[0], tid + 3 );
	atom_add( &destMemory[0], tid + 3 );
   atom_add( &destMemory[0], tid + 3 );
   atom_add( &destMemory[0], tid + 3 );

}
