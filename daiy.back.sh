!/bin/bash
#
# Mahesh Saga

pdf() {
for i in `more files.txt`;
do
enscript -J "$title" -B -M $page -f CourierNew-Bold$size --margin=$margin -e@ --word-wrap $i -o - | ps2pdf - $i.pdf ;
done

}


clear
clear
clear
rm -rfv trro/*.* 
rm -frv trro/PDF/*
ls -l trro  trro/PDF
echo "Enter if OK"
#read q
sshpass -p "broot123" scp -P 2244 -p broot@172.10.11.6:/usr2/txt/trro/* trro/
#sshpass -p "broot123" scp  -p broot@183.82.3.172:~/sai/trro/* trro/
#sshpass -p "mcf123" scp  -p chitacc@172.10.11.14:/usr2/txt/trro/* trro/
cd trro
ls -l
echo "Total Number of files : " `ls *.* |wc -l`
echo "Enter if OK"
#read q
title="Margadarsi Chit Fund Pvt Ltd."
#touch smr_files
#ls *smr > smr_files
#for i in `more smr_files`; do mv $i $i.txt ; done
rm smr_files
rm -rf *.pdf
touch files.txt
#Trro9999
echo $(ls |grep trro9999 |grep -v smr) > files.txt
echo $(ls |grep trro2222 |grep -v smr) >> files.txt
echo $(ls |grep trro3333 |grep -v smr) >> files.txt
echo $(ls |grep trro4444 |grep -v smr) >> files.txt
echo $(ls |grep trro5555 |grep -v smr) >> files.txt
#echo $(ls |grep trro6000 |grep -v smr) >> files.txt
echo $(ls |grep trro6666 |grep -v smr) >> files.txt
 #echo $(ls |grep trro7777 |grep -v smr) >> files.txt
echo $(ls |grep misr421 |grep -v smr) >> files.txt
echo $(ls |grep trro8881 |grep -v smr) >> files.txt
echo $(ls |grep trro8882 |grep -v smr) >> files.txt
echo $(ls |grep trro8883 |grep -v smr) >> files.txt
echo $(ls |grep trro8884 |grep -v smr) >> files.txt
echo $(ls |grep trro0008 |grep -v smr) >> files.txt
echo $(ls |grep trro0004 |grep -v smr) >> files.txt
echo $(ls |grep trro8885 |grep -v smr) >> files.txt
echo $(ls |grep trro8886 |grep -v smr) >> files.txt
echo $(ls |grep trro8887 |grep -v smr) >> files.txt
sed -ie '$s///' $(cat files.txt |tail -n1)
cat files.txt
page=Trro9999
size=11
margin="0.4:0.4:0.4:0.4"
pdf

#Trro8888
#echo $(ls |grep trro8888 |grep -v smr) > files.txt
cat files.txt
page=Trro8888
size=11
margin="0.4:0.4:0.4:0.4"
pdf

#trro6000
t=`date +'%H'`
if [ "$t" -eq 00 ] || [ "$t" -eq 01 ] || [ "$t" -eq 02 ] || [ "$t" -eq 03 ] || [ "$t" -eq 04 ] || [ "$t" -eq 05 ] || [ "$t" -eq 06 ] || [ "$t" -eq 07 ] || [ "$t" -eq 08 ]; then

d=`date -d '-1 day' +%d`

else

d=`date +%d`

fi
#d=31
#pageSetup
echo
echo
echo
echo
echo
echo
echo "today date is $d"
#sleep 10
#sed -i 's/ SUM/         SUM/g' t
#sed -i 's/ CO/         CO/g' t
#sed -i 's/ R.Dt/         R.Dt/g' t
#sed -i 's/-\/-/-\/----------/g' t
#sed -i 's/\ \\\*\\\*\\\*E           \\\*\\\*\\\*E/' t
#sed -i 's/-\/-/-\/-------/g' t
sh t

sed -i '$ d' trro6000*txt trro9000*txt *630c*smr

#Trro6000-txt
echo $(ls |grep trro6000 |grep -v smr) > files.txt
cat files.txt
page=Trro6000txt"$d"
size=11
margin="0.4:0.04:35:0.4"
pdf


#Trro6000-smr
echo $(ls |grep trro6000 |grep -w smr) > files.txt
cat files.txt
page=Trro6000smr"$d"
size=11
margin="0.4:0.04:35:0.4"
pdf



#trro9000-smr

echo $(ls |grep trro9000|grep -v txt) > files.txt
cat files.txt
page=Trro6000smr$d
size=11
margin="0.4:0.4:0.4:0.4"
pdf


#trro9000-txt

echo $(ls |grep trro9000|grep -v smr) > files.txt
cat files.txt
page=Trro6000txt$d
size=11
margin="0.4:0.4:0.4:0.4"
pdf

#Coro625
echo $(ls |grep coro625 |grep -v smr) > files.txt
cat files.txt
page=Coro625-1
size=11
margin="0.4:0.4:0.4:0.4"
pdf


#Trro5000
echo $(ls |grep trro5000 |grep -v smr) > files.txt
for i in `more files.txt`; do cp -vpr $i $i.001 && tr < $i.001 -d '\000' > $i && sed -i  -e '$ d' $i && echo "					   ***END OF REPORT*** " >> $i && rm -rf $i.001; done
cat files.txt
page=Trro5000
size=10
margin="0.4:0.4:0.4:0.4"
pdf


echo $(ls |grep trrotime |grep -v smr) > files.txt
for i in `more files.txt`; do cp -vpr $i $i.001 && tr < $i.001 -d '\000' > $i && sed -i  -e '$ d' $i && echo "					   ***END OF REPORT*** " >> $i && rm -rf $i.001; done
cat files.txt
page=Trro5000
size=10
margin="0.4:0.4:0.4:0.4"
pdf



echo $(ls |grep co630c.txt ) > files.txt
for i in `more files.txt`; do cp -vpr $i $i.001 && tr < $i.001 -d '\000' > $i && sed -i  -e '$ d' $i && echo "					   ***END OF REPORT*** " >> $i && rm -rf $i.001; done
cat files.txt
page=Co630-txt
size=10
margin="0.4:0.4:0.4:0.4"
pdf


echo $(ls |grep co630c.pr ) > files.txt
for i in `more files.txt`; do cp -vpr $i $i.001 && tr < $i.001 -d '\000' > $i && sed -i  -e '$ d' $i && echo "					   ***END OF REPORT*** " >> $i && rm -rf $i.001; done
cat files.txt
page=Co630-pr
size=10
margin="0.4:0.4:0.4:0.4"
pdf



#Trro5000smr
echo $(ls |grep trro5000 |grep -w smr) > files.txt
cat files.txt
page=Trro5000-smr
size=10
margin="0.4:0.04:40:0.4"
pdf


#Co630-smr  
echo $(ls |grep co630c.smr) > files.txt
cat files.txt
page=Co630-smr
size=10
margin="0.4:0.04:40:0.4"
pdf

#Trrotimesmr
echo $(ls |grep trrotime |grep -w smr) > files.txt
cat files.txt
page=Trro5000-smr
size=10
margin="0.4:0.04:40:0.4"
pdf

#Coro625smr
echo $(ls |grep coro625 |grep -w smr) > files.txt
cat files.txt
page=Coro625-smr-1
size=11
margin="0.4:0.04:40:0.4"
pdf



#Trro9999
echo $(ls |grep trro9999 |grep -w smr) > files.txt
echo $(ls |grep trro2222 |grep -w smr) >> files.txt
echo $(ls |grep trro3333 |grep -w smr) >> files.txt
echo $(ls |grep trro4444 |grep -w smr) >> files.txt
echo $(ls |grep trro5555 |grep -w smr) >> files.txt
#echo $(ls |grep trro6000 |grep -w smr) >> files.txt
echo $(ls |grep trro6666 |grep -w smr) >> files.txt
#echo $(ls |grep trro7777 |grep -w smr) >> files.txt
echo $(ls |grep trro8881 |grep -w smr) >> files.txt
echo $(ls |grep trro8882 |grep -w smr) >> files.txt
echo $(ls |grep trro8883 |grep -w smr) >> files.txt
echo $(ls |grep trro8884 |grep -w smr) >> files.txt
echo $(ls |grep trro0008 |grep -w smr) >> files.txt
echo $(ls |grep trro8885 |grep -w smr) >> files.txt
echo $(ls |grep trro8886 |grep -w smr) >> files.txt
echo $(ls |grep trro8887 |grep -w smr) >> files.txt
echo $(ls |grep misr421  |grep -w smr1) >> files.txt

cat files.txt
page=Trro9999-smr
size=11
margin="0.4:0.04:35:0.4"
pdf


#Trro8888
echo $(ls |grep trro8888 |grep -w smr) > files.txt
cat files.txt
page=Trro8888-smr
size=11
margin="0.4:0.04:35:0.4"
pdf



mv *.pdf PDF/
#cp -pvr *630* coro625.smr coro625.txt trro9010.* trro9020* trro9000.* trro6000.* trromar*  PDF/
cp -pvr *630* PDF/

echo "Total Number of files in PDF dir : " `ls PDF/*.* |wc -l`
#common for all

