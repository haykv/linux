#!/bin/awk -f
BEGIN {
    a[8,9,1]="ab";x=1;y="cd";z=5;a[x,y,z]=20
    for (i in a) {
        print i, a[i]
    }
}
