#!/usr/bin/env bash

set -eu

set +e
tty -s > /dev/null 2>&1 && readonly IS_INTERACTIVE_SHELL=true || readonly IS_INTERACTIVE_SHELL=false
set -e

if ${IS_INTERACTIVE_SHELL}; then
    readonly DOCKER_INTERACTIVE_PARAMETER="--interactive"
else
    readonly DOCKER_INTERACTIVE_PARAMETER=
fi
