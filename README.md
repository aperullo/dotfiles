# Dotfiles

Welcome to my dotfiles repo!

## Bootstrap

To begin the bootstrap run

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/aperullo/dotfiles/master/init-dot.sh)"
```

Uses yadm to turn the home directory into a git repository

# KDE Plasma configuration

KDE configuration was saved using [Konsave](https://github.com/Prayag2/konsave)

To use, download Konsave and save it (can use a venv).

```
> konsave --import kde/endeavor.knsv
> konsole --apply endeavor
```
