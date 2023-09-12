#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
#link izin ip vps
url_izin='https://raw.githubusercontent.com/rizkyckj/izin/master/izin'

#IP VPS
ip_vps=$(curl -sS ifconfig.me)

# Mendapatkan isi file izin.txt dari URL
izin=$(curl -s "$url_izin")

# Memeriksa apakah konten izin.txt berhasil didapatkan
if [[ -n "$izin" ]]; then
  while IFS= read -r line; do
    # Memisahkan nama VPS, IP VPS, dan tanggal kadaluwarsa
    nama=$(echo "$line" | awk '{print $1}')
    ipvps=$(echo "$line" | awk '{print $2}')
    tanggal=$(echo "$line" | awk '{print $3}')

    # Memeriksa apakah IP VPS saat ini cocok dengan IP VPS yang ada di izin.txt
    if [[ "$ipvps" == "$ip_vps" ]]; then
      echo "Nama VPS: $nama"
      echo "IP VPS: $ipvps"
      echo "Tanggal Kadaluwarsa: $tanggal"
      break
    fi
  done <<< "$izin"

  # Memeriksa apakah IP VPS ditemukan dalam izin.txt
  if [[ "$ipvps" != "$ip_vps" ]]; then
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ip_vps \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/RVPNSTORES"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6281935718766"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit 0
  fi
else
  echo "Konten izin.txt tidak berhasil didapatkan dari URL"
  exit 0
fi

clear
echo -e "\\E[40;1;37m┌──────────────────────────────┐\E[0m"
echo -e "${CY}\\E[40;1;37m     << VlESS MANAGER >>       \E[0m"
echo -e "\\E[40;1;37m└──────────────────────────────┘ \E[0m"
echo ""
echo -e "\e[1;36m〔⎆〕 ${grenbo}1.${NC} \\E[40;1;37mCreate Vless Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}2.${NC} \\E[40;1;37mTrial Vless Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}3.${NC} \\E[40;1;37mRenew Vless Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}4.${NC} \\E[40;1;37mDelete Vless Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}5.${NC} \\E[40;1;37mCheck Vless Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}7.${NC} \\E[40;1;37mShow Vless Account${NC}"
echo -e ""
read -p " Select From Options [1-5 or x ] :  "  opt
echo -e ""
case $opt in
1) clear ; add-vless ; exit ;;
2) clear ; trialvless ; exit ;;
3) clear ; renew-vless ; exit ;;
4) clear ; del-vless ; exit ;;
5) clear ; cek-vless ; exit ;;
6) clear ; usage-akun-xray-vless ; exit ;;
7) clear ; show-vless ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; menu ;;
esac
