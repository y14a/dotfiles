if [ `basename $SHELL` = "bash" ]; then
    if [ -e ${HOME}/.bashrc ]; then
        . ${HOME}/.bashrc
    fi
fi

