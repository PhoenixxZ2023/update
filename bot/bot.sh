#!/bin/bash
ORANGE='\033[0;33m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear 
echo -e "\033[1;93m┌─────────────────────────────┐\033[0m"
echo -e "        BOT NOTIF           "
echo -e "\033[1;93m└─────────────────────────────┘\033[0m"
echo -e "" 
echo -e "${ORANGE}[1].${NC}\033[0;36m Add Bot Notifikasi "
echo -e "${ORANGE}[2].${NC}\033[0;36m Delete Bot Notifikasi"
echo -e ""
echo -e "\033[1;93m└─────────────────────────────┘\033[0m"
echo -e "${ORANGE}  Press x or [ Ctrl+C ] • To-Exit${NC}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-bot-notif ;;
2) clear ; del-bot-notif ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Anda salah tekan" ; sleep 1 ; menu-domain ;;
esac
