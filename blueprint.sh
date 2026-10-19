#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Globals
PTERODACTYL_DIRECTORY="/var/www/pterodactyl"

# Function to print section headers
print_header() {
    echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN} $1 ${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

# Function to print status messages
print_status() {
    echo -e "${YELLOW}⏳ $1...${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${MAGENTA}⚠️  $1${NC}"
}

# Function to check if command succeeded
check_success() {
    if [ $? -eq 0 ]; then
        print_success "$1"
        return 0
    else
        print_error "$2"
        return 1
    fi
}

# Function to animate progress
animate_progress() {
    local pid=$1
    local message=$2
    local delay=0.1
    local spinstr='|/-\'
    
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Welcome animation
welcome_animation() {
    clear
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}"
    echo "  ███████╗██████╗  ██████╗  █████╗ ███╗   ███╗███████╗██████╗ "
    echo "  ██╔════╝██╔══██╗██╔════╝ ██╔══██╗████╗ ████║██╔════╝██╔══██╗"
    echo "  ███████╗██║  ██║██║  ███╗███████║██╔████╔██║█████╗  ██████╔╝"
    echo "  ╚════██║██║  ██║██║   ██║██╔══██║██║╚██╔╝██║██╔══╝  ██╔══██╗"
    echo "  ███████║██████╔╝╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗██║  ██║"
    echo "  ╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝"
    echo -e "${NC}"
    echo -e "${CYAN}                  SDGAMER TOOLKIT${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    sleep 2
}

# Function: Install (Fresh Setup)
install_sdgamer() {
    print_header "FRESH INSTALLATION"
    
    if [ "$EUID" -ne 0 ]; then
        print_error "Please run this script as root or with sudo"
        return 1
    fi

    print_status "Starting Fresh Install for SDGAMER"

    # --- Step 1: Core Dependencies ---
    print_header "INSTALLING DEPENDENCIES"
    print_status "Installing required packages (curl, wget, unzip, git...)"
    sudo apt install -y ca-certificates curl git gnupg unzip wget zip > /dev/null 2>&1 &
    animate_progress $! "Installing core dependencies"
    check_success "Core dependencies installed" "Failed to install dependencies" || return 1

    # --- Step 2: Install Node.js 22.x ---
    print_header "INSTALLING NODE.JS 22.x"
    
    print_status "Setting up Node.js GPG keys and repository"
    sudo mkdir -p /etc/apt/keyrings
    sudo rm -f /etc/apt/keyrings/nodesource.gpg /etc/apt/sources.list.d/nodesource.list
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null
    
    print_status "Updating apt and installing Node.js"
    sudo apt update > /dev/null 2>&1
    sudo apt install -y nodejs > /dev/null 2>&1 &
    animate_progress $! "Installing Node.js"
    check_success "Node.js 22.x installed" "Failed to install Node.js" || return 1

    # --- Step 3: Install Yarn & Panel Dependencies ---
    print_header "INSTALLING YARN & PANEL DEPENDENCIES"
    
    print_status "Navigating to Pterodactyl directory ($PTERODACTYL_DIRECTORY)"
    cd "$PTERODACTYL_DIRECTORY" || { print_error "Directory not found!"; return 1; }

    print_status "Installing global Yarn"
    npm i -g yarn > /dev/null 2>&1 &
    animate_progress $! "Installing Yarn"
    check_success "Yarn installed" "Failed to install Yarn" || return 1
    
    print_status "Installing Yarn dependencies for Pterodactyl"
    yarn install > /dev/null 2>&1 &
    animate_progress $! "Installing Yarn packages"
    check_success "Yarn dependencies installed" "Failed to install Yarn dependencies" || return 1

    # --- Step 4: Download Blueprint ---
    print_header "DOWNLOADING BLUEPRINT"
    
    print_status "Downloading Blueprint's latest release"
    wget -q "https://github.com/BlueprintFramework/framework/releases/latest/download/release.zip" -O "$PTERODACTYL_DIRECTORY/release.zip"
    check_success "Release downloaded successfully" "Failed to download release" || return 1

    print_status "Extracting release files"
    unzip -o release.zip > /dev/null 2>&1 &
    animate_progress $! "Extracting files"
    check_success "Files extracted" "Failed to extract files" || return 1

    # --- Step 5: Configure & Run Blueprint Installer ---
    print_header "CONFIGURING & RUNNING BLUEPRINT"
    
    print_status "Creating .blueprintrc configuration file"
    touch "$PTERODACTYL_DIRECTORY/.blueprintrc"
    echo 'WEBUSER="www-data";
OWNERSHIP="www-data:www-data";
USERSHELL="/bin/bash";' > "$PTERODACTYL_DIRECTORY/.blueprintrc"
    check_success "Configuration created" "Failed to create .blueprintrc"

    if [ ! -f "blueprint.sh" ]; then
        print_error "blueprint.sh not found in extracted files!"
        return 1
    fi

    print_status "Making blueprint.sh executable"
    chmod +x "$PTERODACTYL_DIRECTORY/blueprint.sh"
    check_success "Made executable" "Failed to make executable" || return 1

    print_status "Starting Blueprint installer..."
    bash "$PTERODACTYL_DIRECTORY/blueprint.sh"
}

# Function: Reinstall (Rerun Only)
reinstall_sdgamer() {
    print_header "REINSTALLING SDGAMER"
    print_status "Starting reinstallation"
    cd "$PTERODACTYL_DIRECTORY" || return 1
    blueprint -rerun-install > /dev/null 2>&1 &
    animate_progress $! "Reinstalling"
    check_success "Reinstallation completed" "Reinstallation failed"
}

# Function: Update SDGAMER
update_sdgamer() {
    print_header "UPDATING SDGAMER"
    print_status "Starting update"
    cd "$PTERODACTYL_DIRECTORY" || return 1
    blueprint -upgrade > /dev/null 2>&1 &
    animate_progress $! "Updating"
    check_success "Update completed" "Update failed"
}

# Function to display the main menu
show_menu() {
    clear
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}           🔧 SDGAMER INSTALLER                ${NC}"
    echo -e "${CYAN}                SDGAMER HUB                    ${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e ""
    echo -e "${WHITE}╔═══════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}║                📋 MAIN MENU                   ║${NC}"
    echo -e "${WHITE}╠═══════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}║   ${GREEN}1)${NC} ${CYAN}Fresh Install${NC}                         ${WHITE}║${NC}"
    echo -e "${WHITE}║   ${GREEN}2)${NC} ${CYAN}Reinstall (Rerun Only)${NC}                ${WHITE}║${NC}"
    echo -e "${WHITE}║   ${GREEN}3)${NC} ${CYAN}Update SDGAMER${NC}                        ${WHITE}║${NC}"
    echo -e "${WHITE}║   ${GREEN}0)${NC} ${RED}Exit${NC}                               ${WHITE}║${NC}"
    echo -e "${WHITE}╚═══════════════════════════════════════════════╝${NC}"
    echo -e ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW}📝 Select an option [0-3]: ${NC}"
}

# Main execution
welcome_animation

while true; do
    show_menu
    read -r choice
    
    case $choice in
        1) install_sdgamer ;;
        2) reinstall_sdgamer ;;
        3) update_sdgamer ;;
        0) 
            echo -e "${GREEN}Exiting SDGAMER Installer...${NC}"
            echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
            echo -e "${CYAN}           Thank you for using SDGAMER!       ${NC}"
            echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
            sleep 2
            exit 0 
            ;;
        *) 
            print_error "Invalid option! Please choose between 0-3"
            sleep 2
            ;;
    esac
    
    echo -e ""
    read -p "$(echo -e "${YELLOW}Press Enter to continue...${NC}")" -n 1
done
