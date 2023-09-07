#!/bin/bash
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
# Getting
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
domain=$(cat /etc/xray/domain)
clear
echo -e "\033[1;93m┌───────────────────────────┐\033[0m"
read -p "   USER         : " user
read -p "   TANGGAL      : " tg
read -p "   TELEGRAM     : " tele
read -p "   WHATSAPP     : " wa
echo -e "\033[1;93m└───────────────────────────┘\033[0m"
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="<code>────────────────────</code>
<code>INFO MASKU -Transaksi</code>
<code>────────────────────</code>
<code>🌟WA      : $wa</code>
<code>🌟Tele    : $tele</code>
<code>🌟User    : $user</code>
<code>🌟Tanggal : $tg</code>
<code>🌟Isp     : $ISP</code>
<code>────────────────────</code>
<i>Notifikasi Via RVPNSTORES</i>
<b>Tele : @RVPNSTORES</b>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
# // Success
sleep 1
clear
clear && clear && clear
clear;clear;clear
echo -e ""
echo -e " ────────────────────"
echo -e " INFO MASKU -Transaksi "
echo -e " ────────────────────"
echo -e " 🌟WA      : ${wa}"
echo -e " 🌟Tele    : ${tele}"
echo -e " 🌟User    : ${user}"
echo -e " 🌟Tanggal : ${user}"
echo -e " 🌟Isp     : ${ISP}"
echo -e " ────────────────────"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
