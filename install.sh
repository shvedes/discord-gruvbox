#!/usr/bin/env bash

output_dir="$HOME/.config/vesktop/themes"
output_file="$output_dir/gruvbox-dark.theme.css"

if [ ! -d "$output_dir" ]; then
	mkdir -p "$output_dir"
fi

if curl -s "https://raw.githubusercontent.com/shvedes/discord-gruvbox/refs/heads/main/gruvbox-dark.theme.css" -o "$output_file"; then
	echo "Done"
else
	echo "Something went wrong"
fi
