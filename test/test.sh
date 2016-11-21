read numx
num=$numx
char="*"
while [ $num -gt 0 ]; do
	str=""
	i=0
	while [ $i -lt $num ]; do
		str="$str$char"
		i=$[i+1]
	done
	num=$[num-1]
	echo "$str"
done

for i in $( seq $numx -1 1 ); do
	str=""
	for j in $( seq $i ); do		
		str="$str$char"
	done
	echo "$str"
done
#seq 7 -1 1
	
