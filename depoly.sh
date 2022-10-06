#!/bin/bash
set -eu

# timestamp for backup
timestamp=$(date +%Y%m%d%H%M%S)

# .bashrc
bashrc="${HOME}/.bashrc"
if [ -f $bashrc ]; then
  cp .bashrc_x ${HOME}/
  echo "source ${HOME}/.bashrc_x" >> $bashrc
else
  cp -f .bashrc_x $bashrc
fi

# .inputrc
inputrc=${HOME}/.inputrc
if [ -f $inputrc ]; then
  mv $inputrc $inputrc.${timestamp}.bak
fi
cp -f .inputrc ${HOME}/

# .vimrc
vimrc=${HOME}/.vimrc
if [ -f $vimrc ]; then
  mv $vimrc $vimrc.${timestamp}.bak
fi
cp -f .vimrc ${HOME}/

# .gitconfig
bash ./git_config.sh
