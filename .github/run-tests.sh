#!/bin/sh

# -----------------------------------------------------------------------------
#  Constants
# -----------------------------------------------------------------------------
SUCCESS=0
FAILURE=1
PATH_DIR_REPO_ROOT="$(dirname "$(cd "$(dirname "$0")" && pwd)")"
NAME_BIN="oliosource"
PATH_FILE_BIN="${PATH_DIR_REPO_ROOT}/${NAME_BIN}"

# -----------------------------------------------------------------------------
#  Setup
# -----------------------------------------------------------------------------
# Temporary move to the repository root
oldPathReturn="$(pwd)"
cd "$PATH_DIR_REPO_ROOT" || {
    echo >&2 "No such directory. Path: ${PATH_DIR_REPO_ROOT}"
}
trap 'cd "${oldPathReturn}"' 0

# FLAGS_SHFMT is a flag options for shfmt and should be update to .editorconfig
FLAGS_SHFMT='-d -i=4 -ln=posix -bn -ci -kp'

# -----------------------------------------------------------------------------
#  Functions
# -----------------------------------------------------------------------------
runShfmt() {
    printf "%s" "- Running lint ... "

    # shellcheck disable=SC2086
    result=$(shfmt $FLAGS_SHFMT "$PATH_FILE_BIN" 2>&1) || {
        echo >&2 "$result"
        echo >&2 "* Error: Lint: shfmt failed"

        return $FAILURE
    }

    echo 'OK'

    return $SUCCESS
}

runShellCheck() {
    printf "%s" "- Running static analysis ... "

    result=$(shellcheck --shell=sh "$PATH_FILE_BIN" 2>&1) || {
        echo >&2 "$result"
        echo >&2 "* Error: Static Analysis: shellcheck failed"

        return $FAILURE
    }

    echo 'OK'

    return $SUCCESS
}

runShellSpec() {
    printf "%s" "- Running unit tests ... "

    result=$(shellspec 2>&1) || {
        echo >&2 "$result"
        echo >&2 "* Error: Unit Test: shellspec failed"

        return $FAILURE
    }

    echo 'OK'

    return $SUCCESS
}

# -----------------------------------------------------------------------------
#  Main
# -----------------------------------------------------------------------------
runShfmt && \
runShellCheck && \
runShellSpec
