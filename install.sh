#!/bin/bash

file_name="gruvbox-dark.theme.css"
url="https://raw.githubusercontent.com/shvedes/discord-gruvbox/refs/heads/main/$file_name"

path_vesktop="$HOME/.config/vesktop/themes"
path_vencord="$HOME/.config/Vencord/themes"
path_vencord_canary="$HOME/.config/VencordCanary/themes"

has_vesktop=$(command -v vesktop)
has_discord=$(command -v discord)
has_discord_canary=$(command -v discordcanary)

targets=()

if [ -n "$has_vesktop" ] && { [ -n "$has_discord" ] || [ -n "$has_discord_canary" ]; }; then
    targets+=("$path_vesktop" "$path_vencord" "$path_vencord_canary")
elif [ -n "$has_vesktop" ]; then
    targets+=("$path_vesktop")
elif [ -n "$has_discord" ]; then
    targets+=("$path_vencord")
elif [ -n "$has_discord_canary" ]; then
    targets+=("$path_vencord_canary")
else
    echo "Neither vesktop nor vencord (stable or canary) is installed. Exiting."
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
