#!/bin/bash

#extracts all contents of backup into functional arch based system (personal)
#
extract(){
# syncing over ~/.config to new dir.
rsync -av .config/awesome ~/.config/awesome
rsync -av .config/dunst   ~/.config/dunst
rsync -av .config/fontconf ~/.config/fontconfig
rsync -av .config/lf      ~/.config/lf
rsync -av .config/ncmpcpp ~/.config/ncmpcpp
rsync -av .config/newsboat ~/.config/newsboat
rsync -av .config/nvim  ~/.config/nvim
rsync -av .config/rofi   ~/.config/rofi
rsync -av .config/st     ~/.config/st
rsync -av .config/mpv    ~/.config/mpv
rsync -av .config/sxhkd  ~/.config/sxhkd
rsync -av .config/sxiv   ~/.config/sxiv
rsync -av .config/zathura ~/.config/zathura
rsync -av .config/compton ~/.config/compton.conf
rsync -av .config/emoji   ~/.config/emoji
rsync -av .config/fontawesome ~/.config/fontawesome


#syncing homedir files
rsync -av .abook ~/
rsync -av .mozilla/firefox/kvglthvf.default-release  ~/
rsync -av .parsec ~/
rsync -av .bash_profile ~/
rsync -av .bashrc ~/
rsync -av .dir_colors ~/
rsync -av .inputrc ~/
rsync -av .profile ~/
rsync -av .tmux.conf ~/
rsync -av .tmux.conf.backup ~/
rsync -av .vimrc ~/
rsync -av .xinitrc ~/
rsync -av .xprofile ~/
rsync -av .Xresources ~/
rsync -av .zshrc ~/

# syncing Documents/Xresources/folder
rsync -av Documents/Xresources ~/Documents/

# syncing crontab(s)
rsync -av Documents/cronmemory ~/Documents/

# syncing most script(s)
rsync -av .local/bin ~/.local/

#syncing st build
rsync -av .local/backups/st ~/Documents/



}
"$@"
