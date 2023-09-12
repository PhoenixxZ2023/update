#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	bhoikfostyahya
# //	Dscription: Xray Menu Management
# //	email: admin@bhoikfostyahya.com
# //  telegram: https://t.me/bhoikfost_yahya
# //====================================================
# // font color configuration | BHOIKFOST YAHYA AUTOSCRIPT
echo -e "${BICyan}└─────────────────────────────────────────────────┘${NC}"
echo -e "${BICyan}┌───────────────────────────────────────────────┐${NC}"
echo -e "     ${BICyan}[1]${NC} Create SSH Account     "
echo -e "     ${BICyan}[2]${NC} Trial SSH Acoount      "
echo -e "     ${BICyan}[3]${NC} Delete SSH Acoount      "
echo -e "     ${BICyan}[4]${NC} Renew SSH Account      "
echo -e "     ${BICyan}[5]${NC} Cek User SSH     "
echo -e "     ${BICyan}[6]${NC} Mullog SSH     "
echo -e "     ${BICyan}[7]${NC} Auto Del user Exp     "
echo -e "     ${BICyan}[8]${NC} Auto Kill user SSH    "
echo -e "     ${BICyan}[9]${NC} Cek Member SSH"

echo -e "     ${BICyan}[0]${NC} Back To Menu      "
echo -e "${BICyan}└───────────────────────────────────────────────┘${NC}"
echo ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; usernew ;;
2) clear ; trialssh ;;
3) clear ; del ;;
4) clear ; renew;;
5) clear ; cek ;;
6) clear ; ceklim ;;
7) clear ; autodel ;;
8) clear ; autokill ;;
9) clear ; member ;;
0) clear ; menu ;;
*) echo -e "" ; echo "Press any key to back on menu" ; sleep 1 ; menu ;;
esac
