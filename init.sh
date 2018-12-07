#!/usr/bin/env bash

source /etc/os-release
VERSION=$(echo ${VERSION} | awk -F "[()]" '{print $2}')


case "$1" in
  
  pm2)

  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash 1>/dev/null #This install nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion


  nvm install 8.11.1 # This install node v8.11.1
  nvm use 8.11.1
  node -v # Show node version


  npm i -g pm2 1>/dev/null # This install pm2
  ;;

  docker)

  curl -sSL https://get.docker.com | sh
  if [[ "${ID}" == "debian" && ${VERSION_ID} == "7" || "${ID}" == "ubuntu" && $(echo "${VERSION_ID}" | cut -d '.' -f1) -eq 14 ]]; then
    service docker start
    service docker status
  else
    systemctl enable docker
    systemctl start docker
  fi
  ;;

  docker-daocloud)

  curl -sSL https://get.daocloud.io/docker | sh
  if [[ "${ID}" == "debian" && ${VERSION_ID} == "7" || "${ID}" == "ubuntu" && $(echo "${VERSION_ID}" | cut -d '.' -f1) -eq 14 ]]; then
    service docker start
    service docker status
  else
    systemctl enable docker
    systemctl start docker
  fi
  ;;

  docker-Aliyum)

  curl -sSL https://get.daocloud.io/docker | sh --mirror Aliyun
  if [[ "${ID}" == "debian" && ${VERSION_ID} == "7" || "${ID}" == "ubuntu" && $(echo "${VERSION_ID}" | cut -d '.' -f1) -eq 14 ]]; then
    service docker start
    service docker status
  else
    systemctl enable docker
    systemctl start docker
  fi
  ;;

esac
