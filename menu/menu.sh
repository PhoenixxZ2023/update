#!/bin/bash
#link izin ip vps
url_izin='https://raw.githubusercontent.com/rizkyckj/izin/master/izin'

#IP VPS
ip_vps=$(curl -sS ifconfig.me)

# Mendapatkan isi file izin.txt dari URL
izin=$(curl -s "$url_izin")

# Memeriksa apakah konten izin.txt berhasil didapatkan
if [[ -n "$izin" ]]; then
  while IFS= read -r line; do
    # Memisahkan nama VPS, IP VPS, dan tanggal kadaluwarsa
    nama=$(echo "$line" | awk '{print $1}')
    ipvps=$(echo "$line" | awk '{print $2}')
    tanggal=$(echo "$line" | awk '{print $3}')

    # Memeriksa apakah IP VPS saat ini cocok dengan IP VPS yang ada di izin.txt
    if [[ "$ipvps" == "$ip_vps" ]]; then
      echo "Nama VPS: $nama"
      echo "IP VPS: $ipvps"
      echo "Tanggal Kadaluwarsa: $tanggal"
      break
    fi
  done <<< "$izin"

  # Memeriksa apakah IP VPS ditemukan dalam izin.txt
  if [[ "$ipvps" != "$ip_vps" ]]; then
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ip_vps \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/RVPNSTORES"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6281935718766"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit 0
  fi
else
  echo "Konten izin.txt tidak berhasil didapatkan dari URL"
  exit 0
fi

cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${BBlue}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${BBlue}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${BBlue}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${BBlue}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
# STATUS SERVICE UDP CUSTOM
if [[ $udpc == "running" ]]; then
   udp2="${GB}[ ON ]${NC}${NC}"
else
   udp2="${RB}[ OFF ]${NC}"
fi
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[36m"
GREEN='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
KONENG="\033[1;93m"
Dev="RVPN STORES"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 ) 
CITY=$(curl -s ipinfo.io/city )
NS=$(cat /etc/xray/dns)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
Exp="Lifetime "
Name="RVPN"
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
if [ ! -e /etc/vmess ]; then
    mkdir -p /etc/vmess
    touch /etc/vmess/.vmess.db
fi
vms=$(cat /etc/vmess/.vmess.db)
if [[ $vms = "" ]]; then
    vm="0"
else
    vm=$(cat /etc/vmess/.vmess.db | grep "###" | wc -l)
fi

if [ ! -e /etc/vless ]; then
    mkdir -p /etc/vless
    touch /etc/vless/.vless.db
fi
vms=$(cat /etc/vless/.vless.db)
if [[ $vms = "" ]]; then
    vl="0"
else
    vl=$(cat /etc/vless/.vless.db | grep "###" | wc -l)
fi

if [ ! -e /etc/trojan ]; then
    mkdir -p /etc/trojan
    touch /etc/trojan/.trojan.db
fi
vms=$(cat /etc/trojan/.trojan.db)
if [[ $vms = "" ]]; then
    tr="0"
else
    tr=$(cat /etc/trojan/.trojan.db | grep "###" | wc -l)
fi
if [ ! -e /etc/shadowsocks ]; then
    mkdir -p /etc/shadowsocks
    touch /etc/shadowsocks/.shadowsocks.db
fi
vms=$(cat /etc/shadowsocks/.shadowsocks.db)
if [[ $vms = "" ]]; then
    ss="0"
else
    ss=$(cat /etc/shadowsocks/.shadowsocks.db | grep "###" | wc -l)
fi
if [ ! -e /etc/ssh ]; then
    mkdir -p /etc/ssh
    touch /etc/ssh/.ssh.db
fi
vms=$(cat /etc/ssh/.ssh.db)
if [[ $vms = "" ]]; then
    ssh="0"
else
    ssh=$(cat /etc/ssh/.ssh.db | grep "###" | wc -l)
fi
clear
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐${NC}"
echo -e "\033[1;93m│ ${BGX}               RVPN STORES TUNNELING              ${NC} ${NC}"
echo -e "\033[1;93m└─────────────────────────────────────────────────┘${NC}"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐${NC}"
echo -e "\033[1;93m│ ${NC}System OS${NC}     : ${NC}$MODEL${NC}"
echo -e "\033[1;93m│ ${NC}Server RAM${NC}    : ${NC}$RAM MB $NC"
echo -e "\033[1;93m│ ${NC}Uptime Server${NC} : ${NC}$SERONLINE${NC}"
echo -e "\033[1;93m│ ${NC}Core System${NC}   : ${NC}$CORE${NC}"
echo -e "\033[1;93m│ ${NC}Date${NC}          : ${NC}$DATEVPS${NC}"
echo -e "\033[1;93m│ ${NC}Time${NC}          : ${NC}$TIMEZONE${NC}"
echo -e "\033[1;93m│ ${NC}ISP ${NC}          : ${NC}$ISP${NC}"
echo -e "\033[1;93m│ ${NC}CITY${NC}          : ${NC}$CITY${NC}"
echo -e "\033[1;93m│ ${NC}IP VPS${NC}        : ${KONENG}$IPVPS${NC}"
echo -e "\033[1;93m│ ${NC}Domain${NC}        : ${KONENG}$domain${NC}"
echo -e "\033[1;93m│ ${NC}NS Domain${NC}     : $NS${NC}"
echo -e "\033[1;93m└─────────────────────────────────────────────────┘${NC}"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐${NC}"
echo -e "\033[1;93m│   ${Blue}XRAY${NC}: [${v2r}]     ${Blue}NGINX${NC}: [${ngx}${NC}]     ${Blue}HAPROXY${NC}: [${ngx}${NC}]  ${KONENG}${NC}"
echo -e "\033[1;93m└─────────────────────────────────────────────────┘${NC}"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│\e[0m ${KONENG}SSH  VMESS   VLESS  TROJAN   SHADOWSOCKS$NC"
echo -e "\033[1;93m│\e[0m ${Blue} $ssh     $vm       $vl      $tr           $ss   $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m   ┌───────────────────────────────────────────┐${NC}"
echo -e "\033[1;93m   │  ${NC}Version     : v1.0.7 LTS${NC}"
echo -e "\033[1;93m   │  ${NC}Author Name : ${KONENG}$Dev${NC}"
echo -e "\033[1;93m   │  ${NC}Client Name : ${RED}$nama${NC}"
echo -e "\033[1;93m   │  ${NC}Expiry In   : ${RED}$tanggal${NC}"
echo -e "\033[1;93m   └───────────────────────────────────────────┘${NC}"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐${NC}"
echo -e "\033[1;93m│  ${KONENG}[1] ${NC}☞ SSH&OVPN ${NC}""    \033[33m  ${KONENG}[6] ${NC}☞ FEATURES ${NC}"
echo -e "\033[1;93m│  ${KONENG}[2] ${NC}☞ VMESS ${NC}"        "      \033[33m  ${KONENG}[7] ${NC}☞ REBOOT ${NC}"
echo -e "\033[1;93m│  ${KONENG}[3] ${NC}☞ VLESS ${NC}"         "      \033[33m  ${KONENG}[8] ${NC}☞ ATUR BOT NOTIF ${NC}"
echo -e "\033[1;93m│  ${KONENG}[4] ${NC}☞ TROJAN ${NC}"     "     \033[33m  ${KONENG}[9] ${NC}☞ CHANGE BANNER ${NC}"
echo -e "\033[1;93m│  ${KONENG}[5] ${NC}☞ SHADOWSHOCK ${NC}"     "\033[33m  ${KONENG}[10]${NC}☞ INFO PORT ${NC}"
echo -e "\033[1;93m└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -p " Select Options [ 1 - 6 or x exit ] : " menu
case $menu in
1)
    menu-ssh
    ;;
2)
    menu-vmess
    ;;
3)
    menu-vless
    ;;
4)
    menu-trojan
    ;;
5)
    menu-shadowsocks
    ;;
6)
    menu-set
    ;;
*)
    menu
    ;;
esac
