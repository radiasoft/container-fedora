#!/bin/bash
build_docker_entrypoint='["/rsentry"]'
build_fedora_base_image
build_image_name=radiasoft/fedora
build_is_public=1
build_want_yum_update=1

build_as_root() {
    install_repo_eval redhat-base
    build_yum install langpacks-en
    export build_run_user_home
    build_replace_vars rsentry.sh /rsentry
    chmod a=rx /rsentry
}

build_as_run_user() {
    # Make sure all files in the run_user's home are public
    # see radiasoft/download/installers/container-run
    chmod -R a+rX "$build_run_user_home"
}
