#!/usr/bin/env bats
load "$HELPERS_ROOT/test-helpers.bash"

ensure_variables_set BATS_SUPPORT_ROOT BATS_ASSERT_ROOT BATS_FILE_ROOT

load "$BATS_SUPPORT_ROOT/load.bash"
load "$BATS_ASSERT_ROOT/load.bash"
load "$BATS_FILE_ROOT/load.bash"

# bats file_tags=integration,linux

# BATS tests for verifying FluentDo Agent package installation via containers

setupFile() {
    if [[ "$(uname -s)" != "Linux" ]]; then
        skip "Skipping test: not running on Linux"
    fi
}

@test "integration: install of centos/7" {
    local repo_root="${BATS_TEST_DIRNAME:?}/../../../../.."
    local install_script="${repo_root}/install.sh"
    assert_file_exist "$install_script"
    run ${CONTAINER_RUNTIME:-docker} run --rm -t -v "${install_script}:/install.sh:ro" \
        centos:7 /bin/sh -c 'sed -i -e "s|^mirrorlist=http://mirrorlist.centos.org|#mirrorlist=http://mirrorlist.centos.org|g" /etc/yum.repos.d/CentOS-Base.repo && \
            sed -i -e "s|^#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-Base.repo && \
            /install.sh --debug'
    assert_success
    assert_output --partial 'FluentDo Agent installation completed successfully!'
    refute_output --partial '[ERROR]'
}

@test "integration: install of almalinux/8" {
    local repo_root="${BATS_TEST_DIRNAME:?}/../../../../.."
    local install_script="${repo_root}/install.sh"
    assert_file_exist "$install_script"
    run ${CONTAINER_RUNTIME:-docker} run --rm -t -v "${install_script}:/install.sh:ro" \
        almalinux:8 /bin/sh -c '/install.sh --debug'
    assert_success
    assert_output --partial 'FluentDo Agent installation completed successfully!'
    refute_output --partial '[ERROR]'
}

@test "integration: install of almalinux/9" {
    local repo_root="${BATS_TEST_DIRNAME:?}/../../../../.."
    local install_script="${repo_root}/install.sh"
    assert_file_exist "$install_script"
    run ${CONTAINER_RUNTIME:-docker} run --rm -t -v "${install_script}:/install.sh:ro" \
        almalinux:9 /bin/sh -c 'yum install -y epel-release && \
            /install.sh --debug'
    assert_success
    assert_output --partial 'FluentDo Agent installation completed successfully!'
    refute_output --partial '[ERROR]'
}

@test "integration: install of almalinux/10" {
    local repo_root="${BATS_TEST_DIRNAME:?}/../../../../.."
    local install_script="${repo_root}/install.sh"
    assert_file_exist "$install_script"
    run ${CONTAINER_RUNTIME:-docker} run --rm -t -v "${install_script}:/install.sh:ro" \
        almalinux:10 /bin/sh -c 'yum install -y epel-release && \
            /install.sh --debug'
    assert_success
    assert_output --partial 'FluentDo Agent installation completed successfully!'
    refute_output --partial '[ERROR]'
}

@test "integration: install of ubuntu 22.04" {
    local repo_root="${BATS_TEST_DIRNAME:?}/../../../../.."
    local install_script="${repo_root}/install.sh"
    assert_file_exist "$install_script"
    run ${CONTAINER_RUNTIME:-docker} run --rm -t -v "${install_script}:/install.sh:ro" \
        ubuntu:22.04 /bin/sh -c 'apt-get update && apt-get install -y curl && /install.sh --debug'
    assert_success
    assert_output --partial 'FluentDo Agent installation completed successfully!'
    refute_output --partial '[ERROR]'
}

@test "integration: install of ubuntu 24.04" {
    local repo_root="${BATS_TEST_DIRNAME:?}/../../../../.."
    local install_script="${repo_root}/install.sh"
    assert_file_exist "$install_script"
    run ${CONTAINER_RUNTIME:-docker} run --rm -t -v "${install_script}:/install.sh:ro" \
        ubuntu:24.04 /bin/sh -c 'apt-get update && apt-get install -y curl && /install.sh --debug'
    assert_success
    assert_output --partial 'FluentDo Agent installation completed successfully!'
    refute_output --partial '[ERROR]'
}

@test "integration: install of Debian Bookworm" {
    local repo_root="${BATS_TEST_DIRNAME:?}/../../../../.."
    local install_script="${repo_root}/install.sh"
    assert_file_exist "$install_script"
    run ${CONTAINER_RUNTIME:-docker} run --rm -t -v "${install_script}:/install.sh:ro" \
        debian:bookworm /bin/sh -c 'apt-get update && apt-get install -y curl && /install.sh --debug'
    assert_success
    assert_output --partial 'FluentDo Agent installation completed successfully!'
    refute_output --partial '[ERROR]'
}

@test "integration: install of Debian Trixie" {
    local repo_root="${BATS_TEST_DIRNAME:?}/../../../../.."
    local install_script="${repo_root}/install.sh"
    assert_file_exist "$install_script"
    run ${CONTAINER_RUNTIME:-docker} run --rm -t -v "${install_script}:/install.sh:ro" \
        debian:trixie /bin/sh -c 'apt-get update && apt-get install -y curl && /install.sh --debug'
    assert_success
    assert_output --partial 'FluentDo Agent installation completed successfully!'
    refute_output --partial '[ERROR]'
}
