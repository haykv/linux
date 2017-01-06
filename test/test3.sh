#!/bin/awk -f

{  
    for (j = 1; j <= NF; j++) {
        A[NR,j]=$j
    }
    F[NR]=NF
}
END {
    max=A[NR,1]
    for (i=1; i<=F[NR]; i++) {
        if (A[NR,i]>max) {
            max=A[NR,i]
        }
    }
    sum=0
    for (i = 1; i <= NR; i++) {
        for (j=1; j <= F[i]; j++) {
            if ( A[i,j] > max ) {
                sum+=A[i,j]
            }
        }
    }
    print sum
}
