#!/bin/bash 
# COLOR VALIDATION
clear
 BIRed='\033[1;91m'        # Red 
 BIGreen='\033[1;92m'      # Green 
 BIYellow='\033[1;93m'     # Yellow 
 BIBlue='\033[1;94m'       # Blue 
 BIPurple='\033[1;95m'     # Purple 
 BICyan='\033[1;96m'       # Cyan 
 BIWhite='\033[1;97m'      # White 
 UWhite='\033[4;37m'       # White 
 On_IPurple='\033[0;105m'  # 
 On_IRed='\033[0;101m' 
 IBlack='\033[0;90m'       # Black 
 IRed='\033[0;91m'         # Red 
 IGreen='\033[0;92m'       # Green 
 IYellow='\033[0;93m'      # Yellow 
 IBlue='\033[0;94m'        # Blue 
 IPurple='\033[0;95m'      # Purple 
 ICyan='\033[0;96m'        # Cyan 
 IWhite='\033[0;97m'       # White 
 NC='\e[0m' 
  
 # // Export Color & Information 
 export RED='\033[0;31m' 
 export GREEN='\033[0;32m' 
 export YELLOW='\033[0;33m' 
 export BLUE='\033[0;34m' 
 export PURPLE='\033[0;35m' 
 export CYAN='\033[0;36m' 
 export LIGHT='\033[0;37m' 
 export NC='\033[0m' 
  
 # // Export Banner Status Information 
 export EROR="[${RED} EROR ${NC}]" 
 export INFO="[${YELLOW} INFO ${NC}]" 
 export OKEY="[${GREEN} OKEY ${NC}]" 
 export PENDING="[${YELLOW} PENDING ${NC}]" 
 export SEND="[${YELLOW} SEND ${NC}]" 
 export RECEIVE="[${YELLOW} RECEIVE ${NC}]" 
  
 # // Export Align 
 export BOLD="\e[1m" 
 export WARNING="${RED}\e[5m" 
 export UNDERLINE="\e[4m" 
 
 # ========================================= 
 vlx=$(grep -c -E "^#vl# " "/etc/xray/config.json") 
 let vla=$vlx/2 
 vmc=$(grep -c -E "^#vm# " "/etc/xray/config.json") 
 let vma=$vmc/2 
 ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)" 
  
 trx=$(grep -c -E "^#tr# " "/etc/xray/config.json") 
 let tra=$trx/2 
 ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json") 
 let ssa=$ssx/2 
 COLOR1='\033[0;35m' 
 COLOR2='\033[0;39m' 
 clear

BURIQ () {
    curl -sS https://raw.githubusercontent.com/zheevpn/izin/main/zye > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/zheevpn/izin/main/zye | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/zheevpn/izin/main/zye | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/zheevpn/izin/main/zye | grep $MYIP | awk '{print $3}')
fi

MYIP=$(wget -qO- ipinfo.io/ip)
domain=$(cat /etc/xray/domain)
uptime="$(uptime -p | cut -d " " -f 2-10)"
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
#SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear

# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


###########- END COLOR CODE -##########
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 ) 
CITY=$(curl -s ipinfo.io/city )

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# TOTAL RAM
#total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
#totalram=$(($total_ram/1024))
USAGERAM=$(free -m | awk 'NR==2 {print $3}')

# Status ExpiRED Active | YogzVPN
Info="(${c2}Active${NC})"
Error="(${red}Expired${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/zheevpn/izin/main/zye | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear

persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
#persencpu=
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"

###########
KANAN="\033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m$NC"
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
########

#################
r="\033[1;31m"  #REDTERANG
a=" ${BIWhite}ACCOUNT PREMIUM" 
################

# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [[ "$ssh" == "active" ]]; then 
resssh="${green}ONLINE${NC}"
else
status_ssh="${red}OFFLINE${NC} "
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ONLINE${NC}"
else
resst="${red}OFFLINE${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ONLINE${NC}"
else
ressshws="${red}OFFLINE${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ONLINE${NC}"
else
resngx="${red}OFFLINE${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ONLINE${NC}"
else
resdbr="${red}OFFLINE${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ONLINE${NC}"
else
resv2r="${red}OFFLINE${NC}"
fi
function addhost(){
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
setting-menu
else
echo "IP=$host" > /var/lib/scrz-prem/ipvps.conf
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Dont forget to renew cert"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
}
function genssl(){
clear
systemctl stop nginx
domain=$(cat /var/lib/scrz-prem/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek " 
sleep 2
echo $domain > /etc/xray/domain
systemctl restart xray
systemctl restart nginx
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
#export sem=$( curl -s https://raw.githubusercontent.com/kytrx/regip/main/versions)
#export pak=$( cat /home/.ver)
#IPVPS=$(curl -s ipinfo.io/ip )

if [ ! -e /etc/vmess ]; then
    mkdir -p /etc/vmess
    touch /etc/vmess/.vmess.db
fi
vms=$(cat /etc/vmess/.vmess.db)
if [[ $vms = "" ]]; then
    vm="0"
else
    vm=$(cat /etc/vmess/.vmess.db | grep "#vm#" | wc -l)
fi

if [ ! -e /etc/vless ]; then
    mkdir -p /etc/vless
    touch /etc/vless/.vless.db
fi
vms=$(cat /etc/vless/.vless.db)
if [[ $vms = "" ]]; then
    vl="0"
else
    vl=$(cat /etc/vless/.vless.db | grep "#vl#" | wc -l)
fi
echo ""
if [ ! -e /etc/trojan ]; then
    mkdir -p /etc/trojan
    touch /etc/trojan/.trojan.db
fi
vms=$(cat /etc/trojan/.trojan.db)
if [[ $vms = "" ]]; then
    tr="0"
else
    tr=$(cat /etc/trojan/.trojan.db | grep "#tr#" | wc -l)
fi
if [ ! -e /etc/shadowsocks ]; then
    mkdir -p /etc/shadowsocks
    touch /etc/shadowsocks/.shadowsocks.db
fi
vms=$(cat /etc/shadowsocks/.shadowsocks.db)
if [[ $vms = "" ]]; then
    ss="0"
else
    ss=$(cat /etc/shadowsocks/.shadowsocks.db | grep "#ss#" | wc -l)
fi
if [ ! -e /etc/ssh ]; then
    mkdir -p /etc/ssh
    touch /etc/ssh/.ssh.db
fi
vms=$(cat /etc/ssh/.ssh.db)
if [[ $vms = "" ]]; then
    ssh="0"
else
    ssh=$(cat /etc/ssh/.ssh.db | grep "#ssh1#" | wc -l)
fi
clear
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[39;1;92m                   ⇱ SERVER INFORMATION ⇲                      \E[0m"
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"                                                                         
echo -e "${BICyan} ⇲  ${BICyan}DOMAIN          :  ${BIYellow}$(cat /etc/xray/domain)${NC}" 
echo -e "${BICyan} ⇲  ${BICyan}NS DOMAIN       :  ${BIYellow}$(cat /etc/xray/dns)${NC}" 
echo -e "${BICyan} ⇲  ${BICyan}IP VPS          :  ${BIYellow}$MYIP${NC}"
echo -e "${BICyan} ⇲  ${BICyan}ISP             :  ${BIYellow}$ISP${NC}"  
echo -e "${BICyan} ⇲  ${BICyan}CITY            :  ${BIYellow}$CITY${NC}"                                 
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${BIWhite}                      ⇱ STATUS SERVICE ⇲                        \E[0m"
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${BIWhite}      ───────────────────────────────────────────────${NC}"
echo -e "           ${BIWhite}SSH/OPENVPN${NC}    $BIWhite=$NC $ssh1${NC}" "$a"
echo -e "           ${BIWhite}VMESS/WS/GRPC${NC}  $BIWhite=$NC $vma$NC" "$a"
echo -e "           ${BIWhite}VLESS/WS/GRPC${NC}  $BIWhite=$NC $vla$NC" "$a"
echo -e "           ${BIWhite}TROJAN/WS/GRPC${NC} $BIWhite=$NC $tra${NC}" "$a"
echo -e "           ${BIWhite}SHADOW/WS/GRPC${NC} $BIWhite=$NC $ssa${NC} $a"
echo -e "${BIWhite}     ───────────────────────────────────────────────${NC}"
echo -e " ${z}╭════════════════════════════════════════════════════════════╮${NC}"
echo -e " ${z}│ ${NC}${z} SSH$NC : $resssh" "        ${z} NGINX$NC : $resngx" "        ${z} XRAY$NC : $resv2r      $NC${z}$NC" 
echo -e " ${z}│ ${NC}${z} STUNNEL$NC : $ressshws" "    ${z} DROPBEAR$NC : $resdbr" "     ${z} HAPROXY$NC : $resst   $NC${z}$NC"
echo -e " ${z}╰════════════════════════════════════════════════════════════╯${NC}"
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "${BIWhite}                       ⇱ MENU SERVICE ⇲                         \E[0m"
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " ${BICyan}[${BIWhite}01${BICyan}]${y} •${NC} ${BIWhite}SSHWS MENU         $NC  ${BICyan}[${BIWhite}12${BICyan}]${RED} • ${NC}${BIWhite}RUNNING $NC"
echo -e " ${BICyan}[${BIWhite}02${BICyan}]${y} •${NC} ${BIWhite}VMESS MENU         $NC  ${BICyan}[${BIWhite}13${BICyan}]${RED} • ${NC}${BIWhite}VPS INFO $NC"
echo -e " ${BICyan}[${BIWhite}03${BICyan}]${y} •${NC} ${BIWhite}VLESS MENU         $NC  ${BICyan}[${BIWhite}14${BICyan}]${RED} • ${NC}${BIWhite}CREATE SLOW$NC"
echo -e " ${BICyan}[${BIWhite}04${BICyan}]${y} •${NC} ${BIWhite}SS-RR MENU         $NC  ${BICyan}[${BIWhite}15${BICyan}]${RED} • ${NC}${BIWhite}BOT BACKUP  $NC"
echo -e " ${BICyan}[${BIWhite}05${BICyan}]${y} •${NC} ${BIWhite}SSOCK MENU         $NC  ${BICyan}[${BIWhite}16${BICyan}]${RED} • ${NC}${BIWhite}REBOOT $NC"
echo -e " ${BICyan}[${BIWhite}06${BICyan}]${y} •${NC} ${BIWhite}TRIAL MENU         $NC  ${BICyan}[${BIWhite}17${BICyan}]${RED} • ${NC}${BIWhite}RESTART $NC"
echo -e " ${BICyan}[${BIWhite}07${BICyan}]${y} •${NC} ${BIWhite}AUTO REBOOT        $NC  ${BICyan}[${BIWhite}18${BICyan}]${RED} • ${NC}${BIWhite}DOMAIN $NC"
echo -e " ${BICyan}[${BIWhite}08${BICyan}]${y} •${NC} ${BIWhite}DELETE ACCOUNT     $NC  ${BICyan}[${BIWhite}19${BICyan}]${RED} • ${NC}${BIWhite}NS DOMAIN  $NC"
echo -e " ${BICyan}[${BIWhite}09${BICyan}]${y} •${NC} ${BIWhite}ABOUT SCRIPT       $NC  ${BICyan}[${BIWhite}20${BICyan}]${RED} • ${NC}${BIWhite}CERT SSL   $NC"
echo -e " ${BICyan}[${BIWhite}10${BICyan}]${y} •${NC} ${BIWhite}UPDATE SCRIPT      $NC  ${BICyan}[${BIWhite}21${BICyan}]${RED} • ${NC}${BIWhite}CLEAR CACHE  $NC"
echo -e " ${BICyan}[${BIWhite}11${BICyan}]${y} •${NC} ${BIWhite}SPEEDTEST          $NC  ${BICyan}[${BIWhite}22${BICyan}]${RED} • ${NC}${BIWhite}BOT NOTIF $NC"  
echo -e " ${RED}"
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo " "
read -p " Select Menu : " opt
echo -e ""
case $opt in
01 | 1) clear ; menu-ssh ;;
02 | 2) clear ; menu-vmess ;;
03 | 3) clear ; menu-vless ;;
04 | 4) clear ; menu-trojan ;;
05 | 5) clear ; shadowsocks ;;
06 | 6) clear ; delete ;;
07 | 7) clear ; auto-reboot ;;
08 | 8) clear ; menu-set ;;
09 | 9) clear ; up ;;
10) clear ; about ;;
11) clear ; speedtest ;;
12) clear ; running ;;
13) clear ; gotop ;;
14) clear ; sd ;;
15) clear ; mbot ;;
16) clear ; reboot ;;
17) clear ; restart ;;
18) clear ; add-host ;;
19) clear ; nsmenu ;;
20) clear ; fixcert ;;
21) clear ; clearcache ;;
22) clear ; bot ;;
0) clear ; menu ;;
00) exit ;;
*) echo -e "" ; echo "Lu salah tekan bro" ; sleep 1 ; menu ;;
esac
