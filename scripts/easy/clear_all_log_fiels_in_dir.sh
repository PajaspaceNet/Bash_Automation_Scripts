#!/bin/bash

# Adresář, ve kterém se mají soubory mazat
directory="/path/to/directory"

# Název souborů, které mají být smazány
file_pattern="*.log"

# Mazání souborů podle jejich názvu
find "$directory" -type f -name "$file_pattern" -exec rm {} \;
