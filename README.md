# git-global-to-local-hooks

This repository allows you to use global hooks without overriding local ones.

### How?

1. It uses the classic `global hooks` strategy by setting a global git configuration to change the place git will look for hooks.
2. In installs `forwarding global hooks` that will by default just trigger `project local hooks` considering the project you run a git command on (using `git rev-parse`).
3. It installs a forwarding global hook for all existing kind of hooks: see [the documentation](https://git-scm.com/docs/githooks):
    - applypatch-msg
    - commit-msg
    - fsmonitor-watchman
    - post-update
    - pre-applypatch
    - pre-commit
    - pre-merge-commit
    - pre-push
    - pre-rebase
    - pre-receive
    - prepare-commit-msg
    - push-to-checkout
    - run-local-hook
    - update
4. In conclusion, to install this should not affect the way your current hooks are triggered. You can then update any default `forwarding global hook` to have a `global hook` running on all your projects, without overriding local ones that will be called afterward.


## Installation

The global hooks will be installed in `$HOME/.git-global.hooks`.

```bash
sh install.sh
```

## License

The code is released under the AGPLv3. 
If subdirectories include a different license, that license applies instead.
