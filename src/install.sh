#!/usr/bin/env bash

# Install pre-requisites
sudo apt-get update
sudo apt install -y \
    curl \
    wget

# Check if shell is interactive; if it is interactive give the user prompts of what to install
if [ "$DEBIAN_FRONTEND" != "noninteractive" ]; then
    echo
    echo "------------------------------------------------------------------------"
    echo "Dotfiles install"
    echo "Please enter 'y' for the items to install, or 'n' for the items to skip."
    echo "------------------------------------------------------------------------"

    # Find all folders in "~/.dotfiles/src/" containing "install.sh"
    folder_names=()
    for install_file in ~/.dotfiles/src/*/install.sh
    do
        # Strip contianing folder (prefix), strip filename (suffix)
        prefix_name="$HOME/.dotfiles/src/"
        suffix_name="/install.sh"
        folder_name=$install_file
        folder_name=${folder_name#$prefix_name}
        folder_name=${folder_name%$suffix_name}

        # Append foldername to array
        folder_names=(${folder_names[@]} $folder_name)
    done

    # Find which folders user wants to install
    install_list=()
    for folder_name in "${folder_names[@]}"
    do
        while true; do
            read -p "  Do you wish to install $folder_name? (y/n) " yn
            case $yn in
                [Yy]* ) install_list=(${install_list[@]} $folder_name); break;;
                [Nn]* ) break;;
                * ) echo "   Please answer yes or no.";;
            esac
        done
    done

    # Run each install.sh where the user answered yes
    for install_folder in "${install_list[@]}"
    do
        # Install $install_folder
        ~/.dotfiles/src/$install_folder/install.sh
    done

else
    # Can't prompt user what to install; install everything
    # Run all "install.sh" files in nested folders
    for install_file in ~/.dotfiles/src/*/install.sh
    do
        $install_file
    done

fi
