#!/bin/bash

# Update package lists
apt-get update

# List of packages to install
packages=(
    "nodejs" # Node.js runtime
    "npm" # Node Package Manager
    "python3-pip" # Pip package installer for Python
    "ruby-full" # Ruby programming language
    "ruby-bundler" # Bundler for managing Ruby application dependencies
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
