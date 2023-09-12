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
BICyan='\033[1;96m'    
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "${BICyan}┌─────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan}│                    VMESS MENU                   │$NC"
echo -e "${BICyan}└─────────────────────────────────────────────────┘${NC}"
echo -e "${BICyan}┌─────────────────────────────────────────────────┐${NC}"
echo -e "     ${BICyan}[${COLOR1}1${BICyan}] Create Vmess Account     "
echo -e "     ${BICyan}[${COLOR1}2${BICyan}] Trial Vmess Account     "
echo -e "     ${BICyan}[${COLOR1}3${BICyan}] Delete Account Vmess     "
echo -e "     ${BICyan}[${COLOR1}4${BICyan}] Renew Account Vmess     "
echo -e "     ${BICyan}[${COLOR1}5${BICyan}] Cek User XRAY     "
echo -e "     ${BICyan}[${COLOR1}6${BICyan}] Detail Vmess Account     "
echo -e ""
echo -e "     ${BICyan}[${COLOR1}0${BICyan}] Back To Menu     "
echo -e "${BICyan}└──────────────────────────────────────────────────┘${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-ws ;;
2) clear ; trialvmess ;;
3) clear ; delws ;;
4) clear ; renewws;;
5) clear ; cekws ;;
6) clear ; detailvmess ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back on menu" ; sleep 1 ; menu ;;
esac
