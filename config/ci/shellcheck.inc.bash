#!/usr/bin/env bash

set -eu

readonly SHELLCHECK_DIRECTORIES=("bin")

# SC1091 (info): Not following: ./bin/docker/dockerise.inc.bash was not specified as input (see shellcheck -x)
# SC2155 (warning): Declare and assign separately to avoid masking return values.
# SC2015 (info): Note that A && B || C is not if-then-else. C may run when A is true.
# SC2181 (style): Check exit code directly with e.g. 'if ! mycmd;', not indirectly with $?.
# SC2001 (style): See if you can use ${variable//search/replace} instead.
# SC2034 (warning): x appears unused. Verify use (or export if used externally).
# SC2086 (info): Double quote to prevent globbing and word splitting.
readonly SHELLCHECK_EXCLUDES=("SC1091" "SC2155" "SC2015" "SC2181" "SC2001" "SC2034" "SC2086")
