#!/bin/bash

if [[ -f "$(dirname "${BASH_SOURCE[0]}")/../.env" ]]; then
    . "$(dirname "${BASH_SOURCE[0]}")/../.env"
else
    . "$(dirname "${BASH_SOURCE[0]}")/../.env.prod"
fi

cmd/run.sh $LARADOCK_SERVICE_DEFAULT cmd/torproxy.sh
