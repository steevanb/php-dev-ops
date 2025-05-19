#!/usr/bin/env bash

set -eu

function on_error() {
    if [ -f "${OUTPUT_REDIRECT_PATHNAME}" ]; then
        cat "${OUTPUT_REDIRECT_PATHNAME}"
    fi

    echo -e "\e[0;31mError at line ${1}.\e[0m"
}

function rm_output_redirect_content() {
    if [ -f "${OUTPUT_REDIRECT_PATHNAME}" ]; then
        rm "${OUTPUT_REDIRECT_PATHNAME}"
    fi
}

trap 'on_error ${LINENO}' ERR

readonly OUTPUT_REDIRECT_PATH="${PROJECT_PATH}/var/log/${SCRIPT_RELATIVE_PATH}"
readonly OUTPUT_REDIRECT_PATHNAME="${OUTPUT_REDIRECT_PATH}/$(basename ${0}).log"

if [ ${VERBOSITY_LEVEL} -ge 1 ]; then
    readonly OUTPUT_REDIRECT="/dev/stdout"
else
    readonly OUTPUT_REDIRECT="${OUTPUT_REDIRECT_PATHNAME}"
    if [ ! -d "${OUTPUT_REDIRECT_PATH}" ]; then
        mkdir -p "${OUTPUT_REDIRECT_PATH}"
    fi
fi

rm_output_redirect_content
