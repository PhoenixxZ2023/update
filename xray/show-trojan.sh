#!/bin/bash
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "     =[ Member Trojan Account ]=         "
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -n > /var/log/xray/accsess.log
data=( `cat /etc/xray/config.json | grep '#!' | cut -d ' ' -f 2 | sort | uniq`);
for user in "${data[@]}"
do
lquota=Unlimited
echo > /dev/null
jum=$(cat /etc/xray/config.json | grep -c '#!' | awk '{print $1/2}')
if [[ $jum -gt 0 ]]; then
exp=$(grep -wE "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
echo -e "\e[33;1mUser\e[32;1m  : $user"
echo -e "\e[33;1mLimit\e[32;1m : $wey GB"
echo -e "\e[33;1mExp\e[32;1m   : $exp"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "slot" >> /root/.system
else
echo > /dev/null
fi
sleep 0.1
done
aktif=$(cat /root/.system | wc -l)
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"        
echo -e "$aktif Member Active"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sed -i "d" /root/.system
