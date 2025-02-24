#!/bin/bash

# Function to check if a command is installed
check_command_installed() {
    if command -v "$1" &> /dev/null; then
        echo "$1 is already installed."
        return 0
    else
        echo "$1 is not installed."
        return 1
    fi
}

# Function to install a tool using apt-get
install_with_apt() {
    echo "Installing $1..."
    sudo apt-get update
    sudo apt-get install -y "$1"
    if ! check_command_installed "$1"; then
        echo "Failed to install $1. Exiting."
        exit 1
    fi
}

# Function to install Go
install_go() {
    echo "Installing Go..."
    sudo apt-get update
    sudo apt-get install -y golang
    if ! check_command_installed "go"; then
        echo "Failed to install Go. Exiting."
        exit 1
    fi
}

# Function to install pip3
install_pip3() {
    echo "Installing pip3..."
    sudo apt-get update
    sudo apt-get install -y python3-pip
    if ! check_command_installed "pip3"; then
        echo "Failed to install pip3. Exiting."
        exit 1
    fi
}

# List of required commands
REQUIRED_COMMANDS=("git" "curl" "wget" "python3" "pip3" "go")

# Check and install missing tools
for cmd in "${REQUIRED_COMMANDS[@]}"; do
    if ! check_command_installed "$cmd"; then
        read -p "$cmd is required but not installed. Do you want to install it? (y/n): " INSTALL_CHOICE
        if [[ "$INSTALL_CHOICE" == "y" || "$INSTALL_CHOICE" == "Y" ]]; then
            case "$cmd" in
                "go") install_go ;;
                "pip3") install_pip3 ;;
                *) install_with_apt "$cmd" ;;
            esac
        else
            echo "$cmd is required. Exiting."
            exit 1
        fi
    fi
done

# Install Sublist3r
echo "Installing Sublist3r..."
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip3 install -r requirements.txt
cd ..

# Install AssetFinder
echo "Installing AssetFinder..."
go get -u github.com/tomnomnom/assetfinder

# Install Amass
echo "Installing Amass..."
sudo apt-get install -y amass

# Install SubFinder
echo "Installing SubFinder..."
go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder

# Install Findomain
echo "Installing Findomain..."
wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux
chmod +x findomain-linux
sudo mv findomain-linux /usr/local/bin/findomain

# Install MassDNS
echo "Installing MassDNS..."
git clone https://github.com/blechschmidt/massdns.git
cd massdns
make
sudo cp bin/massdns /usr/local/bin
cd ..

# Install AltDNS
echo "Installing AltDNS..."
pip3 install altdomain

echo "All tools installed successfully!"