# `statuslib`
Bash library for showing steps, with the format and look based off of `pacman`/`makepkg`'s.

## What it looks like
![Screenshot of terminal showing the look of statuslib](https://github.com/DimiDimit/statuslib/blob/f0c887a7aad359d55eef48cdc1fcf4740e36f3ea/look.png)

## Usage
Add `statuslib` as a Git submodule, for example:

```sh
$ git submodule add https://github.com/DimiDimit/statuslib lib/statuslib
```

Then include it in your script and use it, for example:

```bash
#!/usr/bin/env bash

script_dir="$(dirname "$(realpath "$0")")"
source "$script_dir/lib/statuslib/statuslib.sh"

set -eEuo pipefail

step "Processing step..."
sleep 1

substep "Working on substep..."
sleep 1
substep 2 "Second level of substep..."
sleep 1
substep 3 "More substep levels..."
sleep 1
subinfo 3 "Some information here..."
sleep 0.5
subinfo 2 "Parent information..."
sleep 1

warn "Proceed with caution!"
sleep 0.5

info "Top-level information..."
sleep 2

error "An error occurred!"
step "Task failed successfully."
```
