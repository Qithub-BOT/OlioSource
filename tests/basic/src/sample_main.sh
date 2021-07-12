#!/bin/bash

# shellcheck disable=SC1091
. ./parrotry.sh

if [ 0 = $# ]; then
    echo >&2 "argument missing"
    exit 1
fi

parrotry "$@"
