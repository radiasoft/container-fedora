#!/bin/bash
build_fedora_base_image
build_is_public=
build_want_yum_update=1

build_as_root() {
    install_repo_eval redhat-base
    build_yum install langpacks-en
}

build_as_run_user() {
    # Make sure all files in the run_user's home are public
    # see radiasoft/download/installers/container-run
    chmod -R a+rX "$build_run_user_home"
}
