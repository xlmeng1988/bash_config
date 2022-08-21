#!/bin/bash

# alias
git config --global alias.st 	'status'
git config --global alias.co 	'checkout'
git config --global alias.ci 	'commit'
git config --global alias.cia 	'commit --amend'
git config --global alias.cian 	'commit --amend --no-edit'
git config --global alias.br 	'branch'
git config --global alias.bra 	'branch -avv'
git config --global alias.diffw 'diff -w --ignore-all-space'

# no back off for `git branch`
git config --global pager.branch false

# color
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.interactive auto

# push
git config --global push.default simple

# core
git config --global core.whitespace trailing-space
git config --global core.editor vim

# user info
user_name=$(git config --get user.name)
user_email=$(git config --get user.email)
if [ "${user_name}" == "" ]; then
	echo 'git config --global user.name "Your Name"'
fi
if [ "${user_email}" == "" ]; then
	echo 'git config --global user.email "Your Email"'
fi