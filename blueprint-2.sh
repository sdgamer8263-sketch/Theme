#!/bin/bash

# ================= COLORS =================
R="\e[31m"; G="\e[32m"; Y="\e[33m"
B="\e[34m"; M="\e[35m"; C="\e[36m"
W="\e[97m"; N="\e[0m"

# ================= UI FUNCTIONS =================
header() {
  clear
  echo -e "${C}"
  echo "  ███████╗██████╗  ██████╗  █████╗ ███╗   ███╗███████╗██████╗ "
  echo "  ██╔════╝██╔══██╗██╔════╝ ██╔══██╗████╗ ████║██╔════╝██╔══██╗"
  echo "  ███████╗██║  ██║██║  ███╗███████║██╔████╔██║█████╗  ██████╔╝"
  echo "  ╚════██║██║  ██║██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  ██╔══██╗"
  echo "  ███████║██████╔╝╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗██║  ██║"
  echo "  ╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝"
  echo -e "${M}"
  echo "╔══════════════════════════════════════════════════════╗"
  echo "║                🚀 SDGAMER INSTALLER                  ║"
  echo "╠══════════════════════════════════════════════════════╣"
  echo "║           UI • Auto • Clean • SDGAMER             ║"
  echo "╚══════════════════════════════════════════════════════╝"
  echo -e "${N}"
}

step() {
  echo -e "${C}➜ $1${N}"
}

ok() {
  echo -e "${G}✔ $1${N}"
}

fail() {
  echo -e "${R}✘ $1${N}"
  exit 1
}

# ================= CHECK ROOT =================
if [ "$EUID" -ne 0 ]; then
  fail "Please run as root (sudo bash script.sh)"
fi

# ================= VARIABLES =================
export PTERODACTYL_DIRECTORY=/var/www/pterodactyl

# ================= START =================
header
step "Installing base dependencies (curl, wget, unzip)"
apt update -y && apt install -y curl wget unzip ca-certificates git gnupg zip || fail "Deps install failed"
ok "Base dependencies installed"

step "Switching to Pterodactyl directory"
if [ ! -d "$PTERODACTYL_DIRECTORY" ]; then
    fail "Pterodactyl directory not found at $PTERODACTYL_DIRECTORY"
fi
cd "$PTERODACTYL_DIRECTORY" || fail "Cannot enter directory"

step "Downloading SDGAMER Blueprint Framework"
# Fetching the latest release URL dynamically
DOWNLOAD_URL=$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest | grep 'browser_download_url' | grep 'release.zip' | cut -d '"' -f 4)
if [ -z "$DOWNLOAD_URL" ]; then
    fail "Could not find latest release URL"
fi

wget "$DOWNLOAD_URL" -O "$PTERODACTYL_DIRECTORY/release.zip"
unzip -o release.zip || fail "Unzip failed"
ok "SDGAMER files downloaded & extracted"

# ================= NODE.JS =================
step "Installing Node.js 20.x"
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" \
> /etc/apt/sources.list.d/nodesource.list

apt update -y && apt install -y nodejs || fail "Node.js install failed"
ok "Node.js installed"

# ================= YARN & DEPENDENCIES =================
step "Installing Yarn & Node dependencies"
npm i -g yarn || fail "Yarn install failed"
yarn install || fail "Yarn dependencies failed"
ok "Node dependencies ready"

# ================= CONFIG =================
step "Creating SDGAMER configuration"
cat <<EOF > "$PTERODACTYL_DIRECTORY/.blueprintrc"
WEBUSER="www-data";
OWNERSHIP="www-data:www-data";
USERSHELL="/bin/bash";
EOF
ok ".blueprintrc created"

# ================= PERMISSIONS =================
step "Setting permissions"
chmod +x "$PTERODACTYL_DIRECTORY/blueprint.sh" || fail "Permission failed"
chown -R www-data:www-data "$PTERODACTYL_DIRECTORY"
ok "Permissions fixed"

# ================= RUN BLUEPRINT =================
step "Launching SDGAMER installer"
bash "$PTERODACTYL_DIRECTORY/blueprint.sh"

# ================= DONE =================
echo -e "\n${G}🎉 SDGAMER Installation Complete!${N}"
echo -e "${Y}Panel is ready. Enjoy your new setup! 😏${N}"
