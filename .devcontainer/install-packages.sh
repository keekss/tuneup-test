#!/bin/bash

# Update package lists
apt-get update

# Install prerequisites for Docker repository
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add Docker repository
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update package lists after adding Docker repository
apt-get update

# List of packages to install
packages=(
    "build-essential"           # Essential packages for building software
    "curl"                      # Command-line tool for transferring data
    "git"                       # Distributed version control system
    "tmux"                      # Terminal multiplexer
    "vim"                       # Text editor
    "wget"                      # Command-line tool for downloading files
    "zsh"                       # Shell with advanced features
    "apt-transport-https"       # Secure package transport over HTTPS
    "ca-certificates"           # Common CA certificates
    "software-properties-common" # Common software properties
    "docker-ce-cli"             # Docker CLI (Command Line Interface)
    "docker-ce"                 # Docker Engine
    "rsync"                     # Remote file copy synchronization
    # "jq"                      # Lightweight and flexible command-line JSON processor
    # "xargs"                   # Command-line tool for building and executing command lines from standard input
)

# Install packages, checking if they are already installed first
for package in "${packages[@]}"; do
    if ! dpkg-query -W -f='${Status}' "$package" 2>/dev/null | grep -q "ok installed"; then
        if ! apt-get install -y "$package"; then
            echo "Failed to install $package. Exiting script."
            exit 1
        fi
    else
        echo "$package is already installed."
    fi
done

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions