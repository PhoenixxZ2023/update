#!/bin/bash
# COLOR VALIDATION
clear
RED='\033[0;31m'
NC='\033[36m'
gray="\e[1;30m"
Blue="\033[36m"
GREEN='\033[0;32m'
grenbo="\e[92;1m"
YELL='\033[0;33m'
BGX="\033[42m"
UPDATE="https://raw.githubusercontent.com/rizkihdyt6/scupdate/rizki/"
BOT="https://raw.githubusercontent.com/rizkihdyt6/scupdate/rizki/"
ISP=$(cat /etc/xray/isp)
NS=$(cat /etc/xray/dns)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
Exp="LIFETIME"
Name="RizkiHdyt | Muslihudin"
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
if [ ! -e /etc/vmess ]; then
    mkdir -p /etc/vmess
    touch /etc/vmess/.vmess.db
fi
vms=$(cat /etc/vmess/.vmess.db)
if [[ $vms = "" ]]; then
    vm="0"
else
    vm=$(cat /etc/vmess/.vmess.db | grep "###" | wc -l)
fi

if [ ! -e /etc/vless ]; then
    mkdir -p /etc/vless
    touch /etc/vless/.vless.db
fi
vms=$(cat /etc/vless/.vless.db)
if [[ $vms = "" ]]; then
    vl="0"
else
    vl=$(cat /etc/vless/.vless.db | grep "###" | wc -l)
fi

if [ ! -e /etc/trojan ]; then
    mkdir -p /etc/trojan
    touch /etc/trojan/.trojan.db
fi
vms=$(cat /etc/trojan/.trojan.db)
if [[ $vms = "" ]]; then
    tr="0"
else
    tr=$(cat /etc/trojan/.trojan.db | grep "###" | wc -l)
fi
if [ ! -e /etc/shadowsocks ]; then
    mkdir -p /etc/shadowsocks
    touch /etc/shadowsocks/.shadowsocks.db
fi
vms=$(cat /etc/shadowsocks/.shadowsocks.db)
if [[ $vms = "" ]]; then
    ss="0"
else
    ss=$(cat /etc/shadowsocks/.shadowsocks.db | grep "###" | wc -l)
fi
if [ ! -e /etc/ssh ]; then
    mkdir -p /etc/ssh
    touch /etc/ssh/.ssh.db
fi
vms=$(cat /etc/ssh/.ssh.db)
if [[ $vms = "" ]]; then
    ssh="0"
else
    ssh=$(cat /etc/ssh/.ssh.db | grep "###" | wc -l)
fi
clear
echo -e "\033[36m┌──────────────────────────────────────────┐\033[36m"
echo -e "\033[36m│           ∆ NEWBIE PROJECT VPN  ∆        │\033[36m"
echo -e "\033[36m└──────────────────────────────────────────┘\033[36m"
echo -e "\033[36m┌── RAM ──┐      ┌── CPU ──┐      ┌─MEMORY─┐\033[36m"
echo -e "\033[0;32m   $USAGERAM MB            $LOADCPU%             $MEMOFREE% "
echo -e "\033[36m└─────────┘      └─────────┘      └────────┘\033[36m"
echo -e "\033[36m┌──────────────── \e[92;1mINFORMATION\033[36m ──────────────┐\033[36m"
echo -e "\033[36m ${Blue}System OS${NC}     : \033[36m$MODEL${NC}"
echo -e "\033[36m ${Blue}Server RAM${NC}    : \033[36m$RAM MB $NC"
echo -e "\033[36m ${Blue}Uptime Server${NC} : \033[36m$SERONLINE${NC}"
echo -e "\033[36m ${Blue}Core System${NC}   : \033[36m$CORE${NC}"
echo -e "\033[36m ${Blue}Date${NC}          : \033[36m$DATEVPS${NC}"
echo -e "\033[36m ${Blue}Time${NC}          : \033[36m$TIMEZONE${NC}"
echo -e "\033[36m ${Blue}Domain${NC}        : \033[36m$domain${NC}"
echo -e "\033[36m ${Blue}NS Domain${NC}     : \033[36m$NS${NC}"
echo -e "\033[36m└──────────────────────────────────────────┘\033[36m"

echo -e "\033[36m   ┌─────────── \e[92;1mACTIVE ACCOUNT\033[36m ──────────┐\033[0m"
echo -e "\033[36m       \033[0m ${Blue}SSH         :$NC${grenbo} $ssh ACCOUNT"
echo -e "\033[36m       \033[0m ${Blue}VMESS       :$NC${grenbo} $vm ACCOUNT"
echo -e "\033[36m       \033[0m ${Blue}VLESS       :$NC${grenbo} $vl ACCOUNT"
echo -e "\033[36m       \033[0m ${Blue}TROJAN      :$NC${grenbo} $tr ACCOUNT"
echo -e "\033[36m       \033[0m ${Blue}SHADOWSOCKS :$NC${grenbo} $ss ACCOUNT"
echo -e "\033[36m   └─────────────────────────────────────┘\033[0m"
echo -e "\033[36m┌────────────── \e[92;1mCREATE ACCOUNT\033[36m ────────────┐\033[0m"
echo -e "\033[36m   ${grenbo}1.${NC} \033[0;36mSSH&OVPN ${NC}"
echo -e "\033[36m   ${grenbo}2.${NC} \033[0;36mVMESS${NC}"
echo -e "\033[36m   ${grenbo}3.${NC} \033[0;36mVLESS${NC}"
echo -e "\033[36m   ${grenbo}4.${NC} \033[0;36mTROJAN${NC}"
echo -e "\033[36m   ${grenbo}5.${NC} \033[0;36mSS${NC}"
echo -e "\033[36m└──────────────────────────────────────────┘\033[0m"
echo -e ""
echo -e "\033[36m┌────────────────── \e[92;1mOTHER\033[36m ──────────────────┐\033[0m"
echo -e "\033[36m   ${grenbo}6. ${NC} \033[0;36mRUNNING SYSTEM${NC}"
echo -e "\033[36m   ${grenbo}7. ${NC} \033[0;36mBACKUP & RESTORE${NC}"
echo -e "\033[36m   ${grenbo}8. ${NC} \033[0;36mPORT VPS INFO${NC}"
echo -e "\033[36m   ${grenbo}9. ${NC} \033[0;36mLOAD VPS INFO${NC}"
echo -e "\033[36m   ${grenbo}10.${NC} \033[0;36mSPEEDTEST${NC}"
echo -e "\033[36m   ${grenbo}11.${NC} \033[0;36mCHANGE DOMAIN${NC}"
echo -e "\033[36m   ${grenbo}12.${NC} \033[0;36mCHANGE BANNER${NC}"
echo -e "\033[36m   ${grenbo}13.${NC} \033[0;36mRESTART SERVICE${NC}"
echo -e "\033[36m   ${grenbo}14.${NC} \033[0;36mRESTART SERVER${NC}"
echo -e "\033[36m   ${grenbo}15.${NC} \033[0;36mAUTO KILL${NC}"
echo -e "\033[36m   ${grenbo}16.${NC} \033[0;36mAUTO REBOOT${NC}"
echo -e "\033[36m   ${grenbo}17.${NC} \033[0;36mUPDATE SCRIPT${NC}"
echo -e ""
echo -e "\033[36m└──────────────────────────────────────────┘\033[0m"
echo -e ""
echo -e "\033[36m┌────────────── \e[92;1mNEWBIE TUNNEL\033[36m ─────────────┐\033[0m"
echo -e "\033[36m   ${Blue}IP VPS${NC}        : \033[0;32m$IPVPS${NC}"
echo -e "\033[36m   ${Blue}Exp Script${NC}    : \033[0;32m$Exp${NC}"
echo -e "\033[36m   ${Blue}Name Author${NC}   : \033[0;32m$Name${NC}"
echo -e "\033[36m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p "Select From Options [ 1 - 18 ] : " menu
case $menu in
1)
    ssh
    ;;
2)
    vmess
    ;;
3)
    vless
    ;;
4)
    trojan
    ;;
5)
    shadowsocks
    ;;
6)
    run
    ;;
7)
    menu-backup
    ;;
8)
    portin
    ;;
9)
    gotop
    ;;
10)
    clear
    speedtest
    ;;
11)
    get-domain
    ;;
12)
    nano /etc/banner
    ;;
13)
    seres
    ;;
14)
    reboot
    ;;

15)
    autokill
    ;;
16)
    auto-reboot
    ;;
17)
    wget ${UPDATE}update.sh && chmod +x update.sh && ./update.sh
    ;;
*)
    menu
    ;;
esac
