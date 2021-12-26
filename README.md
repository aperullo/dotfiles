# Dotfiles

Welcome to my dotfiles repo!

## Bootstrap

To begin the bootstrap run

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/aperullo/dotfiles/master/bootstrap.sh)"
```

If the repos is already cloned

```
./installer.sh
```

## Structure

Inspired by [Holman](https://github.com/holman/dotfiles).

Each subfolder is responsible for installing that program and any related aliases. The `installer.sh` will

- run any files under **topic/install.sh**
- symlink any files under **topic/*.zsh** into $ZSH_CUSTOM, where they load automatically.

Some `install.sh` files will also symlink files into $HOME.

It also should work across different distros by checking which package manager is installed.

# KDE Plasma configuration

KDE configuration was saved using [Konsave](https://github.com/Prayag2/konsave)

To use, download Konsave and save it (can use a venv). 

```
> konsave --import kde/endeavor.knsv
> konsole --apply endeavor
```
