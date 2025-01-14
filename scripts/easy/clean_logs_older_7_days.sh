#!/bin/bash

# Adresář, ve kterém se mají soubory mazat
directory="/path/to/directory"

# Počet dnů, po kterých jsou soubory považovány za staré
days="7"

# Mazání souborů starších než určitý počet dnů
find "$directory" -type f -mtime +$days -exec rm {} \;
