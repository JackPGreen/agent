#!/usr/bin/env bats

# bats file_tags=functional,windows

# Sample to show running on Windows and skipping on other OS types
@test "verify running on Windows and skipping on other OS types" {
    if [[ "${OSTYPE:-}" == "msys" ]]; then
        skip "Skipping test: not running on Windows"
    fi
    if [[ "$(uname -s)" != *"NT"* ]]; then
        skip "Skipping test: not running on Windows"
    fi
}
