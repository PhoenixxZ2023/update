BIBlack='\033[1;90m' 
Tes sih ini     # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="raw.githubusercontent.com/Zeastore/test/main"
export Server1_URL="raw.githubusercontent.com/Zeastore/limit/main"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther=".geovpn"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

# // Exporting Network Interface
export NETWORK_IFACE="$(ip route show to default | awk '{print $5}')"

# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
function addhost(){
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
setting-menu
else
rm -fr /etc/xray/domain
echo "IP=$host" > /var/lib/scrz-prem/ipvps.conf
echo $host > /etc/xray/domain
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Dont forget to renew gen-ssl"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
}
function genssl(){
clear
systemctl stop nginx
systemctl stop xray
domain=$(cat /var/lib/scrz-prem/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew gen-ssl... " 
sleep 2
/root/.acme.sh/acme.sh --upgrade
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew gen-ssl done... " 
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek " 
sleep 2
echo $domain > /etc/xray/domain
systemctl start nginx
systemctl start xray
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Penyet sak karepmu cuk"
menu
}
wget -q -O /root/status "https://raw.githubusercontent.com/Agunxzzz/XrayCol/main/statushariini"
LocalVersion=$(cat /root/versi)
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"
clear
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[39;1;92m                   ⇱ SERVER INFORMATION ⇲                      \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${BICyan} "                                                                      
echo -e "${BICyan} ⇲  ${BICyan}Script Name     :  ${BIYellow}XrayCol V $LocalVersion${NC}"    
echo -e "${BICyan} ⇲  ${BICyan}Current Domain  :  ${BIYellow}$(cat /etc/xray/domain)${NC}" 
echo -e "${BICyan} ⇲  ${BICyan}Ip-vps          :  ${BIYellow}$IPVPS${NC}"
echo -e "${BICyan} ⇲  ${BICyan}ISP             :  ${BIYellow}$ISPVPS${NC}"  
echo -e "${BICyan} ⇲  ${BICyan}Status Hari Ini :  ${BIYellow}$(cat /root/status)${NC}"                                 
echo -e "${BICyan} "
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[39;1;92m                    ⇱ STATUS SERVICE ⇲                        \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "     ${BICyan} NGINX ${NC}: ${GREEN}$resngx         ${LIGHT} Today  : $ttoday"
echo -e "     ${BICyan} XRAY  ${NC}: ${GREEN}$resv2r         ${LIGHT} Monthly: $tmon"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[39;1;92m                     ⇱ MENU SERVICE ⇲                         \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " ${BICyan}[${BIWhite}01${BICyan}]${RED} •${NC} ${CYAN}SSH MENU      $NC  ${BICyan}[${BIWhite}12${BICyan}]${RED} • ${NC}${CYAN}RUNNING $NC"
echo -e " ${BICyan}[${BIWhite}02${BICyan}]${RED} •${NC} ${CYAN}VMESS MENU      $NC  ${BICyan}[${BIWhite}13${BICyan}]${RED} • ${NC}${CYAN}VPS INFO $NC"
echo -e " ${BICyan}[${BIWhite}03${BICyan}]${RED} •${NC} ${CYAN}VLESS MENU     $NC  ${BICyan}[${BIWhite}14${BICyan}]${RED} • ${NC}${CYAN}CEK TRAFFIC $NC"
echo -e " ${BICyan}[${BIWhite}04${BICyan}]${RED} •${NC} ${CYAN}TROJAN MENU     $NC  ${BICyan}[${BIWhite}15${BICyan}]${RED} • ${NC}${CYAN}CREATE SLOW  $NC"
echo -e " ${BICyan}[${BIWhite}05${BICyan}]${RED} •${NC} ${CYAN}S-SOCK MENU         $NC  ${BICyan}[${BIWhite}16${BICyan}]${RED} • ${NC}${CYAN}BOT BACKUP $NC"
echo -e " ${BICyan}[${BIWhite}06${BICyan}]${RED} •${NC} ${CYAN}AUTO REBOOT     $NC  ${BICyan}[${BIWhite}17${BICyan}]${RED} • ${NC}${CYAN}REBOOT $NC"
echo -e " ${BICyan}[${BIWhite}07${BICyan}]${RED} •${NC} ${CYAN}UPDATE SCRIPT        $NC  ${BICyan}[${BIWhite}18${BICyan}]${RED} • ${NC}${CYAN}RESTART $NC"
echo -e " ${BICyan}[${BIWhite}08${BICyan}]${RED} •${NC} ${CYAN}DELL ALL EXP    $NC  ${BICyan}[${BIWhite}19${BICyan}]${RED} • ${NC}${CYAN}DOMAIN $NC"
echo -e " ${BICyan}[${BIWhite}09${BICyan}]${RED} • ${NC}${CYAN}AUTOREBOOT $NC  ${BICyan}[${BIWhite}20${BICyan}]${RED} • ${NC}${CYAN}NS DOMAIN $NC"
echo -e " ${BICyan}[${BIWhite}10${BICyan}]${RED} •${NC} ${CYAN}INFO PORT         $NC  ${BICyan}[${BIWhite}21${BICyan}]${RED} • ${NC}${CYAN}CERT SSL  $NC"
echo -e " ${BICyan}[ ${BIWhite}11${BICyan}]${RED} •${NC} ${CYAN}SPEEDTEST $NC  ${BICyan}[${BIWhite}22${BICyan}]${RED} • ${NC}${CYAN}BOT NOTIF $NC"  
echo -e " ${RED}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo " "
read -p " Select Menu : " opt
echo -e ""
case $opt in
01 | 1) clear ; menu-ssh ;;
02 | 2) clear ; menu-vmess ;;
03 | 3) clear ; menu-vless ;;
04 | 4) clear ; menu-trojan ;;
05 | 5) clear ; shadowsocks ;;
06 | 6) clear ; menu-trial ;;
07 | 7) clear ; up ;;
08 | 8) clear ; delete ;;
09 | 9) clear ; auto-reboot ;;
10) clear ; about ;;
11) clear ; speedtest ;;
12) clear ; running ;;
13) clear ; gotop ;;
14) clear ; sd ;;
15) clear ; menu-bckp ;;
16) clear ; reboot ;;
17) clear ; restart ;;
18) clear ; add-host ;;
19) clear ; nsmenu ;;
20) clear ; fixcert ;;
21) clear ; clearcache ;;
22) clear ; bot ;;
23) clear ; mbot ;;
24) clear ; add-bot-panel ;;
25) clear ; nano /etc/issue.net ;;
0) clear ; menu ;;
00) exit ;;
*) echo -e "" ; echo "Lu salah tekan bro" ; sleep 1 ; menu ;;
esac
