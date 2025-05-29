#!/bin/bash 
root=$(whoami)

if [[ "$root" == "root" ]] ; then
if command -v inetsim  > /dev/null ; then
echo "[+] inetsim is installed"
echo
else
apt-get install inetsim -y > /dev/null 2>&1
echo "[+] Installation complete."
echo
fi
if command -v cpanminus > /dev/null ; then
echo "[+] cpanminus is installed"
echo
else
apt-get install cpanminus -y > /dev/null 2>&1
echo "[+] Installation complete."
fi
echo
echo "[-] Downgrading INetSim"
echo
cpanm --install Net::DNS@1.22  > /dev/null 2>&1
echo "[+] Downgrading complete"
echo
host=$(hostname -I | awk '{print $1}')
sed -i 's/^#service_bind_address.*/service_bind_address 0.0.0.0/' /etc/inetsim/inetsim.conf > /dev/null 2>&1
sed -i 's/^#start_service dns/start_service 53/' /etc/inetsim/inetsim.conf > /dev/null 2>&1
sed -i "s/^#\s*dns_default_ip 10.10.10.1/dns_default_ip $host/" /etc/inetsim/inetsim.conf > /dev/null 2>&1
echo "[*] Configuring INetSim..."
echo
sleep 3
echo "INetSim is configured. To run INetSim, use: sudo inetsim"
else
echo "[-] Please run the script as root."
exit 1
fi
