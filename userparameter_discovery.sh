#!/bin/bash
############################################################
# $Name:         disk_discovery.sh
# $Function:     DISK DISCOVERY
# $Author:       Mr.nong
# $organization: nongziyi.xin
# $Create Date:  2018/1/25
# $Description:  Monitor DISK DISCOVERY
############################################################

disk_array=(`grep -E "(vd[a-z]$|sd[a-z]$)" /proc/partitions | awk '{print $4}'`)
length=${#disk_array[@]}
printf "{\n"
printf  '\t'"\"data\":["
for ((i=0;i<$length;i++))
do
        printf '\n\t\t{'
        printf "\"{#DISK_NAME}\":\"${disk_array[$i]}\"}"
        if [ $i -lt $[$length-1] ];then
                printf ','
        fi
done
printf  "\n\t]\n"
printf "}\n"
