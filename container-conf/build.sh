#!/bin/bash
build_fedora_base_image
build_is_public=
build_want_yum_update=1

build_as_root() {
    install_repo_eval redhat-base
}

build_as_run_user() {
    build_run_user_home_chmod_public
}
