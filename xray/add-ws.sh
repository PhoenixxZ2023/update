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
export CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
export KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
checking_sc
echo -e "\e[32mloading...\e[0m"
clear
source /var/lib/SIJA/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi

#tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
#none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e "CREATE VMESS ACCOUNT           "
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"

		read -rp "User       : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"
            echo -e " CREATE VMESS ACCOUNT           "
            echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"

			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
			read -n 1 -s -r -p "Press any key to back on menu"
      menu-vmess
		fi
	done
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Limit (IP) : " iplimit
read -p "Quota (GB) : " Quota
read -p "Exp (Hari) : " masaaktif
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\#vm# '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\#vm# '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json

asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1


cat >/var/www/html/vmess-$user.txt <<-END

◇━━━━━━━━━━━━━━━━━◇
  A S U W  P R O J E C T 
◇━━━━━━━━━━━━━━━━━◇

◇━━━━━━━━━━━━━━━━━◇
# Format Vmess WS TLS

- name: Vmess-$user-WS TLS
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}

# Format Vmess WS Non TLS

- name: Vmess-$user-WS Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}

# Format Vmess gRPC

- name: Vmess-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
    grpc-service-name: vmess-grpc

◇━━━━━━━━━━━━━━━━━◇
 Link Akun Vmess                   
◇━━━━━━━━━━━━━━━━━◇
Link TLS         : 
${vmesslink1}
◇━━━━━━━━━━━━━━━━━◇
Link none TLS    : 
${vmesslink2}
◇━━━━━━━━━━━━━━━━━◇
Link GRPC        : 
${vmesslink3}
◇━━━━━━━━━━━━━━━━━◇

END
if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/wokszxd/limit/vmess/ip
echo -e "$iplimit" > /etc/wokszxd/limit/vmess/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vmess/${user}
fi
DATADB=$(cat /etc/vmess/.vmess.db | grep "^#vm#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "#vm# ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vmess/.vmess.db
clear
CHATID=$CHATID
KEY=$KEY
TIME=$TIME
URL=$URL
TEXT="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>     Xray/Vmess Account</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Remarks   : ${user}
Domain    : ${domain}
Limit Quota: ${Quota} GB
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
<code> VMESS GRPC</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>${vmesslink3}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Format OpenClash :</code> <code>https://${domain}:81/vmess-$user.txt</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Expired Until  :</code> <code>$expe</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>INFO MASKU -Transaksi</code>
<code>────────────────────</code>
<b>  ⚠️TRANSAKSI VMESS WS⚠️      </b>
<code>────────────────────</code>
<code>🌟Owner   : $user</code>
<code>🌟Detail  : $AKUN</code>
<code>🌟Durasi  : $expe</code>
<code>🌟Server  : $domain</code>
<code>────────────────────</code>
<i>Notifikasi Via RVPN STORES</i>
<b>Tele : @</b>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
clear
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "\\E[40;1;37m Xray/Vmess Account        \E[0m" 
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Remarks        : ${user}" 
echo -e "Domain         : ${domain}" 
echo -e "User Quota     : ${Quota} GB"
echo -e "User Ip        : ${iplimit} IP"
echo -e "Port TLS       : 443" 
echo -e "Port none TLS  : 80" 
echo -e "id             : ${uuid}" 
echo -e "alterId        : 0" 
echo -e "Security       : auto" 
echo -e "Network        : ws" 
echo -e "Path           : /vmess" 
echo -e "ServiceName    : vmess-grpc" 
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Link TLS       : ${vmesslink1}" 
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Link none TLS  : ${vmesslink2}" 
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Link GRPC      : ${vmesslink3}" 
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Format OpenClash : https://${domain}:81/vmess-$user.txt" 
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo -e "Expired Until  : $expe"
echo -e "\e[33m◇━━━━━━━━━━━━━━━━━◇\033[0m" 
echo ""
