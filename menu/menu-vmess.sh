#!/bin/bash
  # // Exporint IP AddressInformation
export IP=$( wget -qO- ipinfo.io/org )

# // Clear Data
clear
clear && clear && clear
clear;clear;clear

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│$NC\033[42m          MENU MANAGER VMESS              $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "\033[1;93m│  ${grenbo}1.${NC} \033[0;36mCreating a Vmess Account${NC}"
echo -e "\033[1;93m│  ${grenbo}2.${NC} \033[0;36mTriall a Vmess Account${NC}"
echo -e "\033[1;93m│  ${grenbo}3.${NC} \033[0;36mDelete Vmess Account${NC}"
echo -e "\033[1;93m│  ${grenbo}4.${NC} \033[0;36mRenew Vmess Account${NC}"
echo -e "\033[1;93m│  ${grenbo}5.${NC} \033[0;36mCheck Vmess login Account${NC}"
echo -e "\033[1;93m│  ${grenbo}6.${NC} \033[0;36mCheck Vmess Usage Account${NC}"
echo -e "\033[1;93m│"
echo -e "\033[1;93m│  ${grenbo}0.${NC} \033[0;36mBack To Menu${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p "Select From Options [ 1 - 6 or 0 ] : " menu
case $menu in
1)
    add-ws
    ;;
2)
    triall-ws
    ;;
    
3)   del-ws
    ;;
    
4)    renew-ws
    ;;

5)   
    cek-ws
    ;;

6)  usage-akun-xray
    ;;
   
0)
    menu
    ;;
    
*)
    menu
    ;;
esac
