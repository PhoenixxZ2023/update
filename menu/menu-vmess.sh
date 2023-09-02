#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e '\''s/< Date: //'\'')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############ear
clear
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "             XRAY / VMESS            "
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "  ${ORANGE}[1]. ${NC}\033[0;36mBuat Akun XRAY Vmess Websocket "
echo -e "  ${ORANGE}[2]. ${NC}\033[0;36mTrial Akun XRAY Vmess     "
echo -e "  ${ORANGE}[3]. ${NC}\033[0;36mPerpanjang Akun XRAY Vmess Active "
echo -e "  ${ORANGE}[4]. ${NC}\033[0;36mHapus Akun XRAY Vmess Websocket  "
echo -e "  ${ORANGE}[5]. ${NC}\033[0;36mPeriksa User Login XRAY Vmess     "
echo -e "  ${ORANGE}[6]. ${NC}\033[0;36mUsage Vmess Account     "
echo -e "  ${ORANGE}[7]. ${NC}\033[0;36mCek Detail Akun Vmess   "
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "     \033[0;36mPress x or [ Ctrl+C ] • To-${BIWhite}Exit${NC}"
echo ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; add-ws ; exit ;;
2) clear ; trialvmess ; exit ;;
3) clear ; renew-ws ; exit ;;
4) clear ; del-ws ; exit ;;
5) clear ; cek-ws ; exit ;;
6) clear ; usage-akun-xray-vmess ; exit ;;
7) clear ; show-vmess ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; menu ;;
esac'