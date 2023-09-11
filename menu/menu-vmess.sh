#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	bhoikfostyahya
# //	Dscription: Xray Menu Management
# //	email: admin@bhoikfostyahya.com
# //  telegram: https://t.me/bhoikfost_yahya
# //====================================================
# // font color configuration | BHOIKFOST YAHYA AUTOSCRIPT
clear
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m          MENU MANAGER VMESS              $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${grenbo}1.${NC} \033[0;36mCreating a Vmess Account${NC}"
echo -e "\033[1;93m│  ${grenbo}2.${NC} \033[0;36mDelete Vmess Account${NC}"
echo -e "\033[1;93m│  ${grenbo}3.${NC} \033[0;36mRenew Vmess Account${NC}"
echo -e "\033[1;93m│  ${grenbo}4.${NC} \033[0;36mCheck Vmess login Account${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p "Select From Options [ 1 - 4 ] : " menu
case $opt in
1) clear ; add-ws ; exit ;;
2) clear ; trialvmess ; exit ;;
3) clear ; renew-ws ; exit ;;
4) clear ; del-ws ; exit ;;
5) clear ; cek-ws ; exit ;;
6) clear ; usage-akun-xray-vmess ; exit ;;
6) clear ; show-vmess ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; menu-ssh ;;
esac
