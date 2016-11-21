#rm -r d1/d4/d2
x=$(ls d1/d4/*)
for i in $x ; do
	if [ -f $i ]; then
		echo $i
	fi
done
