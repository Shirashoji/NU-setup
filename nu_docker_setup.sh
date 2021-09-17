#!/bin/sh


if [ "echo $(docker version) | grep 'Docker Engine'" ]; then
  echo 'Ok! Docker is found.'
else
  echo "You must install Docker!"
  open "https://docs.docker.com/desktop/mac/install/"
  exit 1
fi


docker login

etc=/Applications/Docker.app/Contents/Resources/etc

if [ -e /usr/local/share/zsh/site-functions/_docker ]; then
  echo "You can already do docker command completion."
else ln -s $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
fi

if [ -e /usr/local/share/zsh/site-functions/_docker-compose ]; then
  echo "You can already do docker-compose command completion."
else ln -s $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose
fi

if [ "echo $(docker images) | grep 'ischs/jisshu2'" ]; then
  echo "'ischs/jisshu2' is found."
else
  docker pull ischs/jisshu2
fi

read -p 'Please enter your Virgo username: ' virgo_userid < /dev/tty
ssh -p (port) -l ${virgo_userid} (domain)
