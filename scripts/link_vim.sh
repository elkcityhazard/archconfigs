#!/usr/bin/env bash

source="$HOME/Dotfiles/vim"
target="$HOME/.config/vim"

# Remove old link if exists
[[ -L "$target" ]] && rm "$target"

# Create symlink to entire directory
ln -s "$source" "$target"
echo "✓ Linked $source → $target"