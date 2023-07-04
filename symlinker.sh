#!/bin/bash

# bspwm
sudo ln -sf ~/Repositories/dotfiles/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
# cowsay
sudo ln -sf ~/Repositories/dotfiles/cowsay/none.cow /usr/share/cows/none.cow
# dunst
sudo ln -sf ~/Repositories/dotfiles/dunst/* ~/.config/dunst/
# emacs
rm ~/.emacs
sudo ln -sf ~/Repositories/dotfiles/emacs/init.el ~/.config/emacs/init.el
# fcitx5
sudo ln -sf ~/Repositories/dotfiles/fcitx5/conf/* ~/.config/fcitx5/conf/
sudo ln -sf ~/Repositories/dotfiles/fcitx5/config ~/.config/fcitx5/config
sudo ln -sf ~/Repositories/dotfiles/fcitx5/profile ~/.config/fcitx5/profile
# fortune
sudo ln -sf ~/Repositories/dotfiles/fortune/marxism* /usr/share/fortune/
# gtk (DO IT MANUALLY)
# kitty
sudo ln -sf ~/Repositories/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
# lightdm
sudo ln -sf ~/Repositories/dotfiles/lightdm/* /etc/lightdm/
# mpv
sudo ln -sf ~/Repositories/dotfiles/mpv/* ~/.config/mpv/
# picom
sudo ln -sf ~/Repositories/dotfiles/picom/picom.conf /etc/xdg/picom.conf
# polybar
mkdir ~/.config/polybar/scripts/
sudo ln -sf ~/Repositories/dotfiles/polybar/scripts/* ~/.config/polybar/scripts/
sudo ln -sf ~/Repositories/dotfiles/polybar/config.ini ~/.config/polybar/config.ini
# rofi
sudo ln -sf ~/Repositories/dotfiles/rofi/themes/* /usr/share/rofi/themes/
sudo ln -sf ~/Repositories/dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
# rofimoji
sudo ln -sf ~/Repositories/dotfiles/rofimoji/rofimoji.rc ~/.config/rofimoji.rc
# sxhkd
sudo ln -sf ~/Repositories/dotfiles/sxhkd/ ~/.config/sxhkd/sxhkdrc
# sxiv
sudo ln -sf ~/Repositories/dotfiles/sxiv/key-handler ~/.config/sxiv/exec/key-handler
# xkb
sudo ln -sf ~/Repositories/dotfiles/xkb/us /usr/share/X11/xkb/symbols/us
sudo ln -sf ~/Repositories/dotfiles/xkb/ara /usr/share/X11/xkb/symbols/ara
# zathura
sudo ln -sf ~/Repositories/dotfiles/zathura/zathurarc ~/.config/zathura/zathurarc
# zsh
sudo ln -sf ~/Repositories/dotfiles/zsh/aliases ~/.config/zsh/aliases
sudo ln -sf ~/Repositories/dotfiles/zsh/functions ~/.config/zsh/functions
sudo ln -sf ~/Repositories/dotfiles/zsh/extra ~/.config/zsh/extra
sudo ln -sf ~/Repositories/dotfiles/zsh/zshrc ~/.config/zsh/.zshrc
