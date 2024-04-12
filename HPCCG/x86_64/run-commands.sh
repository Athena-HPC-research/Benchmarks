mpirun --oversubscribe -np 2 test_HPCCG 4 4 4 > strongOut_2_4_4_4
mpirun --oversubscribe -np 4 test_HPCCG 4 4 4 > strongOut_4_4_4_4
mpirun --oversubscribe -np 8 test_HPCCG 4 4 4 > strongOut_8_4_4_4
mpirun --oversubscribe -np 16 test_HPCCG 4 4 4 > strongOut_16_4_4_4
mpirun --oversubscribe -np 32 test_HPCCG 4 4 4 > strongOut_32_4_4_4
mpirun --oversubscribe -np 64 test_HPCCG 4 4 4 > strongOut_64_4_4_4
