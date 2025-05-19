#!/usr/bin/env bash

set -eu

which docker > /dev/null 2>&1 && readonly HAS_DOCKER=true || readonly HAS_DOCKER=false

if [ "${HAS_DOCKER}" == true ]; then
    source "${PROJECT_PATH}"/config/docker/docker-image-name.inc.bash

    set +e
    tty -s > /dev/null 2>&1 && readonly IS_INTERACTIVE_SHELL=true || readonly IS_INTERACTIVE_SHELL=false
    set -e

    if ${IS_INTERACTIVE_SHELL}; then
        readonly DOCKER_INTERACTIVE_PARAMETER="--interactive"
    else
        readonly DOCKER_INTERACTIVE_PARAMETER=
    fi

    docker \
        run \
            ${DOCKER_INTERACTIVE_PARAMETER} \
            --tty \
            --rm \
            --mount type=bind,source="${PROJECT_PATH}",target=/app \
            --user "$(id -u)":"$(id -g)" \
            "${DOCKER_IMAGE_NAME}" \
            /app/"${SCRIPT_RELATIVE_PATH}"/"$(basename "${0}")" \
                ${@}

    exit 0
fi
