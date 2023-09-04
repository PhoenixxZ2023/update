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
IP=$(curl -sS ipv4.icanhazip.com)
Login=Trial-`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " Set Expired In Minutes           "
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
read -p " Menit : " pup
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>      XRAY/VMESS</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Remarks   : ${user}
Domain    : ${domain}
Port TLS  : 400-900
Port NTLS : 80, 8080, 8081-9999
id        : ${uuid}
alterId   : 0
Security  : auto
network   : ws or grpc
Path      : /Multi-Path
Dynamic   : https://bugmu.com/path
Name      : vmess-grpc</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code> VMESS WS TLS</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>${vmesslink1}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>VMESS WS NO TLS</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>${vmesslink2}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code> VMESS gRPC</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>${vmesslink3}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Format OpenClash :</code> <code>https://${domain}:81/vmess-$user.txt</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Expired Until  :</code> <code>$expe</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
echo ""
mkdir -p /etc/vmess
if [ ! -e /etc/vmess ]; then
    mkdir -p /etc/vmess
    touch /etc/vmess/.vmess.db
fi
vms=$(cat /etc/vmess/.vmess.db)
if [[ $vms = "" ]]; then
    vm="0"
else
    vm=$(cat /etc/vmess/.vmess.db | grep "#vm#" | wc -l)
fi
echo ""
cat > /var/www/html/ssh-$Login.txt <<-END
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " Xray/Vmess Account "
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
#echo -e "User Quota       : ${Quota} GB"
echo -e "Port TLS         : 400-900"
echo -e "Port none TLS    : 80, 8080, 8081-9999"
echo -e "id               : ${uuid}"
echo -e "alterId          : 0"
echo -e "Security         : auto"
echo -e "Network          : ws"
echo -e "Path             : /Multi-Path"
echo -e "Dynamic          : https://bugmu.com/path"
echo -e "ServiceName      : vmess-grpc"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link TLS         : ${vmesslink1}"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link none TLS    : ${vmesslink2}"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link GRPC        : ${vmesslink3}"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Format OpenClash : https://${domain}:81/vmess-$user.txt"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Expired Until    : $pup Menit"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu


END
echo userdel -f "$Login" | at now + $pup minutes
clear
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " Xray/Vmess Account "
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
#echo -e "User Quota       : ${Quota} GB"
echo -e "Port TLS         : 400-900"
echo -e "Port none TLS    : 80, 8080, 8081-9999"
echo -e "id               : ${uuid}"
echo -e "alterId          : 0"
echo -e "Security         : auto"
echo -e "Network          : ws"
echo -e "Path             : /Multi-Path"
echo -e "Dynamic          : https://bugmu.com/path"
echo -e "ServiceName      : vmess-grpc"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link TLS         : ${vmesslink1}"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link none TLS    : ${vmesslink2}"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Link GRPC        : ${vmesslink3}"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Format OpenClash : https://${domain}:81/vmess-$user.txt"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Expired Until    : $pup Menit"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
