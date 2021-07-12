#!/bin/bash
# =============================================================================
#  Welcome message to display when bash login
# =============================================================================

# Get OS info of the container
. /etc/os-release

cat <<HEREDOC
===============================================================================
 Welcome to OlioSource Dev Container
===============================================================================
- Current user: $(whoami)
- Working dir: $(pwd)
- OS: ${PRETTY_NAME}
- To add Alpine packages:
    $ apk list --no-cache <package name>
    $ sudo apk add --no-cace <package name>
- To run auto-formatter:
    Alt + Shift + F
- To show this welcome message agin:
    $ welcome
- To run all tests (lint, static analysis and unit tests)
    $ run-tests
HEREDOC
