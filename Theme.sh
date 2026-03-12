#!/bin/bash

# Reset
NC='\033[0m'

# Style
BOLD='\033[1m'
DIM='\033[2m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
REVERSE='\033[7m'
HIDDEN='\033[8m'

# Foreground (Text Color Normal)
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Foreground (Text Color Bright/Bold)
BRIGHT_BLACK='\033[90m'
BRIGHT_RED='\033[91m'
BRIGHT_GREEN='\033[92m'
BRIGHT_YELLOW='\033[93m'
BRIGHT_BLUE='\033[94m'
BRIGHT_MAGENTA='\033[95m'
BRIGHT_CYAN='\033[96m'
BRIGHT_WHITE='\033[97m'

# Background Colors (Normal)
BG_BLUE='\033[44m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
BG_RED='\033[41m'

# URLs Base
URL_FG="https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Fg"
URL_EX="https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex"
URL_TY="https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/Ty"

# Print Functions
print_info() { echo -e "\n  ${BG_BLUE}${BRIGHT_WHITE}${BOLD} INFO ${NC} ${BOLD}$1${NC}\n"; }
print_success() { echo -e "\n  ${BG_GREEN}${BRIGHT_WHITE}${BOLD} SUCCESS ${NC} ${BOLD}$1${NC}\n"; }
print_warning() { echo -e "\n  ${BG_YELLOW}${BRIGHT_WHITE}${BOLD} WARNING ${NC} ${BOLD}$1${NC}\n"; }
print_error() { echo -e "\n  ${BG_RED}${BRIGHT_WHITE}${BOLD} ERROR ${NC} ${BOLD}$1${NC}\n"; }
log_info() { echo -e "${BOLD}${CYAN}$1${NC}"; }
log_success() { echo -e "${BOLD}${GREEN}$1${NC}"; }
log_error() { echo -e "${BOLD}${RED}$1${NC}"; }

# ==========================================
# BANNERS
# ==========================================

show_sdgamer_banner() {
    clear
    echo -e "${BRIGHT_CYAN}"
    echo "  ____  ____   ____    _    __  __ _____ ____  "
    echo " / ___||  _ \ / ___|  / \  |  \/  | ____|  _ \ "
    echo " \___ \| | | | |  _  / _ \ | |\/| |  _| | |_) |"
    echo "  ___) | |_| | |_| |/ ___ \| |  | | |___|  _ < "
    echo " |____/|____/ \____/_/   \_\_|  |_|_____|_| \_\\"
    echo -e "${NC}"
    echo -e "${BOLD}${MAGENTA}               AUTO INSTALLER THEME${NC}"
    echo -e "${BLUE}=================================================${NC}"
}

show_abyss_banner() {
    clear
    echo -e "${BRIGHT_MAGENTA}"
    echo "      _    ____  __  __ ____  ____  "
    echo "     / \  | __ ) \ \/ // ___|/ ___| "
    echo "    / _ \ |  _ \  \  / \___ \\___ \ "
    echo "   / ___ \| |_) | /  \  ___) |___) |"
    echo "  /_/   \_\____/ /_/\_\|____/|____/ "
    echo -e "${NC}"
    echo -e "${BOLD}${CYAN}               POWERED BY - SDGAMER${NC}"
    echo -e "${BLUE}=================================================${NC}"
}

show_catppuccin_banner() {
    clear
    echo -e "${BRIGHT_BLUE}"
    echo "   ____    _  _____ ____  ____  _   _  ____ ____ ___ _   _ "
    echo "  / ___|  / \|_   _|  _ \|  _ \| | | |/ ___/ ___|_ _| \ | |"
    echo " | |     / _ \ | | | |_) | |_) | | | | |  | |    | ||  \| |"
    echo " | |___ / ___ \| | |  __/|  __/| |_| | |__| |___ | || |\  |"
    echo "  \____/_/   \_\_| |_|   |_|    \___/ \____\____|___|_| \_|"
    echo -e "${NC}"
    echo -e "${BOLD}${MAGENTA}                     POWERED BY - SDGAMER${NC}"
    echo -e "${CYAN}===============================================================${NC}"
}

show_navy_banner() {
    clear
    echo -e "${BRIGHT_CYAN}"
    echo "      _   _    _    __  __  __   __"
    echo "     | \ | |  / \   \ \/ /  \ \ / /"
    echo "     |  \| | / _ \   \  /    \ V / "
    echo "     | |\  |/ ___ \  /  \     | |  "
    echo "     |_| \_/_/   \_\/_/\_\    |_|  "
    echo -e "${NC}"
    echo -e "${BOLD}${MAGENTA}               POWERED BY - SDGAMER${NC}"
    echo -e "${BLUE}=================================================${NC}"
}

show_nebula_banner() {
    clear
    echo -e "${BRIGHT_YELLOW}"
    echo "   _   _ _____ ____  _   _ _        _    "
    echo "  | \ | | ____| __ )| | | | |      / \   "
    echo "  |  \| |  _| |  _ \| | | | |     / _ \  "
    echo "  | |\  | |___| |_) | |_| | |___ / ___ \ "
    echo "  |_| \_|_____|____/ \___/|_____/_/   \_\\"
    echo -e "${NC}"
    echo -e "${BOLD}${MAGENTA}               POWERED BY - SDGAMER${NC}"
    echo -e "${BLUE}=================================================${NC}"
}

show_xlpanel_banner() {
    clear
    echo -e "${BRIGHT_GREEN}"
    echo "   __  ___     ____   _    _   _ _____ _     "
    echo "   \ \/ / |   |  _ \ / \  | \ | | ____| |    "
    echo "    \  /| |   | |_) / _ \ |  \| |  _| | |    "
    echo "    /  \| |___|  __/ ___ \| |\  | |___| |___ "
    echo "   /_/\_\_____|_| /_/   \_\_| \_|_____|_____|"
    echo -e "${NC}"
    echo -e "${BOLD}${MAGENTA}               POWERED BY - SDGAMER${NC}"
    echo -e "${BLUE}=================================================${NC}"
}

# ==========================================
# SYSTEM SETUP & VALIDATION
# ==========================================

start_script() {
  show_sdgamer_banner
  echo -e ""
  echo -e "This script was created to make installing Pterodactyl themes easier."
  echo -e "Experiencing issues? Report them to the admin to get them fixed."
  sleep 2

  export DEBIAN_FRONTEND=noninteractive
  export NEEDRESTART_MODE=a

  if [ -f /etc/needrestart/needrestart.conf ]; then
    sudo sed -i "s/#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
    sudo sed -i "s/\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
  fi

  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get update -y >/dev/null 2>&1
  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y jq curl wget unzip >/dev/null 2>&1
  sleep 1
}

# ==========================================
# SUBMENU FUNCTIONS
# ==========================================

submenu_abyss() {
  while true; do
    show_abyss_banner
    echo -e " ${BRIGHT_WHITE}${BOLD}[a]${NC} ${WHITE}Purple Colour Version${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b]${NC} ${WHITE}Amber Colour Version${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[c]${NC} ${WHITE}Emerald Colour Version${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[d]${NC} ${WHITE}Crimson Red Colour Version${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[x]${NC} ${WHITE}Exit (Back to Main Menu)${NC}"
    echo -n -e "\n${BOLD}Select an option: ${NC}"
    read choice
    case "$choice" in
      a|A) THEME_NAME="Abyss Purple"; THEME_URL="$URL_TY/abysspurple.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      b|B) THEME_NAME="Abyss Amber"; THEME_URL="$URL_TY/amberabyss.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      c|C) THEME_NAME="Abyss Emerald"; THEME_URL="$URL_TY/emeraldabyss.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      d|D) THEME_NAME="Abyss Crimson"; THEME_URL="$URL_TY/crimsonabyss.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      x|X) return 1;;
      *) print_error "Invalid selection, please try again."; sleep 1;;
    esac
  done
}

submenu_catppuccin() {
  while true; do
    show_catppuccin_banner
    echo -e " ${BRIGHT_WHITE}${BOLD}[a]${NC} ${WHITE}Catppuccindactyl V1${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b]${NC} ${WHITE}Catppuccindactyl V2${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[x]${NC} ${WHITE}Exit (Back to Main Menu)${NC}"
    echo -n -e "\n${BOLD}Select an option: ${NC}"
    read choice
    case "$choice" in
      a|A) THEME_NAME="Catppuccindactyl V1"; THEME_URL="$URL_EX/1.catppuccindactyl.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      b|B) THEME_NAME="Catppuccindactyl V2"; THEME_URL="$URL_EX/2.catppuccindactyl.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      x|X) return 1;;
      *) print_error "Invalid selection, please try again."; sleep 1;;
    esac
  done
}

submenu_navy() {
  while true; do
    show_navy_banner
    echo -e " ${BRIGHT_WHITE}${BOLD}[a]${NC} ${WHITE}Navy Seals Slice Theme V1${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b]${NC} ${WHITE}Navy Seals Slice Theme V2${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[x]${NC} ${WHITE}Exit (Back to Main Menu)${NC}"
    echo -n -e "\n${BOLD}Select an option: ${NC}"
    read choice
    case "$choice" in
      a|A) THEME_NAME="Navy Seals V1"; THEME_URL="$URL_EX/Navy%20seals%20slice.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      b|B) THEME_NAME="Navy Seals V2"; THEME_URL="$URL_EX/navyseals.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      x|X) return 1;;
      *) print_error "Invalid selection, please try again."; sleep 1;;
    esac
  done
}

submenu_nebula() {
  while true; do
    show_nebula_banner
    echo -e " ${BRIGHT_WHITE}${BOLD}[a]${NC} ${WHITE}Nebula V1${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b]${NC} ${WHITE}Nebula V2${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[c]${NC} ${WHITE}Nebula V3${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[x]${NC} ${WHITE}Exit (Back to Main Menu)${NC}"
    echo -n -e "\n${BOLD}Select an option: ${NC}"
    read choice
    case "$choice" in
      a|A) THEME_NAME="Nebula V1"; THEME_URL="$URL_EX/nebula1.8.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      b|B) THEME_NAME="Nebula V2"; THEME_URL="$URL_EX/nebula2.0.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      c|C) THEME_NAME="Nebula V3"; THEME_URL="$URL_EX/nebula.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      x|X) return 1;;
      *) print_error "Invalid selection, please try again."; sleep 1;;
    esac
  done
}

submenu_xlpanel() {
  while true; do
    show_xlpanel_banner
    echo -e " ${BRIGHT_WHITE}${BOLD}[a]${NC} ${WHITE}Xlpanel V1${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b]${NC} ${WHITE}Xlpanel V2${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[x]${NC} ${WHITE}Exit (Back to Main Menu)${NC}"
    echo -n -e "\n${BOLD}Select an option: ${NC}"
    read choice
    case "$choice" in
      a|A) THEME_NAME="Xlpanel V1"; THEME_URL="$URL_EX/xlpaneltheme.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      b|B) THEME_NAME="Xlpanel V2"; THEME_URL="$URL_EX/xlpaneltheme2.0.blueprint"; INSTALL_TYPE="blueprint"; return 0;;
      x|X) return 1;;
      *) print_error "Invalid selection, please try again."; sleep 1;;
    esac
  done
}

# ==========================================
# MAIN MENU & INSTALLATION ENGINE
# ==========================================

install_theme() {
  while true; do
    show_sdgamer_banner
    echo " "
    echo -e " ${BRIGHT_WHITE}${BOLD}[01]${NC} ${WHITE}ABYSS Themes (Blueprint)${NC} ${CYAN}[Submenu]${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[02]${NC} ${WHITE}Arix Theme${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[03]${NC} ${WHITE}Billing Theme${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[04]${NC} ${WHITE}Catppuccindactyl (Blueprint)${NC} ${CYAN}[Submenu]${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[05]${NC} ${WHITE}Darkenate Theme (Blueprint)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[06]${NC} ${WHITE}Elysium Theme${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[07]${NC} ${WHITE}Enigma Theme${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[08]${NC} ${WHITE}Euphoriatheme (Blueprint)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[09]${NC} ${WHITE}Frostcore Theme${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[10]${NC} ${WHITE}Hyper V1 Theme${NC} ${YELLOW}[Script]${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[11]${NC} ${WHITE}IceMinecraft Theme${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[12]${NC} ${WHITE}Lemem Theme (Blueprint)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[13]${NC} ${WHITE}Lu Theme (Blueprint)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[14]${NC} ${WHITE}Navy Themes (Blueprint)${NC} ${CYAN}[Submenu]${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[15]${NC} ${WHITE}Nebula Themes (Blueprint)${NC} ${CYAN}[Submenu]${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[16]${NC} ${WHITE}Nightcore Theme${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[17]${NC} ${WHITE}Noobe Theme${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[18]${NC} ${WHITE}Nook Theme${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[19]${NC} ${WHITE}Refresh Theme (Blueprint)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[20]${NC} ${WHITE}Stellar Theme${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[21]${NC} ${WHITE}Xlpanel Themes (Blueprint)${NC} ${CYAN}[Submenu]${NC}"
    echo " "
    echo -e " ${BRIGHT_WHITE}${BOLD}[x]${NC} ${RED}Exit / Cancel Installation${NC}"
    echo " "
    echo -n -e "${BOLD}Enter your choice (1-21 or x)${NC}${BOLD}: ${NC}"
    read SELECT_THEME

    case "$SELECT_THEME" in
      1|01) submenu_abyss && break ;;
      2|02) THEME_NAME="Arix"; THEME_URL="$URL_FG/arix.zip"; INSTALL_TYPE="standard"; break ;;
      3|03) THEME_NAME="Billing"; THEME_URL="$URL_FG/billing.zip"; INSTALL_TYPE="standard"; break ;;
      4|04) submenu_catppuccin && break ;;
      5|05) THEME_NAME="Darkenate"; THEME_URL="$URL_EX/darkenate.blueprint"; INSTALL_TYPE="blueprint"; break ;;
      6|06) THEME_NAME="Elysium"; THEME_URL="$URL_FG/elysium.zip"; INSTALL_TYPE="standard"; break ;;
      7|07) THEME_NAME="Enigma"; THEME_URL="$URL_FG/enigma.zip"; INSTALL_TYPE="standard"; break ;;
      8|08) THEME_NAME="Euphoriatheme"; THEME_URL="$URL_EX/euphoriatheme.blueprint"; INSTALL_TYPE="blueprint"; break ;;
      9|09) THEME_NAME="Frostcore"; THEME_URL="$URL_FG/frostcore.zip"; INSTALL_TYPE="standard"; break ;;
      10) THEME_NAME="Hyper V1"; THEME_URL="https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/hyperv1.sh"; INSTALL_TYPE="script"; break ;;
      11) THEME_NAME="IceMinecraft"; THEME_URL="$URL_FG/iceMinecraft.zip"; INSTALL_TYPE="standard"; break ;;
      12) THEME_NAME="Lemem"; THEME_URL="$URL_EX/lememtheme.blueprint"; INSTALL_TYPE="blueprint"; break ;;
      13) THEME_NAME="Lu Theme"; THEME_URL="$URL_EX/lutheme.blueprint"; INSTALL_TYPE="blueprint"; break ;;
      14) submenu_navy && break ;;
      15) submenu_nebula && break ;;
      16) THEME_NAME="Nightcore"; THEME_URL="$URL_FG/nightcore.zip"; INSTALL_TYPE="standard"; break ;;
      17) THEME_NAME="Noobe"; THEME_URL="$URL_FG/noobe.zip"; INSTALL_TYPE="standard"; break ;;
      18) THEME_NAME="Nook"; THEME_URL="$URL_FG/nook.zip"; INSTALL_TYPE="standard"; break ;;
      19) THEME_NAME="Refresh"; THEME_URL="$URL_EX/refreshtheme.blueprint"; INSTALL_TYPE="blueprint"; break ;;
      20) THEME_NAME="Stellar"; THEME_URL="$URL_FG/stellar.zip"; INSTALL_TYPE="standard"; break ;;
      21) submenu_xlpanel && break ;;
      x|X) echo -e "\n${BOLD}Installation cancelled.${NC}"; return;;
      *) print_error "Invalid selection, please try again."; sleep 1;;
    esac
  done

  echo " "
  echo -n -e "${BOLD}You selected the theme '$THEME_NAME'. Continue? (y/n): ${NC}"
  read confirmation
  if [[ "$confirmation" != [yY]* ]]; then echo -e "${BOLD}Installation cancelled.${NC}"; return; fi

  # -- SCRIPT EXECUTION --
  if [ "$INSTALL_TYPE" == "script" ]; then
      print_info "Running installation script for $THEME_NAME..."
      bash <(curl -sL "$THEME_URL")
      return 0
  fi

  # -- INSTALLATION ENGINE --
  set -e
  TEMP_DIR=$(mktemp -d)
  trap 'rm -rf -- "$TEMP_DIR"' EXIT
  cd "$TEMP_DIR"

  print_info "Starting installation for theme $THEME_NAME..."

  if [ "$THEME_NAME" == "Enigma" ]; then
    echo -n -e "${BOLD}Enter WhatsApp link (starting with https://): ${NC}"; read LINK_ADMIN
    echo -n -e "${BOLD}Enter WhatsApp channel link (starting with https://): ${NC}"; read LINK_CHANNEL
    echo -n -e "${BOLD}Enter WhatsApp group link (starting with https://): ${NC}"; read LINK_GROUP
  fi

  print_info "[1/4] Downloading theme files..."
  wget -q "$THEME_URL"
  DOWNLOADED_FILE=$(ls -1 | head -n 1)

  if [ "$INSTALL_TYPE" == "blueprint" ]; then
    print_info "[2/4] Preparing Blueprint Framework..."
    if [ ! -f "/var/www/pterodactyl/blueprint.sh" ]; then 
        print_error "Blueprint Framework is not installed on your server!"
        return 1
    fi
    
    IDENTIFIER="${DOWNLOADED_FILE%.*}"
    sudo mv "$DOWNLOADED_FILE" /var/www/pterodactyl/
    
    print_info "[3/4] Installing $THEME_NAME via Blueprint..."
    cd /var/www/pterodactyl
    sudo blueprint -install "$IDENTIFIER"
    sudo chown -R www-data:www-data /var/www/pterodactyl
    sudo rm -f "/var/www/pterodactyl/$DOWNLOADED_FILE"
    
    print_success "Theme '$THEME_NAME' installed successfully."

  elif [ "$INSTALL_TYPE" == "standard" ]; then
    print_info "[2/4] Extracting theme files..."
    unzip -oq "$DOWNLOADED_FILE" || true

    if [ "$THEME_NAME" == "Enigma" ]; then
      print_info "Configuring Enigma variables..."
      sed -i "s|LINK_ADMIN|$LINK_ADMIN|g" pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx 2>/dev/null || true
      sed -i "s|LINK_CHANNEL|$LINK_CHANNEL|g" pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx 2>/dev/null || true
      sed -i "s|LINK_GROUP|$LINK_GROUP|g" pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx 2>/dev/null || true
    fi

    print_info "[3/4] Copying files to Pterodactyl..."
    sudo cp -rfT pterodactyl /var/www/pterodactyl
    cd /var/www/pterodactyl

    print_info "Checking Node.js version..."
    CURRENT_NODE_VER=$(node -v 2>/dev/null | cut -d'.' -f1 | sed 's/v//')
    if [[ "$CURRENT_NODE_VER" != "22" ]]; then
      print_warning "Installing Node.js v22..."
      sudo apt-get remove -y nodejs npm > /dev/null 2>&1 || true
      sudo apt-get purge -y nodejs > /dev/null 2>&1 || true
      sudo rm -f /usr/bin/node /usr/local/bin/node /usr/bin/npm /usr/local/bin/npm /etc/apt/sources.list.d/nodesource.list
      sudo mkdir -p /etc/apt/keyrings
      curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor --yes | sudo tee /etc/apt/keyrings/nodesource.gpg > /dev/null
      echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null
      sudo apt-get update -y > /dev/null 2>&1
      sudo apt-get install -y nodejs > /dev/null 2>&1
    fi

    hash -r
    sudo npm i -g yarn > /dev/null 2>&1
    
    print_info "Installing build dependencies..."
    yarn add cross-env react-feather > /dev/null 2>&1
    yarn install > /dev/null 2>&1

    if [ "$THEME_NAME" == "Billing" ]; then
      print_info "Running Billing installation..."
      php artisan billing:install stable
    fi

    print_info "[4/4] Building panel assets..."
    print_warning "Build process is running. DO NOT close the terminal until it finishes!"
    export NODE_OPTIONS=--openssl-legacy-provider
    php artisan migrate --force
    yarn build:production
    php artisan view:clear
    php artisan optimize:clear
    
    print_success "Theme '$THEME_NAME' installed successfully."
  fi

  echo " "
  log_success "[=================================================]"
  log_success "[       INSTALLATION COMPLETED SUCCESSFULLY       ]"
  log_success "[=================================================]"
  echo " "
  sleep 3
  return 0
}

# ==========================================
# START EXECUTION
# ==========================================
start_script
install_theme

