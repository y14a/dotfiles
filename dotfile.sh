#!/bin/sh

DOTFILES_DIR="$(cd $(dirname $0) && pwd)"

create() {
    for dotfile in $(find ${DOTFILES_DIR} -type f -depth 1 -not -name $0)
    do
        dest="${HOME}/.$(basename ${dotfile})"
    
        if [ ! -e ${dest} ]; then
            echo "Creating link: ${dotfile} -> ${dest}"
            ln -s ${dotfile} ${dest}
        fi
    done
}

remove() {
    for dotfile in $(find ${DOTFILES_DIR} -type f -depth 1 -not -name $0)
    do
        dest="${HOME}/.$(basename ${dotfile})"
    
        if [ -e ${dest} ]; then
    	    echo "Removing ${dest}"
	    rm ${dest}
        fi
    done
}

case $1 in
    create)
	$1
	;;
    remove)
	$1
	;;
esac

