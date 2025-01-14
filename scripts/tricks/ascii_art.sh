#!/bin/bash

# Kontrola, zda je figlet nainstalovaný
if ! command -v figlet &> /dev/null; then
    echo "Error: figlet is not installed. Install 'sudo yum install figlet' (Red Hat/CentOS)."
    exit 1
fi

# Kontrola vstupu uživatele
if [ -z "$1" ]; then
    echo "Usage: $0 'Your Text Here'"
    exit 1
fi

# Uloží zadaný text do proměnné
INPUT_TEXT="$1"

# Vytvoří ASCII art pomocí figlet
figlet "$INPUT_TEXT"

exit 0
