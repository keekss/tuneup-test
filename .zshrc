#!/bin/zsh

# dotfiles-keekss

# Set up the Oh My Zsh framework for managing your zsh configuration
export ZSH="$HOME/.oh-my-zsh"

# Select theme
ZSH_THEME="steeef"

# Specify plugins to load
plugins=(
    git
    zsh-autosuggestions
)

# Load the Oh My Zsh plugins
source $ZSH/oh-my-zsh.sh