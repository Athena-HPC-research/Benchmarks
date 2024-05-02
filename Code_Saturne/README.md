# The Code Saturne Benchmark

The original documentation for this can be found [here](https://repository.prace-ri.eu/git/UEABS/ueabs/-/tree/master/code_saturne?ref_type=heads)

The data they give for the benchmark are of considerable size(around 30GBs of RAM needed,so it is memory intensive), so it might be difficult to run on an HPC cluster of commodity SBC nodes, and also it can cause heating problems that force it to terminate(as it happened on my laptop).

The script provided should be run with sudo.

Also the script should be better be run command per command as for some reason the paths don't work properly but the commands when run in succession they work OK.

TODOs

- [x] Has run on x86
- [ ] Has run on ARM
- [ ] Has its results parsed and understood
- [ ] has a script that runs it with different params
- [ ] Has run on Slurm
