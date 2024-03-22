#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 
fi
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
CYAN=$(tput setaf 6)
RED=$(tput setaf 1)
RESET=$(tput sgr0)
# Install required packages
echo "Installing required packages..."
apt update 
apt install sysvbanner

# Create symbolic link for iptables-dds script
# به داخل پوشه مخزن می‌رویم
mkdir /root/ipmart-ipv6
cd /root/ipmart-ipv6

# ساخت لینک نمادین با نام dds-tunnel که به tunnel.sh اشاره دارد
ln -s "$(pwd)/tunnelbroker.sh" /usr/local/bin/ipmart-ipv6
echo "${GREEN}Installation completed. You can now use ${RESET}${RED} ipmart-ipv6 ${RESET} command.${RESET}"
# تغییر مجوزهای اجرایی اسکریپت
chmod +x tunnelbroker.sh
sudo bash tunnelbroker.sh



