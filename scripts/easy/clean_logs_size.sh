#!/bin/bash

# Adresář, ve kterém se mají soubory mazat
directory="/path/to/directory"

# Velikost souborů, které mají být smazány (v MB)
size="100"

# Mazání souborů větších než určitá velikost
find "$directory" -type f -size +${size}M -exec rm {} \;
