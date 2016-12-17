#!/usr/bin/bash
vals=$1
sum=0
for i in $(echo $vals); do
    sum=$[sum+i]
done
echo $sum
