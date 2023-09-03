#!/bin/bash
ORANGE='\033[0;33m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear 
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "       ${BIWhite}${UWhite}BOT NOTIF ${NC}"
echo -e ""
echo -e "     ${BICyan}[${BIWhite}01${BICyan}] Add Bot Notifikasi      "
echo -e "     ${BICyan}[${BIWhite}02${BICyan}] Delete Bot Notifikasi   "
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo -e "     ${BIYellow}Press x or [ Ctrl+C ] • To-${BIWhite}Exit${NC}"
echo ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; add-bot-notif ;;
2) clear ; del-bot-notif ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Anda salah tekan" ; sleep 1 ; menu-domain ;;
esac
