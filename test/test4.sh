#!/bin/awk -f

{  
    for (j = 1; j <= NF; j++) {
        A[FILENAME,FNR,j]=$j
    }
    F[FILENAME,FNR]=NF # fields
    L[FILENAME]=FNR # lines
}
END {
    for (x=1; x<ARGC; x++) {
        file=ARGV[x]
        lines=L[file]
        # find maximum on last line
        max=A[file,lines,1]
        for (i=1; i<=F[file,lines]; i++) {
            if (A[file,lines,i]>max) {
                max=A[file,lines,i]
            }
        }
        # sum all bigger than last line max
        sum=0
        for (i = 1; i <= lines; i++) {
            for (j=1; j <= F[file,i]; j++) {
                if ( A[file,i,j] > max ) {
                    sum+=A[file,i,j]
                }
            }
        }
        print file, sum
    }
}
