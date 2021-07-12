#shellcheck shell=sh

expect=$(cat <<'HEREDOC'
#!/bin/bash

# parrotry echoes the given args to STDOUT
parrotry() {
    echo "$@"
}

if [ 0 = $# ]; then
    echo >&2 "argument missing"
    exit 1
fi

parrotry "$@"

HEREDOC
)

Describe 'oliosource'
    It 'should inclue the sourced files excluding the shebangs'
        When run "${PATH_DIR_REPO}/oliosource" "${PATH_DIR_TEST}/basic/src/sample_main.sh"
        The output should eq "$expect"
    End
End
