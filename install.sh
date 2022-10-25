#!/bin/bash

# exit on any error
set -eo pipefail

# set the hook folder
HOOKS_FOLDER="$HOME/.git-global-hooks"
echo '> Hooks folder set to $hook_folder'

# hook folder creation
if [ -d "$HOOKS_FOLDER" ]; then
    read -p "> The hooks folder already exist, are you sure to override all existing global hooks? [y|n] " -n 1 -r < /dev/tty
    echo
    if echo $REPLY | grep -E '^[Yy]$' > /dev/null; then
        echo '\t> Will override existing global hooks.'
    else
        echo '\t> Installation canceled.'
        exit 0
    fi
else
        mkdir $HOOKS_FOLDER    
fi

echo '> Copy default global forwarding hooks...'
    cp -f global_forwarding_hooks/* $HOOKS_FOLDER/

echo '> Globally configure git to always look for global hooks first.'
    git config --global core.hooksPath $HOOKS_FOLDER
