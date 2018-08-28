#!/bin/bash

DOT_FILES=(
    .tmux.conf
    .vimrc
    .zshrc
)

LOCALBIN=$HOME/local/bin

for file in ${DOT_FILES[@]}; do
    if [ -e "$HOME/$file" ]; then
        echo "Skip over '$file', because '$HOME/$file' already exists."
    else
        ln -sv $HOME/dotfiles/$file $HOME/$file
    fi
done



has() {
    type "$1" > /dev/null 2>&1
}

# --- Vim ---------------------------------------------------------------------

if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    printf "Installing vim-plug ... "
    curl -sfLo $HOME/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "done. Make sure to execute 'PlugInstall' on vim."
else
    echo "vim-plug has already been installed."
fi

# --- zsh ---------------------------------------------------------------------

if [ ! -e "$HOME/.zsh" ]; then
    mkdir "$HOME/.zsh"
fi
pushd "$HOME/.zsh"

if [ ! -f "$HOME/.zsh/zsh-completions" ]; then 
    git clone https://github.com/zsh-users/zsh-completions.git
fi

if [ ! -f "$HOME/.zsh/zsh-syntax-highlighting" ]; then
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
fi

popd

if ! has "peco"; then
    if ! has "$LOCALBIN/peco"; then
        printf "Installing peco ... "
        mkdir -p $LOCALBIN
        curl -sL "https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_amd64.tar.gz" |
            tar xz -C $LOCALBIN --strip=1 --wildcards '*/peco' --no-same-owner --no-same-permissions
        echo "done."
    fi
fi
