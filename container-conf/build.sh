#!/bin/bash
build_fedora_base_image
build_is_public=
build_want_yum_update=1

build_as_root() {
    install_repo_eval redhat-base
    build_yum install ruby-devel
}

build_as_run_user() {
    gem install --no-document fpm
    build_run_user_home_chmod_public
}
