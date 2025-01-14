#!/bin/bash

# Cesta k log souboru
LOG_FILE="server.log"

# Kontrola, zda log soubor existuje
if [[ ! -f "$LOG_FILE" ]]; then
  echo "Log soubor '$LOG_FILE' neexistuje!"
  exit 1
fi

# 1. Celkový počet řádků v logu
TOTAL_LINES=$(wc -l < "$LOG_FILE")
echo "Celkový počet řádků v logu: $TOTAL_LINES"

# 2. Počet chybových zpráv (předpokládáme, že chyby obsahují 'ERROR')
ERROR_COUNT=$(grep -i "ERROR" "$LOG_FILE" | wc -l)
echo "Počet chybových zpráv (ERROR): $ERROR_COUNT"

# 3. Nejčastější typy chyb
echo "Nejčastější typy chyb:"
grep -i "ERROR" "$LOG_FILE" | awk -F ':' '{print $2}' | sort | uniq -c | sort -rn | head -10

# 4. Počet varování (předpokládáme, že varování obsahují 'WARNING')
WARNING_COUNT=$(grep -i "WARNING" "$LOG_FILE" | wc -l)
echo "Počet varování (WARNING): $WARNING_COUNT"

# 5. Statistiky podle datumu (předpokládáme formát 'YYYY-MM-DD' v prvním sloupci)
echo "Počet zpráv podle datumu:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -rn | head -10

# 6. Hledání specifického klíčového slova (uživatelský vstup)
read -p "Zadejte klíčové slovo k vyhledání v logu: " KEYWORD
if [[ -n "$KEYWORD" ]]; then
  KEYWORD_COUNT=$(grep -i "$KEYWORD" "$LOG_FILE" | wc -l)
  echo "Počet výskytů klíčového slova '$KEYWORD': $KEYWORD_COUNT"
  echo "Prvních 10 řádků s klíčovým slovem '$KEYWORD':"
  grep -i "$KEYWORD" "$LOG_FILE" | head -10
else
  echo "Nebyla zadána žádná klíčová slova."
fi
