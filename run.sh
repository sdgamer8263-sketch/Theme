#!/bin/bash

# Function to show the banner
show_banner() {
    clear
    echo -e "\e[1;36m" # Cyan color start
    echo "  ____  ____   ____    _    __  __ _____ ____  "
    echo " / ___||  _ \ / ___|  / \  |  \/  | ____|  _ \ "
    echo " \___ \| | | | |  _  / _ \ | |\/| |  _| | |_) |"
    echo "  ___) | |_| | |_| |/ ___ \| |  | | |___|  _ < "
    echo " |____/|____/ \____/_/   \_\_|  |_|_____|_| \_\\"
    echo -e "\e[0m" # Color reset
    echo "=================================================="
    echo "           PROJECT: SKA HOSTING PANEL             "
    echo "=================================================="
}

# Main Menu function
show_menu() {
    show_banner
    echo -e "\e[1;33mSelect an Option:\e[0m"
    echo "1) Blueprint 1"
    echo "2) Blueprint 2"
    echo "3) Fix Blueprint"
    echo "4) Theme + Extension"
    echo "5) Uninstall Extension "
    echo "6) Exit"
    echo "--------------------------------------------------"
    echo -n "Enter your choice [1-5]: "
}

# Pause function to wait for Enter
pause() {
    echo ""
    echo -e "\e[1;32mCommand Finished!\e[0m"
    read -p "Press [Enter] key to go back to Main Menu..."
}

# Main Logic Loop
while true; do
    show_menu
    read choice

    case $choice in
        1)
            echo "Starting Blueprint 1..."
            bash <(curl -sL https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/blueprint.sh)
            pause
            ;;
        2)
            echo "Starting Blueprint 2..."
            bash <(curl -sL https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/blueprint-2.sh)
            pause
            ;;
        3)
            echo "Starting Fix Blueprint..."
            bash <(curl -sL https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/fix.sh)
            pause
            ;;
        4)
            echo "Starting Theme + Extension..."
            bash <(curl -sL https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/chang.sh)
            pause
            ;;
        5)
        echo "Uninstall Extension..."
            bash <(curl -sL https://raw.githubusercontent.com/sdgamer8263-sketch/Theme/main/uninstallblueprint.sh)
            pause
            ;;
        6)
            echo "Exiting... Good Luck!"
            exit 0
            ;;
        *)
            echo -e "\e[1;31mInvalid input!\e[0m Please select 1 to 5."
            sleep 2
            ;;
    esac
done
