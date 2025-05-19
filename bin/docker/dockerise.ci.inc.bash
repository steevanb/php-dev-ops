#!/usr/bin/env bash

set -eu

source "${PROJECT_PATH}"/config/docker/docker-image-names.inc.bash

DOCKERISE_IMAGE_NAME="${DOCKER_CI_IMAGE_NAME}" source "${PROJECT_PATH}"/bin/docker/dockerise.inc.bash
