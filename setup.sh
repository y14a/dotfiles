#!/bin/sh

DOTFILES_DIR="$(cd $(dirname $0) && pwd)"

for dotfile in $(find ${DOTFILES_DIR} -type f -not -name $0)
do
    dest="${HOME}/.$(basename ${dotfile})"

    if [ ! -e ${dest} ]; then
        echo "Create link: ${dotfile} -> ${dest}"
        ln -s ${dotfile} ${dest}
    fi
done

