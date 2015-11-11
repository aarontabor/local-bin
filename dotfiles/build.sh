#!/bin/bash

ln -sf $HOME/bin/dotfiles/bashrc $HOME/.bashrc
ln -sf $HOME/bin/dotfiles/bash_logout $HOME/.bash_logout
ln -sf $HOME/bin/dotfiles/bash_profile $HOME/.bash_profile

ln -sf $HOME/bin/dotfiles/vimrc $HOME/.vimrc
ln -sf $HOME/bin/dotfiles/gitconfig $HOME/.gitconfig

ln -sf $HOME/bin/dotfiles/xinitrc $HOME/.xinitrc
ln -sf $HOME/bin/dotfiles/Xresources $HOME/.Xresources
ln -sf $HOME/bin/dotfiles/xbindkeysrc $HOME/.xbindkeysrc

mkdir $HOME/.xmonad
ln -sf $HOME/bin/dotfiles/xmonad.hs $HOME/.xmonad/xmonad.hs 
ln -sf $HOME/bin/dotfiles/xmobarrc $HOME/.xmobarrc

ln -sf $HOME/bin/dotfiles/mutt/muttrc $HOME/.muttrc
