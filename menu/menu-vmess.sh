#!/bin/bash
# Color Validation
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
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[36m"
GREEN='\033[0;32m'
grenbo="\e[92;1m"
yellow='\033[0;33m'
vlx=$(grep -c -e "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -e "^### " "/etc/xray/config.json")
let vma=$vmc/2
# VPS Information
domain=$(cat /etc/xray/domain)
#Status certificate
modifyTime=$(stat $HOME/.acme.sh/${domain}_ecc/${domain}.key | sed -n '7,6p' | awk '{print $2" "$3" "$4" "$5}')
modifyTime1=$(date +%s -d "${modifyTime}")
currentTime=$(date +%s)
stampDiff=$(expr ${currentTime} - ${modifyTime1})
days=$(expr ${stampDiff} / 86400)
remainingDays=$(expr 90 - ${days})
tlsStatus=${remainingDays}
if [[ ${remainingDays} -le 0 ]]; then
	tlsStatus="expired"
fi
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
openvpn_service="$(systemctl show openvpn.service --no-page)"
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udp1_service=$(systemctl status udp-mini-1 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udp2_service=$(systemctl status udp-mini-2 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
udp3_service=$(systemctl status udp-mini-3 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
Iptables=$(systemctl status netfilter-persistent | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
RClocal=$(systemctl status rc-local | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
Autorebot=$(systemctl status rc-local | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
UdpSSH=$(systemctl status udp-custom | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')

openssh=$( systemctl status ssh | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $openssh == "running" ]]; then
    status_openssh="${GREEN}Online$NC${c} │$NC"
else
    status_openssh="${RED}Offline${NC} "
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${GREEN}Online$NC${c} │$NC"
else
    status_ws_epro="${RED}Offline${NC} "
fi

# // Trojan Proxy
ss=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ss == "running" ]]; then
    status_ss="${GREEN}Online$NC${c} │$NC"
else
    status_ss="${RED}Offline${NC} "
fi

# // NGINX
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}Online$NC${c} │$NC"
else
    status_nginx="${RED}Offline${NC} "
fi

# STATUS SERVICE IPTABLES
if [[ $Iptables == "exited" ]]; then
    status_galo="${GREEN}Online$NC${c} │$NC"
else
    status_galo="${RED}Offline${NC}"
fi

# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${GREEN}Online$NC${c} │$NC"
else
   status_ssh="${RED}Offline${NC} "
fi

# STATUS OHP SSH
#if [[ $ohr == "running" ]]; then 
 #  sohr="${GREEN}Online${NC}${NC}"
#else
 #  sohr="${RED}Offline${NC} ${NC}"
#fi

# STATUS SERVICE OPENVPN
if [[ $oovpn == "active" ]]; then
  status_openvpn="${GREEN}Online$NC${c} │$NC"
else
  status_openvpn="${RED}Offline${NC} "
fi

# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh="${GREEN}Online$NC${c} │$NC"
else
   status_beruangjatuh="${RED}Offline${NC} ${NC}"
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${GREEN}Online$NC${c} │$NC"
else
   status_haproxy="${RED}Offline${NC} "
fi

# STATUS SERVICE  SQUID 
#if [[ $squid_service == "running" ]]; then 
  # status_squid="${GREEN}Online${NC} ( No Etror )"
#else
  # status_squid="${RED}Offline${NC} "
#fi

# STATUS SERVICE  FAIL2BAN 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban="${GREEN}Online$NC${c} │$NC"
else
   status_fail2ban="${RED}Offline${NC} "
fi

# STATUS SERVICE  CRONS 
if [[ $cron_service == "running" ]]; then 
   status_cron="${GREEN}Online$NC${c} │$NC"
else
   status_cron="${RED}Offline${NC} "
fi

# STATUS SERVICE  BADVPN 1
if [[ $udp1_service == "running" ]]; then 
   status_udp1="${GREEN}Online$NC${c} │$NC"
else
   status_udp1="${RED}Offline${NC} "
fi

# STATUS SERVICE  BADVPN 2
if [[ $udp2_service == "running" ]]; then 
   status_udp2="${GREEN}Online$NC${c} │$NC"
else
   status_udp2="${RED}Offline${NC} "
fi

# STATUS SERVICE  BADVPN 3
if [[ $udp3_service == "running" ]]; then 
   status_udp3="${GREEN}Online$NC${c} │$NC"
else
   status_udp3="${RED}Offline${NC} "
fi

if [[ $RClocal == "exited" ]]; then
    status_galoo="${GREEN}Online$NC${c} │$NC"
else
    status_galoo="${RED}Offline${NC}"
fi

if [[ $Autorebot == "exited" ]]; then
    status_galooo="${GREEN}Online$NC${c} │$NC"
else
    status_galooo="${RED}Offline${NC}"
fi

# STATUS SERVICE  SSH UDP 
if [[ $UdpSSH == "running" ]]; then 
   status_udp="${GREEN}Online$NC${c} │$NC"
else
   status_udp="${RED}Offline${NC} "
fi

# // Running Function 
# Download
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│               • XRAY MENU •                  \033[1;93m"
echo -e "\e[33m└─────────────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "${Blue}Service Xray_Vmess_TLS$NC      $grenbo:$NC $status_ss"
echo -e "${Blue}Service Xray_Vmess_gRPC$NC     $grenbo:$NC $status_ss"
echo -e "${Blue}Service Xray_Vmess_None_TLS$NC $grenbo:$NC $status_ss"
echo -e "${Blue}Service Xray_Vless_TLS$NC      $grenbo:$NC $status_ss"
echo -e "${Blue}Service Xray_Vless_gRPC$NC     $grenbo:$NC $status_ss"
echo -e "\e[33m└─────────────────────────────────────────────────┘\033[0m"
echo -e "${BICyan}\033[0m ${BOLD}  ${GREEN}    ${BIYellow}  ${BIYellow}    VMESS  ${GREEN}      ${BIYellow}VLESS  ${GREEN}     $NC "
echo -e "${BICyan}\033[0m ${Blue}              $vma           $vla                         $NC"
echo -e "\033[1;93m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│\033[0m          ${RED}SCRIPT BY RVPN STORES   $NC \033[1;93m           \033[0m"
echo -e "\033[1;93m└─────────────────────────────────────────────────┘\033[0m"
echo -e " [\e[36m•01\e[0m] Buat Akun Vmess        [\e[36m•06\e[0m] Buat Akun Vless"
echo -e " [\e[36m•02\e[0m] Trial Akun Vmess       [\e[36m•07\e[0m] Trial Akun Vless"
echo -e " [\e[36m•03\e[0m] Perpanjang akun Vmess  [\e[36m•08\e[0m] Perpanjang Akun Vless"
echo -e " [\e[36m•04\e[0m] Hapus Akun Vmess       [\e[36m•09\e[0m] Hapus Akun Vless"
echo -e " [\e[36m•05\e[0m] Cek User Login Vmess   [\e[36m•10\e[0m] Cek User Login Vless"
echo -e ""
echo -e " [\e[36m•0\e[0m] Kembali Ke menu         [\e[36m•x\e[0m] Exit"
echo -e ""
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" 
echo -e "${BICyan}$NC ${BICyan}HARI ini${NC}: $ttoday$NC ${BICyan}KEMARIN${NC}: $tyest$NC ${BICyan}BULAN${NC}: ${red}$tmon$NC $NC"
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu :  "  opt
case $opt in
1 | 01) clear ; add-ws ; exit ;;
2 | 02) clear ; trialvmess ; exit ;;
3 | 03) clear ; renew-ws ; exit ;;
4 | 04) clear ; del-ws ; exit ;;
5 | 05) clear ; cek-ws ; exit ;;
6 | 06) clear ; add-vless ; exit ;;
7 | 07) clear ; trialvless ; exit ;;
8 | 08) clear ; renew-vless ; exit ;;
9 | 09) clear ; del-vless ; exit ;;
10| 10) clear ; cek-vless ; exit ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Menu yg anda pilih tidak valid " ; sleep 1 ; xmenu ;;
esac
