#!/bin/bash

# Soubor, kam se aliasy ukládají
ALIAS_FILE="$HOME/.bash_aliases"

# Kontrola, zda je soubor aliasů vytvořen
if [ ! -f "$ALIAS_FILE" ]; then
    touch "$ALIAS_FILE"
    echo "# Alias file created by dynamic_alias.sh" >> "$ALIAS_FILE"
fi

# Funkce pro přidání aliasu
add_alias() {
    local name="$1"
    local command="$2"

    # Kontrola, zda je alias již definován
    if grep -q "alias $name=" "$ALIAS_FILE"; then
        echo "Alias '$name' already exists. Do you want to overwrite it? (y/n)"
        read -r overwrite
        if [[ "$overwrite" != "y" ]]; then
            echo "Alias '$name' was not overwritten."
            return
        fi
    fi

    # Přidání aliasu do souboru
    echo "alias $name='$command'" >> "$ALIAS_FILE"
    echo "Alias '$name' added successfully!"
}

# Hlavní logika
echo "Welcome to Dynamic Alias Manager!"
echo "Enter the alias name:"
read -r alias_name

echo "Enter the command for the alias:"
read -r alias_command

# Přidání aliasu
add_alias "$alias_name" "$alias_command"

# Načtení aliasů do aktuálního shellu
if [[ -n "$BASH_VERSION" ]]; then
    source "$ALIAS_FILE"
elif [[ -n "$ZSH_VERSION" ]]; then
    source "$HOME/.zshrc"
fi

echo "Alias '$alias_name' is ready to use in your terminal!"

exit 0
