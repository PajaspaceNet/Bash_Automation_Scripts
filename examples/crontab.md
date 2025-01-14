```markdown
# Cron: Plánovač úloh

Cron je plánovač úloh, který umožňuje spouštění skriptů v pravidelných intervalech nebo v určených časech.

## Příklad: Naplánování skriptu
```
1. **Otevřete crontab**:
   ```
   crontab -e
   ```

2. **Přidejte řádek pro spuštění skriptu** (např. každý den v 5:00):
   ```
   0 5 * * * /usr/local/bin/muj-skript.sh
   ```

3. **Uložte a zavřete editor**:
   - Skript se nyní automaticky spustí každý den v 5:00.
```
