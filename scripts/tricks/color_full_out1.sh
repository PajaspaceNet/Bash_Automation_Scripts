#!/bin/bash
# colorful_output.sh
# Skript demonstruje, jak používat barevný výstup v Bash.

# Definice barevných kódů
RED='\033[0;31m'        # Červená
GREEN='\033[0;32m'      # Zelená
YELLOW='\033[1;33m'     # Žlutá
BLUE='\033[0;34m'       # Modrá
CYAN='\033[0;36m'       # Azurová
RESET='\033[0m'         # Reset na výchozí barvu

# Funkce pro barevný výstup
print_red() {
    echo -e "${RED}$1${RESET}"
}

print_green() {
    echo -e "${GREEN}$1${RESET}"
}

print_yellow() {
    echo -e "${YELLOW}$1${RESET}"
}

print_blue() {
    echo -e "${BLUE}$1${RESET}"
}

print_cyan() {
    echo -e "${CYAN}$1${RESET}"
}

# Hlavní část skriptu
echo "Zobrazuji barevný výstup:"
print_red "Toto je červený text – upozornění nebo chyba."
print_green "Toto je zelený text – úspěch nebo OK."
print_yellow "Toto je žlutý text – varování nebo poznámka."
print_blue "Toto je modrý text – informace nebo neutrální zpráva."
print_cyan "Toto je azurový text – další neutrální možnost."

# Ukázka barevného výstupu bez funkcí
echo -e "${RED}Tento text je červený bez použití funkce.${RESET}"

