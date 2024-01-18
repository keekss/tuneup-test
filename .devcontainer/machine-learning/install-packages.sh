#!/bin/bash

# List of packages to install
packages=(
    "python3-pip" # Pip package installer for Python
    "numpy" # NumPy
)
# Update package lists
sudo apt-get update
# Install packages, checking if they are already installed first
for package in "${packages[@]}"; do
    if ! dpkg-query -W -f='${Status}' "$package" 2>/dev/null | grep -q "ok installed"; then
        if ! sudo apt-get install -y "$package" && sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*; then
            echo "Failed to install $package. Exiting script."
            exit 1
        fi
    else
        echo "$package is already installed."
    fi
done