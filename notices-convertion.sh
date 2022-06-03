#!/bin/bash

process () {
	n_date=`date +%d%m%Y`
	mkdir -p /usr2/txt/Notices/$n_date/{AP,TS,TN,KN}
	todaydir="/usr2/txt/Notices/$n_date"
	cd /usr2/txt
	ls cn*720* > /usr2/txt/Notices/$n_date/files.txt
	txtfile="/usr2/txt/Notices/$n_date/files.txt"
	for i in `more $txtfile`;
	do
		if [ -s /usr2/txt/$i ]
		then
			ext=$(echo $i | awk -F . '{if (NF>1) {print $NF}}')
			find=$( grep -r -w  $ext /usr2/EOD-sh/drrbr{AP,TS,TN,KN} | cut -d':' -f1 |tail -c3 )
			cp -pvr /usr2/txt/$i  $todaydir/$find/
			line_num=1
			c_file="$todaydir/$find/$i"
			echo "Converting...."
			convertfile  
		else
			echo " /usr2/txt/$i is empty, skipped... "
		fi
	done

}

convertfile () {
#file="$dir/$f1"
file="$c_file"
#file1="$dir/$f1.0.txt"
#touch $dir/$file
#touch $dir/$file1
#echo "" > $file1
echo $file
while IFS= read -r line
do
	var1=$(echo $line |grep -a -o "(\|)" | head -n1)
	#var2=$(echo $line |grep -a ')')
	var2="("
	var3=")"
	if [[ "$var1" == "$var2"  ]]
	then
		var1_count=$(echo $line |grep -a -o '(' | wc -l)
		var2_count=$(echo $line |grep -a -o ')' | wc -l)
		if [[ "$var1_count" == "$var2_count"  ]]
		then
			echo "OK" >> /tmp/1.txt
		else
			sed -i -e "${line_num}s/(/ /g" $file
			sed -i -e "${line_num}s/)/ /g" $file
		fi
	else
		echo "" > /tmp/1.txt
	fi
	if [[ "$var1" == "$var3"  ]]
	then
		sed -i -e "${line_num}s/(/ /g" $file
		sed -i -e "${line_num}s/)/ /g" $file
	else
		echo "" > /tmp/1.txt
	fi

	line_num=$(( $line_num + 1 ))

done < "$file"
#echo "" >> $file1
#echo $line_num

}


echo "Started"
#echo $1
#dir=`pwd`
#f1=$dir/$1
#cp -vrp $f1 tmp/$f1
line_num=1
echo "Processing...."
process
#echo "Converting...."
#convertfile
cd $todaydir
zip AP-$n_date.zip AP/*
zip KN-$n_date.zip KN/*
zip TN-$n_date.zip TN/*
zip TS-$n_date.zip TS/*
echo "Completed"
