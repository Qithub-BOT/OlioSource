#shellcheck shell=sh

# Simple example of shellspec usage
Describe 'echo command'
    It 'should print ok'
        When call echo 'ok'
        The output should eq 'ok'
    End
End

# Test of spec_helper.sh
Describe 'spec_helper'
    It 'should define PATH_DIR_REPO with a valid path'
        The value "$PATH_DIR_REPO" should be defined
        The path "$PATH_DIR_REPO" should be exist
    End

    It 'should define PATH_DIR_TEST with a valid path'
        The value "$PATH_DIR_TEST" should be defined
        The path "$PATH_DIR_TEST" should be exist
    End
End
