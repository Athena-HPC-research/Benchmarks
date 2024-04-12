#!/bin/bash
executable="test_HPCCG"
rm -f run-commands.sh
prefix=$1
for np in $(seq 1 6); do
	np_val=$((2 ** np))
	nx=4
	# we write the patterns we want using the seq command
	ny=4
	nz=4
	echo "mpirun --oversubscribe -np $np_val $executable $nx $ny $nz > ${prefix}_${np_val}_${nx}_${ny}_${nz}" >> run-commands.sh
done 
