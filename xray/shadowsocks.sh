#!/bin/bash
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/kytrx/regip/main/ip"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/YSSHstore"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6281215360549"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
clear
grenbo="\e[92;1m"
NC='\033[0m'
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "       ${BIWhite}${UWhite}SHADOWSOCKS MENU ${NC}"
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "     ${ORANGE}[1].${NC}" ${BIYellow}Buat Account Shadowsocks${NC}"
echo -e "     ${ORANGE}[2].${NC}" ${BIYellow}Trial Account Shadowsocks${NC}"
echo -e "     ${ORANGE}[3].${NC}" ${BIYellow}Perpanjang Account Shadowsocks${NC}"
echo -e "     ${ORANGE}[4].${NC}" ${BIYellow}Hapus Account Shadowsocks${NC}"
echo -e "     ${ORANGE}[5].${NC}" ${BIYellow}Periksa User Login Shadowsocks${NC}"
echo -e "     ${ORANGE}[6].${NC}" ${BIYellow}Usage Shadowsocks Account${NC}"
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo -e ""
read -p "Select From Options [ 1 - 6  ] : " menu
case $menu in
1)
    add-ss
    ;;
2) 
    triall-ss
    ;;

3)
    del-ss
    ;;
4)
    renew-ss
    ;;
5)
    cek-ss
    ;;
6)
    usage-akun-xray-ss
    ;;
0)
    menu
    ;;
*)
    menu
    ;;
esac
