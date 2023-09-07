#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
### System Information
TANGGAL=$(date '+%Y-%m-%d')
TIMES="10"
NAMES=$(whoami)
IMP="wget -q -O"    
CHATID=""
LOCAL_DATE="/usr/bin/"
MYIP=$(wget -qO- ipinfo.io/ip)
ISP=$(wget -qO- ipinfo.io/org)
TIME=$(date +'%Y-%m-%d %H:%M:%S')
RAMMS=$(free -m | awk 'NR==2 {print $2}')
KEY=""
URL="https://api.telegram.org/bot$KEY/sendMessage"
OS=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
domain=$(cat /etc/xray/domain)
CITY=$(curl -s ipinfo.io/city )
REPO="https://raw.githubusercontent.com/zheevpn/update/main/"
#########################
BURIQ () {
    curl -sS https://raw.githubusercontent.com/ip/izin/main/ip > /root/tmp
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
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}
# https://raw.githubusercontent.com/wokszxd/izinvps/main/ip 
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/rizkyckj/ip/main/ip | grep $MYIP | awk '{print $2}')
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
    IZIN=$(curl -sS https://raw.githubusercontent.com/rizkyckj/ip/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
wget -O /etc/banner ${REPO1}config/banner >/dev/null 2>&1
    chmod +x /etc/banner
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt install socat netfilter-persistent -y
apt install vnstat lsof fail2ban -y
apt install curl sudo -y
apt install screen cron screenfetch -y
mkdir /backup >> /dev/null 2>&1
mkdir /user >> /dev/null 2>&1
mkdir /tmp >> /dev/null 2>&1
apt install resolvconf network-manager dnsutils bind9 -y
cat > /etc/systemd/resolved.conf << END
[Resolve]
DNS=1.1.1.1 1.0.0.1
Domains=~.
ReadEtcHosts=yes
END
systemctl enable resolvconf
systemctl enable systemd-resolved
systemctl enable NetworkManager
rm -rf /etc/resolv.conf
rm -rf /etc/resolvconf/resolv.conf.d/head
echo "
nameserver 1.1.1.1
nameserver 1.0.0.1
nameserver 127.0.0.53
" >> /etc/resolv.conf
echo "
" >> /etc/resolvconf/resolv.conf.d/head
systemctl restart resolvconf
systemctl restart systemd-resolved
systemctl restart NetworkManager
echo "Google DNS" > /user/current
rm /usr/local/etc/xray/city >> /dev/null 2>&1
rm /usr/local/etc/xray/org >> /dev/null 2>&1
rm /usr/local/etc/xray/timezone >> /dev/null 2>&1
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u www-data --version 1.6.1
rm -fr /usr/local/bin/xray
wget -O /usr/local/bin/xray "https://github.com/dharak36/Xray-core/releases/download/v1.0.0/xray.linux.64bit"
chmod +x /usr/local/bin/xray
curl -s ipinfo.io/city >> /usr/local/etc/xray/city
curl -s ipinfo.io/org | cut -d " " -f 2-10 >> /usr/local/etc/xray/org
curl -s ipinfo.io/timezone >> /usr/local/etc/xray/timezone
clear
sleep 1
cd
clear
localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
# buat folder
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/{xray,vmess,websocket,vless,trojan,shadowsocks,bot}
mkdir -p /root/.install.log
mkdir -p /var/log/xray/
mkdir -p /var/www/html/
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain
touch /etc/vmess/.vmess.db
touch /etc/vless/.vless.db
touch /etc/trojan/.trojan.db
touch /etc/ssh/.ssh.db
touch /etc/shadowsocks/.shadowsocks.db
touch /etc/bot/.bot.db

echo -e "[ ${tyblue}NOTES${NC} ] Before we go.. "
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] I need check your headers first.."
sleep 2
echo -e "[ ${green}INFO${NC} ] Checking headers"
sleep 1
totet=`uname -r`
REQUIRED_PKG="linux-headers-$totet"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  sleep 2
  echo -e "[ ${yell}WARNING${NC} ] Try to install ...."
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  apt-get --yes install $REQUIRED_PKG
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] If error you need.. to do this"
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 1. apt update -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 2. apt upgrade -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 3. apt dist-upgrade -y"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] 4. reboot"
  sleep 1
  echo ""
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] After Turuu"
  sleep 1
  echo -e "[ ${tyblue}NOTES${NC} ] Oyo bosqu , mantap"
  echo -e "[ ${tyblue}NOTES${NC} ] Lu klo enggak ngerti Klik enter gc"
fi

ttet=`uname -r`
ReqPKG="linux-headers-$ttet"
if ! dpkg -s $ReqPKG  >/dev/null 2>&1; then
  rm /root/setup.sh >/dev/null 2>&1 
  exit
else
  clear
fi


secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

coreselect=''
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
END
chmod 644 /root/.profile

echo -e "[ ${green}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
sleep 2
echo -ne "[ ${green}INFO${NC} ] Check permission : "

PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
green "Permission Accepted!"
else
red "Permission Denied!"
rm setup.sh > /dev/null 2>&1
sleep 10
exit 0
fi
sleep 3

mkdir -p /var/lib/SIJA >/dev/null 2>&1
echo "IP=" >> /var/lib/SIJA/ipvps.conf

#add domen
echo ""
wget -q https://raw.githubusercontent.com/rizkyckj/update/main/tools.sh;chmod +x tools.sh;./tools.sh
rm tools.sh
clear
    echo ""
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo -e "  Welcome To RVPN Project Script Installer ${YELLOW}(${NC}${green} Stable Edition ${NC}${YELLOW})${NC}"
echo -e "     This Will Quick Setup VPN Server On Your Server"
echo -e "         Auther : ${green}RVPN STORES${NC}${YELLOW}(${NC} ${green}Electro Project ${NC}${YELLOW})${NC}"
echo -e "       © Recode By Electro Project ${YELLOW}(${NC} 2023 ${YELLOW})${NC}"
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo "[1]. Use Domain From Script / Gunakan Domain Dari Script"
echo "[2]. Choose Your Own Domain / Pilih Domain Sendiri"
echo -e "${YELLOW}----------------------------------------------------------${NC}"
    read -rp "Silahkan Pilih 1 / 2 Untuk Menginstal : " dom 

    if test $dom -eq 1; then
    clear
    # // Setup CF
    echo -e "${green}DOWNLOADING CLOUDFLARE!${NC}"
    sleep 3
    wget -q https://raw.githubusercontent.com/rizkyckj/update/main/cf.sh && chmod +x cf.sh && ./cf.sh
    echo -e "${green}Done!${NC}"
    sleep 2
    clear
    elif test $dom -eq 2; then
    read -rp "Input Name Domain : " -e pp 
        echo "$pp" > /root/scdomain
	echo "$pp" > /etc/xray/scdomain
	echo "$pp" > /etc/xray/domain
	echo "$pp" > /etc/v2ray/domain
	echo $pp > /root/domain
        echo "IP=$pp" > /var/lib/SIJA/ipvps.conf
    fi
sleep 0.5
CHATID="5667901146"
KEY="6404993567:AAFSJpLEuKHmEmg4MfoD0qME9Dh4Ijz6Ock"
WKT="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<code>────────────────────</code>
<b>⚠️AUTOSCRIPT PREMIUM⚠️</b>
<code>────────────────────</code>
<code>Isp    : </code><code>$ISP</code>
<code>Domain : </code><code>$(cat /etc/xray/domain)</code>
<code>Date   : </code><code>$TIME</code>
<code>Ip Vps : </code><code>$MYIP</code>
<code>Ram    : </code><code>$RAMMS MB</code>
<code>Linux  : </code><code>$OS</code>
<code>────────────────────</code>
<i>Automatic Notification from</i>
<i>Github RVPN STORES</i> 
"'&reply_markup={"inline_keyboard":[[{"text":"ᴏʀᴅᴇʀ🐳","url":"https://t.me/RVPNSTORES"},{"text":"ɪɴꜱᴛᴀʟʟ🐬","url":"https://t.me/RVPNSTORES"}]]}'
    curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear 
#install ssh ovpn
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|         PROCESS INSTALLED SSH            |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/rizkyckj/update/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
#Instal Xray
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|          PROCESS INSTALLED XRAY          |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/rizkyckj/update/main/xray/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
wget https://raw.githubusercontent.com/rizkyckj/update/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear

#Instal slowdns
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|          PROCESS INSTALLED SLOWDNS       |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 2
clear
wget https://raw.githubusercontent.com/rizkyckj/update/main/wireguard/installsl.sh && chmod +x installsl.sh && ./installsl.sh
clear

### Pasang OpenVPN
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|          PROCESS INSTALLED OVPN          |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 0.5 
clear
wget https://raw.githubusercontent.com/rizkyckj/update/main/ssh/vpn.sh && chmod +x vpn.sh && ./vpn.sh
clear

#Install Ohp Service
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|          PROCESS INSTALLED OHP           |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 0.5
clear
wget https://raw.githubusercontent.com/rizkyckj/update/main/ohp/ohp-dropbear.sh && chmod +x ohp-dropbear.sh && ./ohp-dropbear.sh
wget https://raw.githubusercontent.com/rizkyckj/update/main/ohp/ohp-ssh.sh && chmod +x ohp-ssh.sh && ./ohp-ssh.sh
wget https://raw.githubusercontent.com/rizkyckj/update/main/ohp/ohp.sh && chmod +x ohp.sh && ./ohp.sh
clear
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|       PROCESS INSTALLED UDP CUSTOM       |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 3
sleep 1.5
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2" -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp
### Pasang Limit Xray
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|       PROCESS INSTALLED LIMIT XRAY       |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
sleep 3
sleep 1.5
wget https://raw.githubusercontent.com/rizkyckj/update/main/limit/limit.sh && chmod +x limit.sh && ./limit.sh
clear
#pasang swap
#Instal Xray
echo -e "${tyblue}.------------------------------------------.${NC}"
echo -e "${tyblue}|              SWAP RAM 1 GB               |${NC}"
echo -e "${tyblue}'------------------------------------------'${NC}"
    sleep 1.5
    # > Make a swap of 1GB
    dd if=/dev/zero of=/swapfile bs=1024 count=1048576
    mkswap /swapfile
    chown root:root /swapfile
    chmod 0600 /swapfile >/dev/null 2>&1
    swapon /swapfile >/dev/null 2>&1
    sed -i '$ i\/swapfile      swap swap   defaults    0 0' /etc/fstab
clear
cd /usr/sbin
wget https://raw.githubusercontent.com/Rerechan02/indo-ssh/main/funny.zip
unzip funny.zip
rm -fr funny.zip
clear
chmod +x /usr/sbin/*
cd
clear
clear
echo "0 1 * * * root delexp" >> /etc/crontab
echo "*/25 * * * * root clear-log" >> /etc/crontab
echo "*/15 * * * * root limit" >> /etc/crontab
echo "0 1 * * * root xp" >> /etc/crontab
clear
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
menu
END
chmod 644 /root/.profile

if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ifconfig.me > /etc/myipvps
#install gotop
gotop_latest="$(curl -s https://api.github.com/repos/xxxserxxx/gotop/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
    gotop_link="https://github.com/xxxserxxx/gotop/releases/download/v$gotop_latest/gotop_v"$gotop_latest"_linux_amd64.deb"
    curl -sL "$gotop_link" -o /tmp/gotop.deb
    dpkg -i /tmp/gotop.deb >/dev/null 2>&1
    
    USRSC=$(curl -sS https://raw.githubusercontent.com/rizkyckj/ip/main/ip | grep $MYIP | awk '{print $2}')
    EXPSC=$(curl -sS https://raw.githubusercontent.com/rizkyckj/ip/main/ip | grep $MYIP | awk '{print $3}')
    TIMEZONE=$(printf '%(%H:%M:%S)T')
    TEXT="

clear 
echo ""
echo "------------------------------------------------------------"
echo ""
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH		: 22"  | tee -a log-install.txt
echo "   - SSH Websocket	: 80 [ON]" | tee -a log-install.txt
echo "   - SSH SSL Websocket	: 443" | tee -a log-install.txt
echo "   - Stunnel4		: 447, 777" | tee -a log-install.txt
echo "   - Dropbear		: 109, 143" | tee -a log-install.txt
echo "   - Badvpn		: 7100-7900" | tee -a log-install.txt
echo "   - Nginx		: 81" | tee -a log-install.txt
echo "   - Vmess TLS		: 443" | tee -a log-install.txt
echo "   - Vmess None TLS	: 80" | tee -a log-install.txt
echo "   - Vless TLS		: 443" | tee -a log-install.txt
echo "   - Vless None TLS	: 80" | tee -a log-install.txt
echo "   - Trojan GRPC		: 443" | tee -a log-install.txt
echo "   - Trojan WS		: 443" | tee -a log-install.txt
echo "   - Trojan Go		: 443" | tee -a log-install.txt
echo "   - slowdns              : 443,80,8080,53,5300" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone		: Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban		: [ON]"  | tee -a log-install.txt
echo "   - Dflate		: [ON]"  | tee -a log-install.txt
echo "   - IPtables		: [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot		: [ON]"  | tee -a log-install.txt
echo "   - IPv6			: [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On	: $aureb:00 $gg GMT +7" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Change port" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""
echo ""
echo "------------------------------------------------------------"
echo ""
echo "===============-[ Script Created RVPN STORES]-==============="
echo -e ""
echo ""
echo "" | tee -a log-install.txt
rm /root/setup.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo -e " "
sleep 2
reboot 
