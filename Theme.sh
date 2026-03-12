#!/bin/bash

# ==========================================
# Banners
# ==========================================
function show_sdgamer_banner() {
    clear
    echo -e "\e[1;36m"
    echo "  ____  ____   ____    _    __  __ _____ ____  "
    echo " / ___||  _ \ / ___|  / \  |  \/  | ____|  _ \ "
    echo " \___ \| | | | |  _  / _ \ | |\/| |  _| | |_) |"
    echo "  ___) | |_| | |_| |/ ___ \| |  | | |___|  _ < "
    echo " |____/|____/ \____/_/   \_\_|  |_|_____|_| \_\\"
    echo -e "\e[0m"
    echo -e "\e[1;34m=================================================\e[0m"
}

function show_abyss_banner() {
    clear
    echo -e "\e[1;35m"
    echo "     _    ____ ___  __ ____ ____  "
    echo "    / \  | __ ) \ \/ // ___/ ___| "
    echo "   / _ \ |  _ \  \  / \___ \___ \ "
    echo "  / ___ \| |_) | /  \  ___) |__) |"
    echo " /_/   \_\____/ /_/\_\|____/____/ "
    echo -e "\e[0m"
    echo -e "\e[1;33mPOWERED BY - SDGAMER\e[0m"
    echo -e "\e[1;34m=================================================\e[0m"
}

# ==========================================
# Blueprint Install Function
# ==========================================
function install_blueprint() {
    local bp_file=$1
    local bp_url=$2
    
    echo -e "\e[1;32m\n[+] Starting installation for $bp_file...\e[0m"
    
    # Navigating to the pterodactyl directory
    cd /var/www/pterodactyl || { echo -e "\e[1;31mError: /var/www/pterodactyl directory not found!\e[0m"; sleep 2; return; }
    
    # Downloading the blueprint
    echo "Downloading $bp_file..."
    wget -q -O "$bp_file" "$bp_url"
    
    # Unzipping and installing
    echo "Unzipping and installing $bp_file..."
    unzip -o -q "$bp_file"
    blueprint -install "$bp_file"
    
    echo -e "\e[1;32m[+] Installation completed successfully!\e[0m"
    read -p "Press Enter to return to the menu..."
}

# ==========================================
# Sub-Menus
# ==========================================
function catppuccin_menu() {
    while true; do
        show_sdgamer_banner
        echo -e "\e[1;37m--- Catppuccindactyl Theme Options ---\e[0m"
        echo "1. Catppuccindactyl V1"
        echo "2. Catppuccindactyl V2"
        echo "0. Exit"
        echo ""
        read -p "Select an option: " cat_choice

        case $cat_choice in
            1) install_blueprint "1.catppuccindactyl.blueprint" "https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/1.catppuccindactyl.blueprint" ;;
            2) install_blueprint "2.catppuccindactyl.blueprint" "https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/2.catppuccindactyl.blueprint" ;;
            0) return ;;
            *) echo -e "\e[1;31mInvalid Option! Please try again.\e[0m"; sleep 1.5 ;;
        esac
    done
}

function abyss_menu() {
    while true; do
        show_abyss_banner
        echo -e "\e[1;37m--- Select Abyss Color Version ---\e[0m"
        echo "a) Purple Colour Version"
        echo "b) Amber Colour Version"
        echo "c) Emerald Colour Version"
        echo "d) Crimson Red Colour Version"
        echo "0) Exit"
        echo ""
        read -p "Select an option: " abyss_choice

        case $abyss_choice in
            a|A) install_blueprint "abysspurple.blueprint" "https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/Ty/abysspurple.blueprint" ;;
            b|B) install_blueprint "amberabyss.blueprint" "https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/Ty/amberabyss.blueprint" ;;
            c|C) install_blueprint "emeraldabyss.blueprint" "https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/Ty/emeraldabyss.blueprint" ;;
            d|D) install_blueprint "crimsonabyss.blueprint" "https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/Ty/crimsonabyss.blueprint" ;;
            0) return ;;
            *) echo -e "\e[1;31mInvalid Option! Please try again.\e[0m"; sleep 1.5 ;;
        esac
    done
}

# ==========================================
# Main Menu
# ==========================================
function main_menu() {
    while true; do
        show_sdgamer_banner
        echo -e "\e[1;37m--- Main Theme Menu ---\e[0m"
        echo "1. Nebula Theme"
        echo "2. Euphoriatheme"
        echo "3. Catppuccindactyl Theme"
        echo "4. Navy seals slice Theme"
        echo "5. Lu Theme"
        echo "6. Xlpanel Theme"
        echo "7. Refresh Theme"
        echo "8. Hyper V1 Theme"
        echo "9. ABYSS Themes"
        echo "0. Exit"
        echo ""
        read -p "Select an option: " choice

        case $choice in
            1) install_blueprint "nebula.blueprint" "https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/nebula.blueprint" ;;
            2) install_blueprint "euphoriatheme.blueprint" "https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/euphoriatheme.blueprint" ;;
            3) catppuccin_menu ;;
            4) install_blueprint "Navy.seals.slice.blueprint" "https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/Navy%20seals%20slice.blueprint" ;;
            5) install_blueprint "lutheme.blueprint" "https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/lutheme.blueprint" ;;
            6) install_blueprint "xlpaneltheme.blueprint" "https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/xlpaneltheme.blueprint" ;;
            7) install_blueprint "refreshtheme.blueprint" "https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/Ex/refreshtheme.blueprint" ;;
            8) 
               echo -e "\e[1;32mRunning Hyper V1 Installer...\e[0m"
               bash <(curl -sL https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/hyperv1.sh)
               read -p "Press Enter to return to the menu..."
               ;;
            9) abyss_menu ;;
            0) echo -e "\e[1;32mExiting... Have a great day!\e[0m"; exit 0 ;;
            *) echo -e "\e[1;31mInvalid Option! Please try again.\e[0m"; sleep 1.5 ;;
        esac
    done
}

# Run the script
main_menu

