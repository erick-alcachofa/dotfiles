#!/usr/bin/env bash

if [ -z "$DOTFILES" ]; then
    export DOTFILES=$HOME/dotfiles
    source $DOTFILES/env.sh
fi

yay -Syu

yay -S --needed git

git config --global user.name "erick-alcachofa"
git config --global user.email "158791341+erick-alcachofa@users.noreply.github.com"
git config --global init.defaultBranch "main"

git config --global core.editor nvim
git config --global core.pager delta

git config --global interactive.diffFilter 'delta --color-only'

git config --global delta.navigate true
git config --global delta.line-numbers true

git config --global merge.conflictstyle diff3
git config --global diff.colorMoved default


if [ -d "$HOME/secrets" ]; then
    if [ -d "$HOME/secrets/gpg" ]; then
        yay -S --needed gnupg

        GPG_KEYS="$HOME/secrets/gpg"

        gpg --import $GPG_KEYS/public.gpg
        gpg --import $GPG_KEYS/private.gpg
        gpg --import-ownertrust $GPG_KEYS/trust.gpg

        SIGNING_KEY="$(gpg --list-secret-keys --keyid-format long \
            | sed -n 's/^sec\s\+.*\/\(.*\)\s\+[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\s\+\[.*\].*$/\1/p')"

        git config --global --unset gpg.format
        git config --global commit.gpgSign true
        git config --global user.signingkey $SIGNING_KEY
    fi

    if [ -d "$HOME/secrets/ssh" ]; then
        yay -S --needed openssh

        sudo systemctl start sshd

        SSH_KEYS="$HOME/secrets/ssh"

        mkdir -p $HOME/.ssh
        mv $HOME/secrets/ssh/* $HOME/.ssh/
        ln -f -s $DOTFILES/git/ssh/config $HOME/.ssh/config

        ssh-add ~/.ssh/Erick3900
        ssh-add ~/.ssh/erick-alcachofa
    fi
fi
