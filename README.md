# dotfiles (Ubuntu/Debian)
Sets up my Ubuntu/Debian environment for development.
> **Tested on**:
> - Debian 10 (WSL and Docker)
> - Debian 11 (WSL and Docker)
> - Debian 12 (Docker)
> - Ubuntu 20.04 (WSL)
> - Ubuntu 22.04 (WSL and Docker)

## GitHub Action checks
[![Test Setup](https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian/actions/workflows/test_setup.yml/badge.svg)](https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian/actions/workflows/test_setup.yml)
[![Validate EditorConfig](https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian/actions/workflows/validate_editorconfig.yml/badge.svg)](https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian/actions/workflows/validate_editorconfig.yml)

---

## Setup:
### Prerequisites for running inside a docker container
- Install sudo
  ```sh
  apt-get update && apt-get -y install sudo
  ```

### General prerequisites
- Install curl (might be installed already)
  ```sh
  sudo apt-get update && sudo apt-get -y install curl
  ```

### Installation
1. Run the following command in bash
   ```sh
   bash -c "$( curl -fsSL https://raw.githubusercontent.com/cathalnoonan/dotfiles_ubuntu-and-debian/HEAD/setup.sh )"
   ```
   > **Note**:
   > - Setup will take a few minutes.
   > - The sudo password might be requested during this process.
   > - You will need to type `Y` and/or press `ENTER` during the process.
   > - Docker setup might introduce one or two 20 second delays while running this command.
2. Run the following command to reload the settings
   ```sh
   source ~/.dotfiles/src/env.sh
   ```

---

## Updates

> **Note**: \
> The commands in this section are aliases, that are set in [src/alias.sh (link)](https://github.com/cathalnoonan/dotfiles_ubuntu-and-debian/blob/main/src/alias.sh).

To retrieve updates, run the following commands in bash:
1. Pull the latest changes
   ```sh
   dotfiles_update
   ```
2. Re/install any packages
   ```sh
   dotfiles_install
   ```
3. Reload the environment variables
   ```sh
   dotfiles_load
   ```
