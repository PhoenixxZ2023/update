#!/bin/bash
clear
RED='\033[0;31m'
NC='\e[0m'
gray="\e[1;30m"
Blue="\033[1;36m"
GREEN='\033[0;32m'
grenbo="\033[1;36m"
YELL='\033[1;93m'
BGX="\033[42m"
UPDATE="https://raw.githubusercontent.com/JurigVPN/scupdate/jurig/"
BOT="https://raw.githubusercontent.com/JurigVPN/scupdate/jurig/"
clear
echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "                    \e[1;97m    SETTING \e[0m"
echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\033[96m┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${grenbo}[1] ${NC} ${YELL}Running System${NC}"
echo -e "  ${grenbo}[2] ${NC} ${YELL}Menu Backup ${NC}"
echo -e "  ${grenbo}[3] ${NC} ${YELL}Info Port Service${NC}"
echo -e "  ${grenbo}[4] ${NC} ${YELL}Info Load Vps ${NC}"
echo -e "  ${grenbo}[5] ${NC} ${YELL}Speedtest ${NC}"
echo -e "  ${grenbo}[6] ${NC} ${YELL}Change Domain${NC}"
echo -e "  ${grenbo}[7] ${NC} ${YELL}Change Banner ${NC}"
echo -e "  ${grenbo}[8] ${NC} ${YELL}Restart Service ${NC}"
echo -e "  ${grenbo}[9] ${NC} ${YELL}Reboot Server${NC}"
echo -e "  ${grenbo}[10] ${NC}${YELL}Auto Kill User ${NC}"
echo -e "  ${grenbo}[11] ${NC}${YELL}Auto Reboot Server ${NC}"
echo -e "  ${grenbo}[12] ${NC}${YELL}Update Script${NC}"
echo -e "  ${grenbo}[13] ${NC}${YELL}Clear All Log ${NC}"
echo -e "  ${grenbo}[14] ${NC}${YELL}Delete All Akun Exp${NC}"
echo -e "  ${grenbo}[15] ${NC}${YELL}Menu Auto Clear Log ${NC}"
echo -e "\033[96m└─────────────────────────────────────────────────┘${NC}"
echo -e "  ${grenbo}[0] ${NC} ${YELL}Back To Menu${NC}"
echo -e ""
read -p "  Select From Options [ 1 - 16 or 0 back to menu ] : " menu
case $menu in
1)
    run
    ;;
2)
    get-backres
    ;;
3)
    portin
    ;;
    
4)   
    gotop
    ;;
    
5)    
    speedtest
    ;;

6)   
    get-domain
    ;;

7) 
    nano /etc/issue.net
    ;;

8)
   seres
   ;;

9)
   reboot
   ;;

10)
   autokill
   ;;

11)
   auto-reboot
   ;;
 
12)
   wget ${UPDATE}update.sh && chmod +x update.sh && ./update.sh
    ;;

13)
   clearlog
   ;;

14)
   xp
   ;;
   
15)
   auto-clearlog
   ;;
0)
   menu
   ;;
*)
    menu
    ;;
esac
