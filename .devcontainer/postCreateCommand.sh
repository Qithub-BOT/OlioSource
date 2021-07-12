#!/bin/bash
# =============================================================================
#  postCreateCommand for devcontainer.json
# =============================================================================

PATH_DIR_ROOT_REPO="$(dirname "$(cd "$(dirname "$0")" && pwd)")"
PATH_FILE_WELCOME="${PATH_DIR_ROOT_REPO}/.devcontainer/welcomeMsg.sh"
PATH_FILE_SHSUBRMERGE="${PATH_DIR_ROOT_REPO}/oliosource"

# prepend to .bashrc
{
    # Aliases to ease testing
    echo "alias welcome='${PATH_FILE_WELCOME}'"
    echo "alias shsubrmerge='${PATH_FILE_SHSUBRMERGE}'"
    echo "alias run-tests='${PATH_DIR_ROOT_REPO}/.github/run-tests.sh'"

    # Show welcome message
    echo "$PATH_FILE_WELCOME"

    # shellcheck disable=SC2016
    echo "export PATH_DIR_ROOT_REPO=\"${PATH_DIR_ROOT_REPO}\""
} >>"${HOME}/.bashrc"
