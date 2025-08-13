#!/bin/bash

# Detect shell profile file
if [ -n "$ZSH_VERSION" ]; then
    PROFILE_FILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    PROFILE_FILE="$HOME/.bashrc"
else
    PROFILE_FILE="$HOME/.profile"
fi

SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/welcome.py"

# Add the python command to the profile file if not already present
if ! grep -Fq "$SCRIPT_PATH" "$PROFILE_FILE"; then
    echo "python3 \"$SCRIPT_PATH\"" >> "$PROFILE_FILE"
    echo "Added welcome message script to $PROFILE_FILE"
else
    echo "Welcome message script already installed in $PROFILE_FILE"
fi

echo "Installation complete! Restart your terminal to see your welcome message."
