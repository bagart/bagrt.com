#!/bin/bash
CUR_PATH="$(pwd)"
. "$(dirname "${BASH_SOURCE[0]}")/.jump_to_laradock.sh";

  if [[ "$1" != "" ]]; then
    docker-compose -f docker-compose.multi.yml up -d $1 $2 $3 $4 $5
  else
    docker-compose -f docker-compose.multi.yml up -d bagrt-bot-tg  nginx torproxy
  fi
  docker-compose -f docker-compose.multi.yml ps

cd "${CUR_PATH}";
