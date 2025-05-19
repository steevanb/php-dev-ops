#!/usr/bin/env bash

set -eu

function theme_block() {
    local titleLength="${#2}"
    echo -en "\n\e[${1}m\e[1;37m    "
    for x in $(seq 1 "${titleLength}"); do echo -n " "; done;
    echo -e "\e[0m"

    echo -e "\e[${1}m\e[1;37m  ${2}  \e[0m"
    echo -en "\e[${1}m\e[1;37m    "
    for x in $(seq 1 "${titleLength}"); do echo -n " "; done;
    echo -e "\e[0m\n"
}

function theme_title() {
    if [ "${VERBOSITY_LEVEL}" == 0 ]; then
        echo -n "${1}..."
    else
        theme_block 46 "${1}"
    fi

    theme_last_title_time=$(date +%s%3N)
}


function theme_ok() {
    elapsed_milliseconds=$(( $(date +%s%3N) - theme_last_title_time))

    if [ "${VERBOSITY_LEVEL}" == 0 ]; then
        echo -e " [ \e[0;32mOK\e[0m ] ${elapsed_milliseconds}ms"
    else
        theme_block 42 "Ok - ${elapsed_milliseconds}ms"
    fi
}
