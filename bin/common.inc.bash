#!/usr/bin/env bash

set -eu

readonly SCRIPT_RELATIVE_PATH=$(readlink -f "${0}" | sed -e 's|.*\(bin/.*\)|\1|' | sed "s|/$(basename ${0})\$||")

VERBOSITY_LEVEL=0
VERBOSITY_LEVEL_PARAMETER=
for parameter in "${@}"; do
    if [ "${parameter}" == "-v" ]; then
        VERBOSITY_LEVEL=1
        VERBOSITY_LEVEL_PARAMETER="${parameter}"
    elif [ "${parameter}" == "-vv" ]; then
        VERBOSITY_LEVEL=2
        VERBOSITY_LEVEL_PARAMETER="${parameter}"
    elif [ "${parameter}" == "-vvv" ]; then
        VERBOSITY_LEVEL=3
        VERBOSITY_LEVEL_PARAMETER="${parameter}"
    fi
done
