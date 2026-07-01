# ==========================================
# HYPER UTILITY DOWNLOADING & EXECUTION
# ==========================================
echo -e "${CYAN}-> Checking required packages...${NC}"
apt-get update -y > /dev/null 2>&1
apt-get install -y wget curl > /dev/null 2>&1

echo -e "${CYAN}-> Downloading Hyper Utility...${NC}"
wget -q --show-progress https://hyper-r2.dgenx.net/hyperv1/hyper-utility -O hyper-utility

echo -e "${CYAN}-> Making the file executable...${NC}"
chmod +x hyper-utility

echo -e "${GREEN}=======================================================${NC}"
echo -e "${GREEN}  Download Complete! 🎉 Launching Hyper Utility...     ${NC}"
echo -e "${GREEN}=======================================================${NC}"
sleep 2

# Launch the interactive menu
./hyper-utility
