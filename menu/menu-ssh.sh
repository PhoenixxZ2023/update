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
    echo "IP VPS tidak ditemukan dalam izin.txt"
    exit 0
  fi
else
  echo "Konten izin.txt tidak berhasil didapatkan dari URL"
  exit 0
fi

clear
echo -e "\\E[40;1;37m┌──────────────────────────────┐\E[0m"
echo -e "${CY}\\E[40;1;37m       << SSH MANAGER >>       \E[0m"
echo -e "\\E[40;1;37m└──────────────────────────────┘ \E[0m"
echo ""
echo -e "\e[1;36m〔⎆〕 ${grenbo}1.${NC} \\E[40;1;37mCreating SSH Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}2.${NC} \\E[40;1;37mTriall SSH Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}3.${NC} \\E[40;1;37mRenew SSH Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}4.${NC} \\E[40;1;37mDelete SSH Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}5.${NC} \\E[40;1;37mCheck SSH Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}6.${NC} \\E[40;1;37mList SSH Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}7.${NC} \\E[40;1;37mAuto Kill user SSH${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}8.${NC} \\E[40;1;37mDelete All Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}9.${NC} \\E[40;1;37mBanner SSH Account${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}10.${NC}\\E[40;1;37m Lock Akun User ${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}11.${NC}\\E[40;1;37m Unlock Akun User ${NC}"
echo -e "\e[1;36m〔⎆〕 ${grenbo}12.${NC}\\E[40;1;37m Cek Detail Akun SSH & OpenVPN ${NC}"
echo -e ""
read -p " Select From Options [1-9 or x ] :  "  opt
echo -e ""
case $opt in
1) clear ; usernew ; exit ;;
2) clear ; trial ; exit ;;
3) clear ; renew ; exit ;;
4) clear ; hapus ; exit ;;
5) clear ; cek ; exit ;;
6) clear ; member ; exit ;;
7) clear ; autokill ; exit ;;
8) clear ; ceklim ; exit ;;
9) clear ; nano /etc/issue.net ; exit ;;
10) clear ; user-lock ; exit ;;
11) clear ; user-unlock ; exit ;;
12) clear ; show-ssh ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; m-sshovpn ;;
esac

