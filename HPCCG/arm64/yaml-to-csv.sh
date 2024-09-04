#!/bin/bash
for file in "$@"; do
    echo "processing: $file"
    sed -i '/=/d' $file
    yq . $file > $file.json 
    jq -r '
    ["Mini-Application Name", "Mini-Application Version", "Number of MPI ranks", "OpenMP not enabled", "nx", "ny", "nz", "Number of iterations", "Final residual", "Total Time", "DDOT Time", "WAXPBY Time", "SPARSEMV Time", "Total FLOPS", "DDOT FLOPS", "WAXPBY FLOPS", "SPARSEMV FLOPS", "Total MFLOPS", "DDOT MFLOPS", "WAXPBY MFLOPS", "SPARSEMV MFLOPS", "Min DDOT MPI_Allreduce time", "Max DDOT MPI_Allreduce time", "Avg DDOT MPI_Allreduce time", "SPARSEMV MFLOPS W OVERHEAD", "SPARSEMV PARALLEL OVERHEAD Time", "SPARSEMV PARALLEL OVERHEAD Pct", "SPARSEMV PARALLEL OVERHEAD Setup Time", "SPARSEMV PARALLEL OVERHEAD Setup Pct", "SPARSEMV PARALLEL OVERHEAD Bdry Exch Time", "SPARSEMV PARALLEL OVERHEAD Bdry Exch Pct"],
    [.["Mini-Application Name"], .["Mini-Application Version"], .Parallelism."Number of MPI ranks", .Parallelism."OpenMP not enabled", .Dimensions.nx, .Dimensions.ny, .Dimensions.nz, ."Number of iterations", ."Final residual", ."Time Summary".Total, ."Time Summary".DDOT, ."Time Summary".WAXPBY, ."Time Summary".SPARSEMV, ."FLOPS Summary".Total, ."FLOPS Summary".DDOT, ."FLOPS Summary".WAXPBY, ."FLOPS Summary".SPARSEMV, ."MFLOPS Summary".Total, ."MFLOPS Summary".DDOT, ."MFLOPS Summary".WAXPBY, ."MFLOPS Summary".SPARSEMV, ."DDOT Timing Variations"."Min DDOT MPI_Allreduce time", ."DDOT Timing Variations"."Max DDOT MPI_Allreduce time", ."DDOT Timing Variations"."Avg DDOT MPI_Allreduce time", ."SPARSEMV OVERHEADS"."SPARSEMV MFLOPS W OVERHEAD", ."SPARSEMV OVERHEADS"."SPARSEMV PARALLEL OVERHEAD Time", ."SPARSEMV OVERHEADS"."SPARSEMV PARALLEL OVERHEAD Pct", ."SPARSEMV OVERHEADS"."SPARSEMV PARALLEL OVERHEAD Setup Time", ."SPARSEMV OVERHEADS"."SPARSEMV PARALLEL OVERHEAD Setup Pct", ."SPARSEMV OVERHEADS"."SPARSEMV PARALLEL OVERHEAD Bdry Exch Time", ."SPARSEMV OVERHEADS"."SPARSEMV PARALLEL OVERHEAD Bdry Exch Pct"]
    | @csv
' $file.json >> output.csv
done
awk 'NR==1 || NR%2==0' output.csv > final-output.csv

# after doing the above for each json file then do an:
# awk 'NR==1 || NR%2==0' output02.csv > new-output02.csv
# to keep headers only once as they are repeated.
