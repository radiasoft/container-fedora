#!/bin/sh
# Non-root users get the full {build_run_user_home} environment in the container.
if (( $EUID != 0 )); then
    # No core files. User can always raise this limit.
    ulimit -c 0
    unset $(compgen -A variable | grep -E '^(PYTHON|PYENV|VIRTUAL)')
    export HOME={build_run_user_home}
    export PYENV_ROOT=$HOME/.pyenv
    source "$HOME"/.bashrc >& /dev/null
    eval export HOME=~$USER
fi
exec "$@"
