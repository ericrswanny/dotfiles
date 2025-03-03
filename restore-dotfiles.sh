#!/bin/bash

# Define the repository URL
DOTFILES_DIR="./"
CONFIG_DIR="$HOME/.config"

# Packages required
REQUIRED_PKGS=("git" "stow")

# Check if required packages are installed
for pkg in "${REQUIRED_PKGS[@]}"; do
  if ! command -v "$pkg" &>/dev/null; then
    echo "Error: $pkg is not installed. Please install it before running this script."
    exit 1
  fi
done

# List of configurations to stow
DOTFILES=("zsh" "tmux" "git" "ghostty" "nvim")

# Ensure .config directory exists
mkdir -p "$CONFIG_DIR"

# Stow dotfiles
for dir in "${DOTFILES[@]}"; do
  if [ -d "$DOTFILES_DIR/$dir" ]; then
    echo "Stowing $dir..."
    stow "$dir"
  else
    echo "Skipping $dir: Directory not found in dotfiles repo."
  fi
done

echo "Dotfiles restoration complete!"
