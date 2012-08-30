#!/bin/sh


if [ -z "$1" ]; then
        echo "No argument given - using the default"
        URL="git@github.com:kcraam/homeskel.git"
else
        URL="$1"
fi

echo "Cloning from: $URL\n"

[ -z "`which git`" ] && echo "Install git first" && exit 1
[ -z "`which screen`" ] && echo "Install screen first" && exit 1
[ -z "`which tmux`" ] && echo "Install tmux first" && exit 1

#cd

if [ ! -d ".git" ]; then
        git init
        git remote add origin "$URL"
        git fetch
fi

git branch master origin/master
git checkout master
#git submodule init
#git submodule update

# Remove config files for non existing apps
[ -z "`which vim`" ] && rm -fr .vim* && echo "Vim not found, removing .vim* files"
[ -z "`which zsh`" ] && rm -fr .zsh* && echo "ZSH not found, removing .zsh* files"

exit 0
