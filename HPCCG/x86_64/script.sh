#!/bin/bash
executable="test_HPCCG"
rm -f run-commands.sh
prefix=$1
for np in $(seq 1 5); do
	np_val=$((2 ** np))
	for size in $(seq 5 8); do
		nx=$((2**size))
		ny=$((2**size))
		nz=$((2**size))
		echo "mpirun --oversubscribe -np $np_val $executable $nx $ny $nz > ${prefix}_${np_val}_${nx}_${ny}_${nz}" >> run-commands.sh
	done
	# we write the patterns we want using the seq command
done 
