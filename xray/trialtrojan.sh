#!/bin/bash
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
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
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " Set Expired In Minutes           "
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
read -p " Menit : " pup
clear
domain=$(cat /etc/xray/domain)
masaaktif=1
Quota=5
user=trial-`</dev/urandom tr -dc 0-9 | head -c3`
clear
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
sed -i '/#trojanws$/a\#tr# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#tr# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@bugkamu.com:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"

cat >/var/www/html/trojan-$user.txt <<-END

◇━━━━━━━━━━━━━━━━━◇
  G E O  P R O J E C T 
◇━━━━━━━━━━━━━━━━━◇
 https://github.com/wokszxd
◇━━━━━━━━━━━━━━━━━◇
# Format Trojan GO/WS

- name: Trojan-$user-GO/WS
  server: ${domain}
  port: 443
  type: trojan
  password: ${uuid}
  network: ws
  sni: ${domain}
  skip-cert-verify: true
  udp: true
  ws-opts:
    path: /trojan-ws
    headers:
        Host: ${domain}

# Format Trojan gRPC

- name: Trojan-$user-gRPC
  type: trojan
  server: ${domain}
  port: 443
  password: ${uuid}
  udp: true
  sni: ${domain}
  skip-cert-verify: true
  network: grpc
  grpc-opts:
    grpc-service-name: trojan-grpc

◇━━━━━━━━━━━━━━━━━◇
Link Akun Trojan 
◇━━━━━━━━━━━━━━━━━◇
Link WS          : 
${trojanlink}
◇━━━━━━━━━━━━━━━━━◇
Link GRPC        : 
${trojanlink1}
◇━━━━━━━━━━━━━━━━━◇

trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@bugkamu.com:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"

END
if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/trojan/${user}
fi
DATADB=$(cat /etc/trojan/.trojan.db | grep "^#tr#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan/.trojan.db
fi
echo "#tr# ${user} ${exp} ${uuid}" >>/etc/trojan/.trojan.db
clear
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>TRIAL TROJAN Account</code>
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
Name      : trojan-grpc</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code> VLESS WS TLS</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>${trojanlink}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>VLESS WS NO TLS</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>${trojanlink1}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Format OpenClash :</code> <code>https://${domain}:81/vmess-$user.txt</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Expired Until  :</code> <code>$pup Menit</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
clear
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " Xray/TROJAN Account          "
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "Remarks          : ${user}" 
echo -e "Host/IP          : ${domain}"
#echo -e "User Quota       : ${Quota} GB"
echo -e "port             : 400-900" 
echo -e "Key              : ${uuid}" 
echo -e "Path             : /trojan-ws" 
echo -e "ServiceName      : trojan-grpc" 
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Link WS          : ${trojanlink}" 
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Link GRPC        : ${trojanlink1}" 
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Format OpenClash : https://${domain}:81/trojan-$user.txt" 
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Expired Until    : $pup Menit"
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo "" 
read -n 1 -s -r -p "Press any key to back on menu"
menu
