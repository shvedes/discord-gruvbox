#!/bin/bash

file_name="gruvbox-dark.theme.css"
url="https://raw.githubusercontent.com/shvedes/discord-gruvbox/refs/heads/main/$file_name"

path_vesktop="$HOME/.config/vesktop/themes"
path_vencord="$HOME/.config/Vencord/themes"

has_vesktop=$(command -v vesktop)
has_discord=$(command -v discord)

targets=()

if [ -n "$has_vesktop" ] && [ -n "$has_discord" ]; then
    targets+=("$path_vesktop" "$path_vencord")
elif [ -n "$has_vesktop" ]; then
    targets+=("$path_vesktop")
elif [ -n "$has_discord" ]; then
    targets+=("$path_vencord")
else
    echo "Neither vesktop nor vencord is installed. Exiting."
    exit 1
fi

for dir in "${targets[@]}"; do
    mkdir -p "$dir"
    if curl -s "$url" -o "$dir/$file_name"; then
        echo "Installed to: $dir"
    else
        echo "Failed to download to: $dir"
    fi
done
