#!/bin/bash
#dost tezko to lze napsat na konkretni api , na obecnem navodu ... :-))
# toto je navrh obecneho postupu jak by se to mohlo taky resit

# URL API endpointu
API_URL="https://api.example.com/data"

# API klíč nebo token (pokud je potřeba autentizace)
API_KEY="your_api_key_here"

# Cílový soubor pro uložení dat
OUTPUT_FILE="response.json"

# Volání API pomocí curl
curl -H "Authorization: Bearer $API_KEY" \
     -H "Content-Type: application/json" \
     -X GET "$API_URL" \
     -o "$OUTPUT_FILE"

# Kontrola úspěšnosti
if [ $? -eq 0 ]; then
    echo "Data successfully fetched and saved to $OUTPUT_FILE"
else
    echo "Failed to fetch data from API"
fi
