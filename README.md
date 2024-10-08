[//]: # (Title: Nixy)  
[//]: # (Description: Nixy is a Hyprland NixOS configuration with home-manager, secrets and custom theming all in one place. It's a simple way to manage your system configuration and dotfiles.)  
[//]: # (Author: Hadi)  
[//]: # (Date: 09/04/24)
[//]: # (Version: v2.3.0)

<div align="center">
    <img src="https://raw.githubusercontent.com/anotherhadi/nixy/main/docs/src/logo.png" width="100px" />
</div>

<br>

# Nixy

<br>
<div align="center">
    <a href="https://github.com/anotherhadi/nixy">
        <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=Version&message=v2.3.0&colorA=181825&colorB=89b4fa&logo=githubactions&logoColor=89b4fa"/>
    </a>
    <a href="https://github.com/anotherhadi/nixy/stargazers">
        <img src="https://img.shields.io/github/stars/anotherhadi/nixy?color=89b4fa&labelColor=181825&style=for-the-badge&logo=starship&logoColor=89b4fa">
    </a>
    <a href="https://github.com/anotherhadi/nixy/">
        <img src="https://img.shields.io/github/repo-size/anotherhadi/nixy?color=89b4fa&labelColor=181825&style=for-the-badge&logo=github&logoColor=89b4fa">
    </a>
    <a href="https://nixos.org">
        <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=181825&logo=NixOS&logoColor=89b4fa&color=89b4fa">
    </a>
    <a href="https://github.com/anotherhadi/nixy/blob/main/LICENSE">
        <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=181825&colorB=89b4fa&logo=unlicense&logoColor=89b4fa"/>
    </a>
</div>
<br>

**Nixy** is a **Hyprland** NixOS configuration with **home-manager**, **secrets**, and **custom theming** all in one place.
It's a simple way to manage your system configuration and dotfiles.

## Table of Content

  - [Table of Content](#table-of-content)
  - [Gallery](#gallery)
  - [Architecture](#architecture)
    - [🏠 `home`](#-home)
    - [💻 `hosts`](#-hosts)
  - [Installation](#installation)
  - [Documentation](#documentation)

## Gallery

![nixy1](docs/src/nixy/1.png)
![nixy2](docs/src/nixy/2.png)
![nixy3](docs/src/nixy/3.png)

## Architecture

### 🏠 `home`

Those are the dotfiles and configuration files for user-level configuration

**Subfolders:**

- `programs` is a collection of apps configured with home-manager
- `scripts` is a folder full of bash scripts (see [SCRIPTS.md](docs/SCRIPTS.md))
- `system` is some "desktop environment" configuration
- `wallpapers` are... wallpapers

### 💻 `hosts`

Those are the host-specific configurations
Each host contains a `configuration.nix` for system-level configuration, a `home.nix` for user-level configuration, and a `variables.nix` for config wide variables.

**Subfolders:**

- 🎨 `themes` are the themes available *(see [THEMES.md](docs/THEMES.md))*
- 📦 `modules` are the nix modules that you can import
- `laptop` is my configuration for my laptop with Nvidia that you can copy
- `server` is for my homeserver (w/nextcloud, nginx, vaultwarden, ...)

## Installation

```sh
git clone https://github.com/anotherhadi/nixy ~/.config/nixos
```

- Copy the `hosts/laptop` folder, rename it to your system name, and change the variables inside the `variables.nix` file
- Add your `hardware-configuration.nix` to your new host's folder
- Add your 'nixosConfigurations' inside `flake.nix` (You can edit your hostname one and change the lines containing '# CHANGEME')

> [!NOTE]
> When you add new files, don't forget to run `git add .` to add them to the git repository

```sh
sudo nixos-rebuild switch --flake ~/.config/nixos#yourhostname
```

## Documentation

- [THEMES.md](docs/THEMES.md): How themes work and how to create your own
- [APPS.md](docs/APPS.md): Which apps are installed
- [SCRIPTS.md](docs/SCRIPTS.md): Scripts that are available
- [KEYBINDINGS.md](docs/KEYBINDINGS.md): Keybindings available in Hyprland
- [WALLPAPERS.md](docs/WALLPAPERS.md): Preview of every wallpapers available

- [TODO.md](docs/TODO.md): What's next (feel free to contribute)
- [CONTRIBUTING.md](docs/CONTRIBUTING.md): How to contribute
- [LICENSE](LICENSE): MIT License
