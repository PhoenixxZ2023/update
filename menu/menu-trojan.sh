#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e '\''s/< Date: //'\'')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m" 
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "             XRAY / TROJAN            "
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "  ${ORANGE}[1]. ${NC}\033[0;36mBuat Akun Trojan    "
echo -e "  ${ORANGE}[2]. ${NC}\033[0;36mTrial Akun Trojan     "
echo -e "  ${ORANGE}[3]. ${NC}\033[0;36mPerpanjang Akun Trojan Active Life      "
echo -e "  ${ORANGE}[4]. ${NC}\033[0;36mHapus Account Trojan     "
echo -e "  ${ORANGE}[5]. ${NC}\033[0;36mPeriksa User Login Trojan     "
echo -e "  ${ORANGE}[6]. ${NC}\033[0;36mUsage Trojan Akun  "
echo -e "  ${ORANGE}[7]. ${NC}\033[0;36mCek Detail Akun Trojan "
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "     \033[0;36mPress x or [ Ctrl+C ] • To-${BIWhite}Exit${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-tr ;;
2) clear ; trialtrojan ;;
3) clear ; renew-tr ;;
4) clear ; del-tr ;;
5) clear ; cek-tr ;;
6) clear ; usage-akun-xray-trojan ;;
7) clear ; show-trojan ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Lu salah tekan asu" ; sleep 2 ; menu ;;
esac'