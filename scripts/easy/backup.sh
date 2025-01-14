#!/bin/bash

# Adresář pro zálohy
backup_dir="/path/to/backup"

# Adresář, který se má zálohovat
source_dir="/path/to/source"

# Název souboru zálohy
backup_file="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Vytvoření adresáře pro zálohy, pokud neexistuje
mkdir -p "$backup_dir"

# Vytvoření archivu se zálohou
tar -czf "$backup_dir/$backup_file" "$source_dir"

echo "Záloha byla vytvořena: $backup_dir/$backup_file"
