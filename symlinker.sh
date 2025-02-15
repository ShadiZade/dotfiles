#!/bin/bash

sudo ln -sf ~/Repositories/dotfiles/xkb/en /usr/share/X11/xkb/symbols/
sudo ln -sf ~/Repositories/dotfiles/xkb/ara /usr/share/X11/xkb/symbols/
mkdir ~/.config/emacs/
ln -sf ~/Repositories/dotfiles/emacs/*  ~/.config/emacs/
ln -sf ~/Repositories/private/elfeed-feeds.el ~/.config/emacs/
mkdir ~/.config/zsh/
ln -sf ~/Repositories/dotfiles/zsh/{aliases,extra,functions,variables}  ~/.config/zsh/
ln -sf ~/Repositories/dotfiles/zsh/zshrc  ~/.config/zsh/.zshrc
mkdir ~/.config/sxiv/exec
ln -sf ~/Repositories/dotfiles/sxiv/key-handler ~/.config/sxiv/exec
mkdir -p ~/.config/rofi/themes
ln -sf ~/Repositories/dotfiles/rofi/config.rasi ~/.config/rofi
ln -sf ~/Repositories/dotfiles/rofi/themes/* ~/.config/rofi/themes
mkdir ~/.config/bspwm
ln -sf ~/Repositories/dotfiles/bspwm/bspwmrc ~/.config/bspwm/
mkdir -p ~/.config/dunst/themes
ln -sf ~/Repositories/dotfiles/dunst/dunstrc ~/.config/dunst
ln -sf ~/Repositories/dotfiles/dunst/themes/* ~/.config/dunst/themes
mkdir ~/.config/kitty
ln -sf ~/Repositories/dotfiles/kitty/kitty.conf ~/.config/kitty
mkdir ~/.config/cowsay
ln -sf ~/Repositories/dotfiles/cowsay/none.cow ~/.config/cowsay
sudo ln -sf ~/Repositories/dotfiles/cowsay/none.cow /usr/share/cowsay/cows/
mkdir ~/.local/share/user-scripts/
ln -sf ~/Repositories/scripts/src/echolors.csv ~/.local/share/user-scripts/
sudo ln -sf ~/Repositories/dotfiles/fortune/marxism /usr/share/fortune
sudo ln -sf ~/Repositories/dotfiles/fortune/marxism.dat /usr/share/fortune
sudo ln -sf ~/Repositories/dotfiles/fortune/general /usr/share/fortune
sudo ln -sf ~/Repositories/dotfiles/fortune/general.dat /usr/share/fortune
mkdir -p ~/.config/polybar/scripts
ln -sf ~/Repositories/dotfiles/polybar/config.ini ~/.config/polybar/
ln -sf ~/Repositories/dotfiles/polybar/scripts/* ~/.config/polybar/scripts/
mkdir ~/.config/sxhkd/
ln -sf ~/Repositories/dotfiles/sxhkd/sxhkdrc ~/.config/sxhkd/
mkdir ~/.config/picom/
ln -sf ~/Repositories/dotfiles/picom/picom.conf ~/.config/picom/
mkdir -p ~/.config/fcitx5/conf/
ln -sf ~/Repositories/dotfiles/fcitx5/config ~/.config/fcitx5/
ln -sf ~/Repositories/dotfiles/fcitx5/profile ~/.config/fcitx5/
ln -sf ~/Repositories/dotfiles/fcitx5/conf/* ~/.config/fcitx5/conf/
mkdir -p ~/.config/mpv/scripts ~/.config/mpv/script-modules
ln -sf ~/Repositories/dotfiles/mpv/*conf ~/.config/mpv/
ln -sf ~/Repositories/dotfiles/mpv/scripts/* ~/.config/mpv/scripts/
ln -sf ~/Repositories/dotfiles/mpv/script-modules/* ~/.config/mpv/script-modules/
sudo ln -sf ~/Repositories/dotfiles/profiles/profile /etc/profile 
mkdir -p ~/.config/nsxiv/exec
ln -sf ~/Repositories/dotfiles/nsxiv/key-handler ~/.config/nsxiv/exec/
mkdir -p ~/.config/rofimoji/used-files/{latin,languages,ipa}
ln -sf ~/Repositories/dotfiles/rofimoji/rofimoji.rc ~/.config/rofimoji/
ln -sf ~/Repositories/dotfiles/rofimoji/used-files/languages/* ~/.config/rofimoji/used-files/languages/
ln -sf ~/Repositories/dotfiles/rofimoji/used-files/latin/* ~/.config/rofimoji/used-files/latin/
ln -sf ~/Repositories/dotfiles/rofimoji/used-files/ipa/* ~/.config/rofimoji/used-files/ipa/
mkdir ~/.config/zathura/
ln -sf ~/Repositories/dotfiles/zathura/zathurarc ~/.config/zathura/
ln -sf ~/Repositories/dotfiles/sioyek/*user.config ~/.config/sioyek
