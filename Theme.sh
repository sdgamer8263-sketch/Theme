#!/bin/bash

# ==========================================
# 🔐 BASIC PROTECTION & SETUP
# ==========================================
[[ $EUID -ne 0 ]] && echo "Run as root!" && exit 1

export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_MODE=a

if [ -f /etc/needrestart/needrestart.conf ]; then
  sudo sed -i "s/#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
  sudo sed -i "s/\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
fi

# Ensure required packages
apt-get update -y >/dev/null 2>&1
apt-get install -y jq curl wget unzip >/dev/null 2>&1

# ==========================================
# 🎨 COLORS & STYLES
# ==========================================
R="\e[31m"; G="\e[32m"; Y="\e[33m"
B="\e[34m"; M="\e[35m"; C="\e[36m"
W="\e[97m"; N="\e[0m"

BR="\e[1;31m"; BG="\e[1;32m"; BY="\e[1;33m"
BM="\e[1;35m"; BC="\e[1;36m"; BW="\e[1;97m"

trap 'echo -e "\n${R}[!] Force exit detected.${N}"; exit 1' SIGINT

# ==========================================
# 🔗 URL CONSTANTS
# ==========================================
URL_NOBITA="https://github.com/nobita329/Nobita-Cloud/raw/refs/heads/main/thame/UI"
URL_FG="https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Fg"
URL_EX="https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex"

# ==========================================
# 🧠 THEMES DATABASE (Merged Lists)
# Format: "Display Name | Type | Payload"
# Types: bp1 (Script 1 Blueprint), bp2 (Script 2 Blueprint), zip (Script 2 standard), script, submenu
# ==========================================
THEMES=(
  # === Script 1 Themes (Duplicates use these definitions as requested) ===
  "Euphoria Theme|bp1|euphoriatheme.blueprint"
  "BetterAdmin|bp1|BetterAdmin.blueprint"
  "Abyss Purple|bp1|abysspurple.blueprint"
  "Abyss Amber|bp1|amberabyss.blueprint"
  "Catppuccindactyl|bp1|catppuccindactyl.blueprint"
  "Abyss Crimson|bp1|crimsonabyss.blueprint"
  "Abyss Emerald|bp1|emeraldabyss.blueprint"
  "NightAdmin|bp1|nightadmin.blueprint"
  "Refresh Theme|bp1|refreshtheme.blueprint"
  "Slice|bp1|slice.blueprint"
  "Darkenate|bp1|darkenate.blueprint"
  "Recolor|bp1|recolor.blueprint"
  "BlueTables|bp1|bluetables.blueprint"
  "UltraDarkAdmin|bp1|ultradarkadmin.blueprint"
  "Xlpanel Theme|bp1|xlpaneltheme.blueprint"
  "Lemem Theme|bp1|lememtheme.blueprint"
  "Slate|bp1|slate.blueprint"
  "KaelixPrime|bp1|kaelixprime.blueprint"
  "M3dactyl|bp1|m3dactyl.blueprint"
  
  # === Script 2 Unique Themes & Exceptions ===
  "Nebula Theme|submenu|nebula"
  "Navy Seals|submenu|navy"
  "Billing Theme|zip|${URL_FG}/billing.zip"
  "Elysium Theme|zip|${URL_FG}/elysium.zip"
  "Enigma Theme|zip|${URL_FG}/enigma.zip"
  "Frostcore Theme|zip|${URL_FG}/frostcore.zip"
  "Hyper V2|script|https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/hyperv1.sh"
  "IceMinecraft Theme|zip|${URL_FG}/iceMinecraft.zip"
  "Lu Theme|bp2|${URL_EX}/lutheme.blueprint"
  "Nightcore Theme|zip|${URL_FG}/nightcore.zip"
  "Noobe Theme|zip|${URL_FG}/noobe.zip"
  "Nook Theme|zip|${URL_FG}/nook.zip"
  "Stellar Theme|zip|${URL_FG}/stellar.zip"
  
  # === Arix Theme (Explicit Addition) ===
  "Arix Theme|script|https://raw.githubusercontent.com/sdgamer8263-sketch/ax/main/install.sh"
)

# ==========================================
# 🔍 HELPERS
# ==========================================
get_title() { echo 'ICAgICAg44CCIOKAjCDigJMgTm9iaXRhLmRldiBDT05UUk9MIEhVQiDigJMg44CCICAgICAg' | base64 -d; }

header() {
  clear
  echo -e "${BC} ╔══════════════════════════════════════════════════════════╗${N}"
  printf " ${BC}║${BW}%-58s${BC}║${N}\n" "$(get_title)"
  printf " ${BC}║${B}%-58s${BC}║${N}\n" "      Merged Theme Installer • High Performance       "
  echo -e "${BC} ╚══════════════════════════════════════════════════════════╝${N}"
  echo -e " ${B}User:${N} $(whoami)  ${B}Host:${N} $(hostname)  ${B}Time:${N} $(date +'%H:%M')"
  echo -e "${C} ──────────────────────────────────────────────────────────${N}"
}

is_installed() {
    local slug="$1"
    if [[ -d "/var/www/pterodactyl/storage/extensions/$slug" ]]; then
        return 0 # Installed
    else
        return 1 # Not Installed
    fi
}

print_info() { echo -e "\n  ${BG}${BW} INFO ${N} ${BW}$1${N}"; }
print_warning() { echo -e "\n  ${BY}${BW} WARNING ${N} ${BW}$1${N}"; }
print_error() { echo -e "\n  ${BR}${BW} ERROR ${N} ${BW}$1${N}"; }

# ==========================================
# 🗂️ SUBMENUS (For Script 2 Exceptions)
# ==========================================
submenu_nebula() {
  while true; do
    header
    echo -e "${BM} ❖ NEBULA THEME VERSIONS ❖${N}\n"
    echo -e "  ${BW}[ 1 ]${N} Nebula Theme V1"
    echo -e "  ${BW}[ 2 ]${N} Nebula Theme V2"
    echo -e "  ${BW}[ 3 ]${N} Nebula Theme V3"
    echo -e "  ${BR}[ 0 ]${N} Back"
    echo -e "${C} ──────────────────────────────────────────────────────────${N}"
    read -p " 👉 Select option: " choice
    case "$choice" in
      1) SEL_NAME="Nebula V1"; SEL_TYPE="bp2"; SEL_PAYLOAD="${URL_EX}/nebula1.8.blueprint"; return 0;;
      2) SEL_NAME="Nebula V2"; SEL_TYPE="bp2"; SEL_PAYLOAD="${URL_EX}/nebula2.0.blueprint"; return 0;;
      3) SEL_NAME="Nebula V3"; SEL_TYPE="bp2"; SEL_PAYLOAD="${URL_EX}/nebula.blueprint"; return 0;;
      0) return 1;;
      *) echo -e "${R}Invalid selection.${N}"; sleep 1;;
    esac
  done
}

submenu_navy() {
  while true; do
    header
    echo -e "${BM} ❖ NAVY SEALS VERSIONS ❖${N}\n"
    echo -e "  ${BW}[ 1 ]${N} Navy Seals Slice Theme V1"
    echo -e "  ${BW}[ 2 ]${N} Navy Seals Slice Theme V2"
    echo -e "  ${BR}[ 0 ]${N} Back"
    echo -e "${C} ──────────────────────────────────────────────────────────${N}"
    read -p " 👉 Select option: " choice
    case "$choice" in
      1) SEL_NAME="Navy Seals V1"; SEL_TYPE="bp2"; SEL_PAYLOAD="${URL_EX}/navyseals.blueprint"; return 0;;
      2) SEL_NAME="Navy Seals V2"; SEL_TYPE="bp2"; SEL_PAYLOAD="${URL_EX}/navyseals.blueprint"; return 0;;
      0) return 1;;
      *) echo -e "${R}Invalid selection.${N}"; sleep 1;;
    esac
  done
}

# ==========================================
# ⚙️ INSTALLATION ENGINES
# ==========================================
install_blueprint() {
    local NAME="$1"
    local URL="$2"
    local IDENTIFIER="$3"
    
    cd /var/www/pterodactyl || { echo -e "${R}Directory not found!${N}"; exit 1; }
    echo -e "\n${G}📥 Downloading & Installing ${NAME}...${N}"
    wget -q "$URL" -O "$IDENTIFIER.blueprint"
    
    if [[ -f "$IDENTIFIER.blueprint" ]]; then
        # Standard blueprint fallback command integrated
        if ! yes | blueprint -i "$IDENTIFIER.blueprint"; then
            blueprint -install "$IDENTIFIER"
        fi
        rm -f "$IDENTIFIER.blueprint"
        sudo chown -R www-data:www-data /var/www/pterodactyl
    else
        echo -e "${R}❌ Download failed!${N}"
    fi
}

install_zip() {
    local NAME="$1"
    local URL="$2"
    
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"
    print_info "Downloading files..."
    wget -q "$URL" -O download.zip
    unzip -oq download.zip || true

    print_info "Extracting and Copying..."
    PTERO_DIR=$(find . -maxdepth 3 -type d -iname "pterodactyl" | head -n 1)
    if [ -n "$PTERO_DIR" ]; then
        sudo cp -r "$PTERO_DIR"/* /var/www/pterodactyl/
    else
        if [ -d "./resources" ] || [ -d "./public" ]; then
             sudo cp -r ./* /var/www/pterodactyl/
        else
            SINGLE_DIR=$(find . -mindepth 1 -maxdepth 1 -type d | grep -v "download.zip" | head -n 1)
            if [ -n "$SINGLE_DIR" ] && { [ -d "$SINGLE_DIR/resources" ] || [ -d "$SINGLE_DIR/public" ]; }; then
                sudo cp -r "$SINGLE_DIR"/* /var/www/pterodactyl/
            else
                rm -f download.zip
                sudo cp -r ./* /var/www/pterodactyl/ 2>/dev/null || true
            fi
        fi
    fi

    cd /var/www/pterodactyl
    print_info "Verifying Node.js version..."
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

    if [[ "$NAME" == *"Billing"* ]]; then
      print_info "Running Billing installation..."
      php artisan billing:install stable
    fi

    print_info "Building panel assets (DO NOT CLOSE TERMINAL)..."
    export NODE_OPTIONS=--openssl-legacy-provider
    php artisan migrate --force
    yarn build:production
    php artisan view:clear
    php artisan optimize:clear
    sudo chown -R www-data:www-data /var/www/pterodactyl

    rm -rf "$TEMP_DIR"
    echo -e "\n${G}✅ '$NAME' installed successfully.${N}"
}

# ==========================================
# 📋 MAIN MENU LOOP
# ==========================================
show_menu() {
  header
  echo -e "${BW} SELECT A THEME UI:${N}\n"
  
  local count=0
  for i in "${!THEMES[@]}"; do
      num=$((i+1))
      IFS='|' read -r t_name t_type t_payload <<< "${THEMES[$i]}"
      
      # Determine Installation Status
      if [[ "$t_type" == *"bp"* ]]; then
          if [[ "$t_type" == "bp1" ]]; then
              slug="${t_payload%.blueprint}"
          else
              slug=$(basename "$t_payload" .blueprint)
          fi
          if is_installed "$slug"; then
              status="${BG}●${N}" # Green dot
          else
              status="${R}○${N}" # Red circle
          fi
      else
          status="${C}⚡${N}" # Action indicator for scripts/zips
      fi
      
      printf "  ${BG}%02d${N} %-23s %b   " "$num" "$t_name" "$status"
      
      ((count++))
      if (( count % 2 == 0 )); then echo ""; fi
  done

  if (( count % 2 != 0 )); then echo ""; fi
  echo -e "\n\n  ${BR} 0 ${N} Exit"
  echo -e "${C} ──────────────────────────────────────────────────────────${N}"
}

while true; do
  show_menu
  read -p " 👉 Enter choice: " opt

  if [[ "$opt" == "0" ]]; then
      echo -e "\n${M} 👋 Goodbye!${N}"
      exit
  fi

  index=$((opt-1))
  if [[ -z "${THEMES[$index]}" ]]; then
      echo -e "\n${R} ❌ Invalid Option${N}"
      sleep 1
      continue
  fi

  IFS='|' read -r SEL_NAME SEL_TYPE SEL_PAYLOAD <<< "${THEMES[$index]}"

  # Intercept Submenus
  if [[ "$SEL_TYPE" == "submenu" ]]; then
      if [[ "$SEL_PAYLOAD" == "nebula" ]]; then
          submenu_nebula || continue
      elif [[ "$SEL_PAYLOAD" == "navy" ]]; then
          submenu_navy || continue
      fi
  fi

  # Determine Slug & URL for action
  if [[ "$SEL_TYPE" == "bp1" ]]; then
      SLUG="${SEL_PAYLOAD%.blueprint}"
      THEME_URL="${URL_NOBITA}/${SEL_PAYLOAD}"
  elif [[ "$SEL_TYPE" == "bp2" ]]; then
      SLUG=$(basename "$SEL_PAYLOAD" .blueprint)
      THEME_URL="$SEL_PAYLOAD"
  else
      SLUG=""
      THEME_URL="$SEL_PAYLOAD"
  fi

  clear
  header
  
  # Status Text
  if [[ -n "$SLUG" ]]; then
      if is_installed "$SLUG"; then
          cur_status="${BG}ALREADY INSTALLED${N}"
      else
          cur_status="${R}NOT INSTALLED${N}"
      fi
  else
      cur_status="${C}READY TO DEPLOY${N}"
  fi

  echo -e " ${BW}SELECTED UI:${N} ${BC}$SEL_NAME${N}"
  echo -e " ${BW}STATUS:${N}      $cur_status"
  echo -e "${C} ──────────────────────────────────────────────────────────${N}"
  
  echo -e "  ${BG}[ 1 ]${N} Install"
  if [[ "$SEL_TYPE" == *"bp"* ]]; then
      echo -e "  ${BR}[ 2 ]${N} Uninstall"
  fi
  echo -e "  ${BY}[ 0 ]${N} Back to Menu"
  echo -e "${C} ──────────────────────────────────────────────────────────${N}"

  read -p " 👉 Action: " action

  case $action in
      1)
          if [[ "$SEL_TYPE" == *"bp"* ]]; then
              install_blueprint "$SEL_NAME" "$THEME_URL" "$SLUG"
          elif [[ "$SEL_TYPE" == "zip" ]]; then
              install_zip "$SEL_NAME" "$THEME_URL"
          elif [[ "$SEL_TYPE" == "script" ]]; then
              echo -e "\n${G}🚀 Running Installation Script...${N}"
              bash <(curl -sSL "$THEME_URL")
          fi
          ;;
      2)
          if [[ "$SEL_TYPE" == *"bp"* ]]; then
              echo -e "\n${R}🗑️ Removing $SEL_NAME...${N}"
              cd /var/www/pterodactyl
              yes | blueprint -r "$SLUG"
          else
              echo -e "${R}Invalid Choice (Uninstall not supported for this type)${N}"
          fi
          ;;
      0) continue ;;
      *) echo -e "${R}Invalid Choice${N}" ;;
  esac

  echo
  read -p " ↩️ Press [Enter] to return..."
done
