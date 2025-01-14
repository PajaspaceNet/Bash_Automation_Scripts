#!/bin/bash

echo "Kontrola domovských adresářů uživatelů z /etc/passwd"

# Projde všechny uživatelské záznamy v /etc/passwd
while IFS=: read -r username _ _ _ _ home_dir _; do
    # Filtruje běžné uživatele (UID >= 1000)
    if [ "$(id -u "$username" 2>/dev/null)" -ge 1000 ]; then
        if [ -d "$home_dir" ]; then
            # Kontrola .ssh a authorized_keys
            if [ -d "$home_dir/.ssh" ]; then
                if [ -f "$home_dir/.ssh/authorized_keys" ]; then
                    echo "Obsah authorized_keys pro uživatele ${username}:"
                    cat "$home_dir/.ssh/authorized_keys"
                    echo ""
                else
                    echo "Uživatel ${username} nemá soubor authorized_keys."
                fi
            else
                echo "Uživatel ${username} nemá adresář .ssh."
            fi
        else
            echo "Domovský adresář pro uživatele ${username} neexistuje."
        fi
    fi
done < /etc/passwd


