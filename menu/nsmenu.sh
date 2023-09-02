echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "NameServer anda saat ini:"
echo -e "$(cat /etc/xray/dns)"
echo -e ""
read -rp "Input NameServer: " -e NS_DOMAIN
clear
rm -fr /etc/slowdns
	mkdir -p /etc/slowdns
echo $NS_DOMAIN >/etc/xray/dns
echo $NS_DOMAIN >/etc/xray/nsdomain
echo $NS_DOMAIN >/etc/slowdns/nsdomain
cd
	wget -O dnstt-server "https://raw.githubusercontent.com/rizkyckj/update/main/wireguard/dnstt-server" >/dev/null 2>&1
	chmod +x dnstt-server >/dev/null 2>&1
	wget -O dnstt-client "https://raw.githubusercontent.com/rizkyckj/update/main/wireguard/dnstt-client" >/dev/null 2>&1
	chmod +x dnstt-client >/dev/null 2>&1
	./dnstt-server -gen-key -privkey-file server.key -pubkey-file server.pub
	chmod +x *
	mv * /etc/slowdns
	wget -O /etc/systemd/system/client.service "https://raw.githubusercontent.com/rizkyckj/update/main/wireguard/client" >/dev/null 2>&1
	wget -O /etc/systemd/system/server.service "https://raw.githubusercontent.com/rizkyckj/update/main/wireguard/server" >/dev/null 2>&1
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/client.service 
	sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/server.service
	echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "NameServer Telah Berhasil Di Ubah"
echo ""
read -n 1 -s -r -p "Press any key to back menu"
menu
