#shellcheck shell=sh
# =============================================================================
#  Pre-Run
# =============================================================================
#  "spec_helper.sh" will be called before each test.
#  See: https://github.com/shellspec/shellspec#spec_helper

# Variables used during tests
PATH_DIR_REPO="$(cd "$(dirname "${SHELLSPEC_SPECDIR:?'SHELLSPEC_SPECDIR not set'}")" && pwd)"
PATH_DIR_TEST="${PATH_DIR_REPO}/tests"
PATH_DIR_WORK="${SHELLSPEC_TMPDIR:?'SHELLSPEC_TMPDIR not set'}"

# Exporting as env var to avoid shellcheck's "unused" error
export PATH_DIR_REPO
export PATH_DIR_TEST
export PATH_DIR_WORK
