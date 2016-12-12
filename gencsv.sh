#!/bin/bash
basicdir="/home/cs/segel/basicsys/win17"
exdirs=$(ls "$basicdir")
home=$HOME
fields="name"
for i in $(seq 12); do
    fields="$fields,ex${i}"
done
fields="$fields,final"
resultfile="$home/public_html/data.csv"
#echo $fields >| $resultfile
cd $basicdir
echo -n >| $resultfile.tmp
for dir in $exdirs; do
    userslist=$(ls "$dir")
    for u in $userslist; do
        if [ -f $dir/$u/final.grade ]; then
            username1=$(echo $u | cut -d"-" -f1)
            grade=$(cat $dir/$u/final.grade 2>/dev/null)
            echo "\"$username1\",\"$dir\",$grade" >> $resultfile.tmp
            username2=$(echo $u | cut -d"-" -f2)
            if [[ $username1 != $username2 ]]; then
                echo "\"$username2\",\"$dir\",$grade" >> $resultfile.tmp
            fi
        fi
    done
done
echo >| $resultfile.prep
users=$(cat $resultfile.tmp| cut -d"," -f1|sort -u)
for u in $users; do
    u_grades=$(grep $u $resultfile.tmp)
    sum=0
    u_str="$u"
    gradescnt=$(echo $u_grades| wc -w)
    for i in $(seq 12); do
        grade=0
        if [ $gradescnt -gt 0 ]; then        
        
            for ug in $u_grades; do
                ex=$(echo $ug | cut -d"," -f2 | tr -d "\"")
                gr=$(echo $ug | cut -d"," -f3)
                if [ "$ex" == "ex${i}stud" ]; then
                    grade=$gr
                    ((gradescnt--))
                    break
                fi
            done

        fi
        u_str="$u_str,$grade"
        ((sum+=grade))
    done
    u_str="$u_str,$[sum/8>100 ? 100 : sum/8]"
    echo $u_str >> $resultfile.prep
done

echo -n $fields >| $resultfile.new
cat $resultfile.prep >> $resultfile.new
if [ $(diff $resultfile.new $resultfile | wc -w) -ne 0 ]; then
    cp -f "$resultfile.new" $resultfile
    cp -f "$home/public_html/template.html" "$home/public_html/index.html"
    date=$(date)
    sed -i -e "s/%DATE%/$date/g" $home/public_html/index.html
    chmod 755 $resultfile
    chmod 755 "$home/public_html/index.html"
fi
