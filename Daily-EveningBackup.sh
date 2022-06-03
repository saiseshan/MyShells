#!/bin/bash
#
# Author:  Sai Seshan V
#
#/* Daily Evening Backup Script For FA Server */
source ~/.bash_profile
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
daily_tar=Evening_Backup-$daily_dir$date1
#echo  daily_dir=$daily_dir   and daily_tar= $daily_tar
echo -e ""
echo -e ""
echo -e ""
echo -e "\e[0;31m		\e[5mEVENING BACKUP\e[0m"
echo -e ""
echo -e	"Today's Date		:	$day-$month-$year"
echo -e  ""
echo -n "Please Enter Your Name	:       ";read name
echo -n "Please Enter Your Login Password	:       ";read pass
echo -e  ""
echo -e "Backup started by \e[0;31m$name\e[0m on \e[0;31m$date\e[0m"
echo $pass | sudo -S fine /mnt9/FA/EVENING_BACKUP/RAW/ -mtime +4 -type d  -exec  sudo -S /sbin/rm  -rfv {} \;
##echo $pass | sudo -S /bin/chmod 777  /mnt9/FA/EVENING_BACKUP/RAW/$daily_dir/usr1/ca/mcfc/mst
echo $pass | sudo -S /bin/mkdir -p /mnt9/FA/EVENING_BACKUP/RAW/$daily_dir
echo $pass | sudo -S chmod 777 /mnt9/FA/EVENING_BACKUP/RAW/$daily_dir
#echo $pass | sudo -S /bin/mkdir -p /mnt9/FA/EVENING_BACKUP/TAR
#echo $pass | sudo -S chmod 777 /mnt9/FA/EVENING_BACKUP/TAR
#echo $pass | sudo -S /bin/mkdir -p /mnt9/FA/EVENING_BACKUP/TXT
#echo $pass | sudo -S /bin/chmod 777 /mnt9/FA/EVENING_BACKUP/TXT
echo $pass | sudo -S /bin/mkdir -p /mnt9/FA/EVENING_BACKUP/RAW/$daily_dir
echo $pass | sudo -S chmod 777  /mnt9/FA/EVENING_BACKUP/RAW/$daily_dir
#echo $pass | sudo -S /bin/mkdir -p /mnt9/FA/EVENING_BACKUP/TAR
#echo $pass | sudo -S /bin/chmod 777 /mnt9/FA/EVENING_BACKUP/TAR
#echo $pass | sudo -S /bin/mkdir -p /mnt9/FA/EVENING_BACKUP/TXT
#echo $pass | sudo -S /bin/chmod 777 /mnt9/FA/EVENING_BACKUP/TXT
echo $pass | sudo -S /bin/mkdir -p /mnt9/FA/EVENING_BACKUP/RAW/$daily_dir/usr1/fa/
echo $pass | sudo -S chmod 777 /mnt9/FA/EVENING_BACKUP/RAW/$daily_dir/usr1/fa/
echo $pass | sudo -S /bin/mkdir -p /mnt9/FA/EVENING_BACKUP/RAW/$daily_dir/usr1/ca/
echo $pass | sudo -S chmod 777 /mnt9/FA/EVENING_BACKUP/RAW/$daily_dir/usr1/ca/
###########################
PATH=/mnt9/FA/EVENING_BACKUP/
cd /usr1 
echo $pass | /usr/bin/sudo -S /sbin/rsync -R -avzp --exclude=ca  . $PATH/RAW/$daily_dir/usr1/ 
echo $pass | /usr/bin/sudo -S /sbin/rsync -R -avzp --exclude=mcm* --exclude=mcf* ca  $PATH/RAW/$daily_dir/usr1/ 
echo $pass | /usr/bin/sudo -S /sbin/rsync -R  -avzp ca/mcfz  $PATH/RAW/$daily_dir/usr1/
echo $pass | /usr/bin/sudo -S /sbin/rsync -R -avzp ca/kdx  $PATH/RAW/$daily_dir/usr1/
echo $pass | /usr/bin/sudo -S /sbin/rsync -R -avzp ca/mcmkz  $PATH/RAW/$daily_dir/usr1/
echo $pass | /usr/bin/sudo -S /sbin/rsync -R -avzp ca/mcmmz  $PATH/RAW/$daily_dir/usr1/
##### USR2 #####
cd /usr2
echo $pass |/usr/bin/sudo -S /sbin/rsync  -R -avzp --exclude=ca .  $PATH/RAW/$daily_dir/usr2/
echo $pass | /usr/bin/sudo -S /sbin/rsync -R -avzp --exclude=mcm* --exclude=mcf* ca  $PATH/RAW/$daily_dir/usr2/ 



###########################
date1=`/bin/date +"%d-%m-%Y  %H:%M:%S"`
sleep 5
clear
#echo "nameserver 8.8.8.8" > /etc/resolv.conf
touch /tmp/Mail-$daily_tar.txt
echo "# # # # # # # # # # # # # # # # # # # # # # # #" > /tmp/Mail-$daily_tar.txt
echo "		      Backup Deatils		     " >> /tmp/Mail-$daily_tar.txt
echo "# # # # # # # # # # # # # # # # # # # # # # # #" >> /tmp/Mail-$daily_tar.txt
echo "						     " >> /tmp/Mail-$daily_tar.txt
echo " Backup Created on	:   $date	" >> /tmp/Mail-$daily_tar.txt
echo " Backup Created by	:   $name	" >> /tmp/Mail-$daily_tar.txt 
#echo " Backup File		:   $dialy_tar.tar.bz2	" >> /tmp/Mail-$daily_tar.txt 
#echo " Backup File Location	:   /mnt9/FA/EVENING_BACKUP/	" >> /tmp/Mail-$daily_tar.txt
echo " Backup File		:   $dialy_tar.tar.bz2	" >> /tmp/Mail-$daily_tar.txt 
echo " Backup File Location	:   /mnt9/FA/EVENING_BACKUP/	" >> /tmp/Mail-$daily_tar.txt
echo "# # # # # # # # # # # # # # # # # # # # # # # #" >> /tmp/Mail-$daily_tar.txt
mutt -s "Evening Backup Status" saiseshan.v@margadarsi.com < /tmp/Mail-$daily_tar.txt
echo "Sending Mail , Please wait."
sleep 10
echo " Mail Sent Successfully "
echo -e "\e[31mEVENING BACKUP\e[0m successfully done by \e[31m$name\e[0m on $date"
touch /mnt9/FA/EVENING_BACKUP/Backup.log
touch /mnt9/FA/EVENING_BACKUP/Backup.log
sudo chmod 777 /mnt9/FA/EVENING_BACKUP/Backup.log
echo -e "##################################################" >> /mnt9/FA/EVENING_BACKUP/Backup.log
echo "		$date			" >> /mnt9/FA/EVENING_BACKUP/Backup.log
echo -e "##################################################" >> /mnt9/FA/EVENING_BACKUP/Backup.log
echo -e "Backup Created By 	:	$name		" >> /mnt9/FA/EVENING_BACKUP/Backup.log
echo -e "Backup File		:	$daily_tar.tar.bz2" >> /mnt9/FA/EVENING_BACKUP/Backup.log
echo -e "Backup Location	:	/mnt9/FA/EVENING_BACKUP/" >> /mnt9/FA/EVENING_BACKUP/Backup.log
echo " " >> /mnt9/FA/EVENING_BACKUP/Backup.log
/bin/touch /mnt9/FA/EVENING_BACKUP/Backup.log
echo -e "##################################################" >> /mnt9/FA/EVENING_BACKUP/Backup.log
echo "		$date			" >> /mnt9/FA/EVENING_BACKUP/Backup.log
echo -e "##################################################" >> /mnt9/FA/EVENING_BACKUP/Backup.log
echo -e "Backup Created By 	:	$name		" >> /mnt9/FA/EVENING_BACKUP/Backup.log
echo -e "Backup File		:	$daily_tar.tar.bz2" >> /mnt9/FA/EVENING_BACKUP/Backup.log
echo -e "Backup Location		:	/mnt9/FA/EVENING_BACKUP/" >> /mnt9/FA/EVENING_BACKUP/Backup.log
echo " " >> /mnt9/FA/EVENING_BACKUP/Backup.log
hours1=`/bin/date +%H`
min1=`/bin/date +%M`
sec1=`/bin/date +%S`
ddate2=`/bin/date +%s`
diff=$(($ddate2-$ddate1))

touch  /mnt9/FA/EVENING_BACKUP/Backup_Duration.log
echo "####################################################" >> /mnt9/FA/EVENING_BACKUP/Backup_Duration.log
echo -e "Backup Created By 	:	$name		" >> /mnt9/FA/EVENING_BACKUP/Backup_Duration.log
echo "Backup File		:   $daily_tar.tar.bz2 " >> /mnt9/FA/EVENING_BACKUP/Backup_Duration.log
echo "Backup Location		:   /mnt9/FA/EVENING_BACKUP/ " >> /mnt9/FA/EVENING_BACKUP/Backup_Duration.log
echo "Starting Time		:   $hours:$min:$sec" >> /mnt9/FA/EVENING_BACKUP/Backup_Duration.log
echo "Ending Time		:   $hours1:$min1:$sec1" >> /mnt9/FA/EVENING_BACKUP/Backup_Duration.log
echo "Time taken for backup	:   $(($diff / 3600)):$((($diff / 60) % 60)):$(($diff % 60))" >> /mnt9/FA/EVENING_BACKUP/Backup_Duration.log

sleep 5
echo "Backup File		:   $daily_tar.tar.bz2 "
echo "Backup Location		:   /mnt9/FA/EVENING_BACKUP/ "
echo "Starting Time		:   $hours:$min:$sec"
echo "Ending Time		:   $hours1:$min1:$sec1"
echo "Time taken for backup	:   $(($diff / 3600)):$((($diff / 60) % 60)):$(($diff % 60))"
