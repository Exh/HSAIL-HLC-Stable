#pragma OPENCL EXTENSION cl_khr_local_int32_base_atomics : enable
__kernel void test_atomic_fn(__global int *finalDest, __global int *oldValues, volatile __local int *destMemory, int numDestItems )
{
    int  tid = get_global_id(0);
	 int  dstItemIdx;

    // Everybody does the following line(s), but it all has the same result. We still need to ensure we sync before the atomic op, though
	 for( dstItemIdx = 0; dstItemIdx < numDestItems; dstItemIdx++ )
		destMemory[ dstItemIdx ] = finalDest[ dstItemIdx ];
    barrier( CLK_LOCAL_MEM_FENCE );

    oldValues[tid] = atomic_inc( &destMemory[0] );
    barrier( CLK_LOCAL_MEM_FENCE );
    // Finally, write out the last value. Again, we're synced, so everyone will be writing the same value
	 for( dstItemIdx = 0; dstItemIdx < numDestItems; dstItemIdx++ )
		finalDest[ dstItemIdx ] = destMemory[ dstItemIdx ];
}
