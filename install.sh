#!/bin/bash
# ZSH and Oh My ZSH must be installed before running this script
# This script will only copy the files to the home directory
# It will not install any dependencies

SOURCE_DIR=$(pwd)

# Check and install .gitconfig
if [[ -f "${SOURCE_DIR}/.gitconfig" ]]; then
    cp "${SOURCE_DIR}/.gitconfig" "${HOME}/.gitconfig"
    echo "Copied .gitconfig"
else
    echo "No .gitconfig found in the source directory"
fi

# Check and install .nanorc
if [[ -f "${SOURCE_DIR}/.nanorc" ]]; then
    cp "${SOURCE_DIR}/.nanorc" "${HOME}/.nanorc"
    echo "Copied .nanorc"
else
    echo "No .nanorc found in the source directory"
fi

# Check and install .zshrc
if [[ -f "${SOURCE_DIR}/.zshrc" ]]; then
    cp "${SOURCE_DIR}/.zshrc" "${HOME}/.zshrc"
    echo "Copied .zshrc"
else
    echo "No .zshrc found in the source directory"
fi

echo "Installation complete!"
