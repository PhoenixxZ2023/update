#!/bin/bash
ORANGE='\033[0;33m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear 
echo -e "\033[1;93m┌─────────────────────────────┐\033[0m"
echo -e "        MENU DOMAIN           "
echo -e "\033[1;93m└─────────────────────────────┘\033[0m"
echo -e "" 
echo -e "${ORANGE}[1].${NC}\033[0;36m Change DOMAIN VPS"
echo -e "${ORANGE}[2].${NC}\033[0;36m Renew Certificate DOMAIN"
echo -e ""
echo -e "\033[1;93m└─────────────────────────────┘\033[0m"
echo -e "${ORANGE}  Press x or [ Ctrl+C ] • To-Exit${NC}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-host ;;
2) clear ; certv2ray ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Anda salah tekan" ; sleep 1 ; menu-domain ;;
esac
