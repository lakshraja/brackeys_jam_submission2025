#!/bin/sh
echo -ne '\033c\033]0;brackeys_jam_submission2025\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/linux.x86_64" "$@"
