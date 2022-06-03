#!/bin/bash
#
# Author:  Sai Seshan 
#
/* Monthly Backup Script For FA  */
clear
date=`date +"%d-%m-%Y  %H:%M:%S"`
date1=`date +"%d%m%Y-%H%M%S"`
ddate1=`date +%s`
day=`date +%d`
month=`date +%m`
year=`date +%y`
hours=`date +%H`
min=`date +%M`
sec=`date +%S`
yearmonth=$year$month
daily_dir=$day$month$year
diff2=`expr $day - 7`
daily_dir2=$diff2$month$year
daily_tar=Monthly_Backup-$daily_dir$date1
#echo  daily_dir=$daily_dir   and daily_tar= $daily_tar
echo -e ""
echo -e ""
echo -e ""
echo -e "\e[0;31m		\e[5mFA SERVER MONTHLY BACKUP\e[0m"
echo -e ""
echo -e	"Please Enter Today's Date(Ex: DDMMYY)		:	$day-$month-$year" 
#read daily_dir
echo -e  ""
echo -n "Please Enter Your Name	:       ";read name
echo -n "Please Enter Your Login Password	:       ";read -s pass
echo -e  ""
#sudo /sbin/mkfs -j /dev/sdb1
#sudo mount /dev/sdb1 /mnt9
#sudo mount /dev/sdb1 /mnt9
echo -e "Backup started by \e[0;31m$name\e[0m on \e[0;31m$date\e[0m"
echo $pass | sudo -S /bin/mkdir -p /mnt9/FA/MONTHLY_BACKUP/$daily_dir/RAW
echo $pass | sudo -S /bin/mkdir -p /mnt9/FA/MONTHLY_BACKUP/$daily_dir/RAW/sysfiles
echo $pass | sudo -S /bin/chmod 777 /mnt9/FA
echo $pass | sudo -S /bin/chmod 777 /mnt9/FA/MONTHLY_BACKUP
echo $pass | sudo -S /bin/chmod 777 /mnt9/FA/MONTHLY_BACKUP/$daily_dir
echo $pass | sudo -S /bin/chmod 777 /mnt9/FA/MONTHLY_BACKUP/$daily_dir/RAW
echo $pass | sudo -S /bin/chmod 777 /mnt9/FA/MONTHLY_BACKUP/$daily_dir/RAW/sysfiles
echo $pass | sudo -S /bin/chmod 777 /mnt9/FA/MONTHLY_BACKUP/$daily_dir/RAW
echo $pass | sudo -S /bin/mkdir -p /mnt9/FA/MONTHLY_BACKUP/$daily_dir/TAR
echo $pass | sudo -S /bin/chmod 777 /mnt9/FA/MONTHLY_BACKUP/$daily_dir/TAR
echo $pass | sudo -S /bin/mkdir -p /mnt9/FA/MONTHLY_BACKUP/$daily_dir/TXT
echo $pass | sudo -S /bin/chmod 777 /mnt9/FA/MONTHLY_BACKUP/$daily_dir/TXT
echo ""
sleep 3
echo -e "\e[0;31m		\e[5m MONTHLY BACKUP STARTED.\e[0m"
cd /
echo "Files Copy Started."
echo $pass | touch /mnt9/FA/MONTHLY_BACKUP/Backup_Status_usr1-$daily_dir.log
echo $pass | touch /mnt9/FA/MONTHLY_BACKUP/Backup_Status_usr2-$daily_dir.log
echo $pass | chmod 777 /mnt9/FA/MONTHLY_BACKUP/Backup_Status_usr1-$daily_dir.log
echo $pass | chmod 777 /mnt9/FA/MONTHLY_BACKUP/Backup_Status_usr2-$daily_dir.log
#echo $pass | sudo /usr/bin/rsync  -avz -P  /usr1/  /mnt9/FA/MONTHLY_BACKUP/$daily_dir/RAW/ 
cp  -pvrf  usr1   /mnt9/FA/MONTHLY_BACKUP/$daily_dir/RAW/  
sleep 10

echo "Backup File 		:   $daily_tar.tar.bz2 "  >> /mnt9/FA/MONTHLY_BACKUP/Backup_Duration.log
echo "Backup Location		:   /mnt9/FA/MONTHLY_BACKUP/ " >> /mnt9/FA/MONTHLY_BACKUP/Backup_Duration.log
echo "Starting Time 		:   $hours:$min:$sec" >> /mnt9/FA/MONTHLY_BACKUP/Backup_Duration.log
echo "Ending Time  		:   $hours1:$min1:$sec1" >> /mnt9/FA/MONTHLY_BACKUP/Backup_Duration.log
#cp  -pvrf  usr1   /mnt9/FA/MONTHLY_BACKUP/$daily_dir/RAW/ | tee  /mnt9/FA/MONTHLY_BACKUP/Backup_Status_usr1-$daily_dir.log

/root/tar
/root/kill2.x && /root/kill2.x && /root/kill2.x
cd /
cp  -pvrf usr2   /mnt9/FA/MONTHLY_BACKUP/$daily_dir/RAW/ | tee  /mnt9/FA/MONTHLY_BACKUP/Backup_Status_usr2-$daily_dir.log
#echo $pass | sudo -S /sbin/rsync -avr --progress   usr2 /mnt9/FA/MONTHLY_BACKUP/$daily_dir/RAW/  | tee -a /mnt9/FA/MONTHLY_BACKUP/Backup_Status_usr2-$daily_dir.log  
#cp -pvrf /var/log/seslog /mnt9/FA/MONTHLY_BACKUP/$daily_dir/LOGS/
 
### > /mnt9/FA/MONTHLY_BACKUP/Backup_Status-$daily_dir.log
##echo $pass | tail -f /mnt9/FA/MONTHLY_BACKUP/Backup_Status-$daily_dir.log

/root/tar
/root/kill2.x && /root/kill2.x && /root/kill2.x
echo $pass | sudo -S /sbin/rsync -avz etc/sysconfig/network-scripts/ifcfg*  etc/hosts  etc/passwd* etc/shadow* etc/group*  etc/issue*  etc/profile*     /mnt9/FA/MONTHLY_BACKUP/$daily_dir/RAW/sysfiles

echo "Files Copy Done."
sleep 1
echo "Compressing Data."
sleep 1
#echo $pass | sudo -S tar cvf  /mnt9/FA/MONTHLY_BACKUP/$daily_dir/TAR/$daily_tar.tar.bz2  usr1 usr2 > /mnt9/FA/MONTHLY_BACKUP/$daily_dir/TXT/$daily_tar.txt
echo "Data Compressing Done."
sleep 2
date1=`date +"%d-%m-%Y  %H:%M:%S"`
sleep 2
clear
echo "nameserver 8.8.8.8" > /etc/resolv.conf
touch /tmp/Mail-$daily_tar.txt
echo "# # # # # # # # # # # # # # # # # # # # # # # #" > /tmp/Mail-$daily_tar.txt
echo "		      Backup Deatils		     " >> /tmp/Mail-$daily_tar.txt
echo "# # # # # # # # # # # # # # # # # # # # # # # #" >> /tmp/Mail-$daily_tar.txt
echo "						     " >> /tmp/Mail-$daily_tar.txt
echo " Backup Created on	:   $date	" >> /tmp/Mail-$daily_tar.txt
echo " Backup Created by	:   $name	" >> /tmp/Mail-$daily_tar.txt 
echo " Backup File		:   $dialy_tar.tar.bz2	" >> /tmp/Mail-$daily_tar.txt 
echo " Backup File Location	:   /mnt9/FA/MONTHLY_BACKUP/	" >> /tmp/Mail-$daily_tar.txt
echo "# # # # # # # # # # # # # # # # # # # # # # # #" >> /tmp/Mail-$daily_tar.txt
mutt -s "Monthly Backup Status" saiseshan.v@margadarsi.com < /tmp/Mail-$daily_tar.txt
#echo "Sending Mail , Please wait."
#sleep 10
echo " Mail Sent Successfully "
> /etc/resolv.conf
echo -e "\e[31mDEVELOPMENT BACKUP\e[0m successfully done by \e[31m$name\e[0m on $date"
sudo touch /mnt9/FA/MONTHLY_BACKUP/Backup.log
sudo chmod 777 /mnt9/FA/MONTHLY_BACKUP/Backup.log
echo -e "##################################################" >> /mnt9/FA/MONTHLY_BACKUP/Backup.log
echo "		$date			" >> /mnt9/FA/MONTHLY_BACKUP/Backup.log
echo -e "##################################################" >> /mnt9/FA/MONTHLY_BACKUP/Backup.log
echo -e "Backup Created By 	:	$name		" >> /mnt9/FA/MONTHLY_BACKUP/Backup.log
echo -e "Backup File		:	$daily_tar.tar.bz2" >> /mnt9/FA/MONTHLY_BACKUP/Backup.log
echo -e "Backup Location	:	/mnt9/FA/MONTHLY_BACKUP/" >> /mnt9/FA/MONTHLY_BACKUP/Backup.log
echo " " >> /mnt9/FA/MONTHLY_BACKUP/Backup.log
hours1=`date +%H`
min1=`date +%M`
sec1=`date +%S`
ddate2=`date +%s`
diff=$(($ddate2-$ddate1))
 echo $pass | sudo -S touch /mnt9/FA/MONTHLY_BACKUP/Backup_Duration.log
 echo $pass | sudo -S chmod 777 /mnt9/FA/MONTHLY_BACKUP/Backup_Duration.log
echo "Backup File		:   $daily_tar.tar.bz2 "  >> /mnt9/FA/MONTHLY_BACKUP/Backup_Duration.log
echo "Backup Location		:   /mnt9/FA/MONTHLY_BACKUP/ " >> /mnt9/FA/MONTHLY_BACKUP/Backup_Duration.log
echo "Starting Time		:   $hours:$min:$sec" >> /mnt9/FA/MONTHLY_BACKUP/Backup_Duration.log
echo "Ending Time		:   $hours1:$min1:$sec1" >> /mnt9/FA/MONTHLY_BACKUP/Backup_Duration.log
echo "Time taken for backup	:   $(($diff / 3600)):$((($diff / 60) % 60)):$(($diff % 60))"  >> /mnt9/FA/MONTHLY_BACKUP/Backup_Duration.log

