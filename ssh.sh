#!/bin/bash

echo "Será criado acesso ao repositorio "
read -p "Qual site repositorio (gitlab/github) ? " git
read -p "Usuario do repositorio ? " username
read -p "Nome do repositorio ? " repositorio
read -p "Email ? " mail

echo "
# $repositorio
    Host $repositorio.$git.com
    HostName $git.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/$repositorio
" >> ~/.ssh/config

echo " "
ssh-keygen -t rsa -b 4096 -f ~/.ssh/$repositorio -C "$mail"
echo " "
echo "Chave public"
cat ~/.ssh/$repositorio.pub
echo " "
echo " "
echo "Acesso $git"
echo "git remote add origin git@$repositorio.$git.com:$username/$repositorio.git"

read -p "OK " ok