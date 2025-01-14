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
  
Zde je obecná tabulka pro plánování úloh pomocí Cronu, včetně tipů a "špeků". Uloženo ve formátu Markdown (`cron_cheatsheet.md`):

```markdown
# Cron Cheatsheet 📅

 obecna tabulku pro plánování úloh, syntaxi, příklady a několik užitečných tipů.

---


```
![cron](https://github.com/user-attachments/assets/8c63ca91-9906-463d-beed-ac6ae84b48c1)

---

## Obecná Tabulka (Příklady)

| Časový výraz      | Popis                                   |
|-------------------|-----------------------------------------|
| `* * * * *`       | Spustí každou minutu                   |
| `0 * * * *`       | Spustí každou hodinu                   |
| `0 0 * * *`       | Spustí denně o půlnoci                 |
| `0 8 * * 1-5`     | Spustí v 8:00 od pondělí do pátku      |
| `*/5 * * * *`     | Spustí každých 5 minut                 |
| `0 0 1 * *`       | Spustí první den v měsíci o půlnoci    |
| `30 2 * * 0`      | Spustí každou neděli ve 2:30 ráno      |
| `15 14 1 * *`     | Spustí 1. den v měsíci ve 14:15        |
| `0 0 1 1 *`       | Spustí 1. ledna každého roku o půlnoci |

---

## Speciální Hodnoty

| Výraz    | Význam                               |
|----------|---------------------------------------|
| `@reboot`| Spustí po restartu systému           |
| `@yearly`| Spustí jednou ročně (`0 0 1 1 *`)     |
| `@monthly`| Spustí jednou měsíčně (`0 0 1 * *`)  |
| `@weekly`| Spustí jednou týdně (`0 0 * * 0`)     |
| `@daily` | Spustí denně (`0 0 * * *`)            |
| `@hourly`| Spustí každou hodinu (`0 * * * *`)    |

---

## Speciální "špeky"

### 1. **Redirect výstupu do souboru**
Zachyťte výstup Cronu do logu:
```bash
0 3 * * * /path/to/command >> /var/log/cron.log 2>&1
```

### 2. **Spuštění více příkazů**
Použijte středník `;` nebo logický operátor `&&`:
```bash
0 5 * * * /path/to/command1 && /path/to/command2
```

### 3. **Náhodné zpoždění (delay)**
Použijte `sleep` k náhodnému zpoždění:
```bash
0 * * * * sleep $((RANDOM % 300)) && /path/to/command
```

### 4. **Vyloučení určitých dnů nebo hodin**
Například každý den kromě neděle:
```bash
0 8 * * 1-6 /path/to/command
```

### 5. **Použití prostředí Cronu**
Definujte proměnné prostředí přímo v Crontabu:
```bash
MAILTO="admin@example.com"
PATH="/usr/local/bin:/usr/bin:/bin"
0 7 * * * /path/to/command
```

### 6. **Debugging Cronu**
- Zkontrolujte Cron log: `/var/log/cron` nebo `/var/log/syslog`.
- Otestujte příkazy manuálně, např.:
  ```bash
  echo "$(date): Spouštím příkaz" >> /tmp/debug.log
  ```

---

## Užitečné příklady

### Automatické zálohy
Každý den v 2:00:
```bash
0 2 * * * tar -czf /backup/$(date +\%Y\%m\%d).tar.gz /important_data
```

### Vyčištění starých souborů
Smaže soubory starší než 7 dní každou neděli ve 3:00:
```bash
0 3 * * 0 find /tmp -type f -mtime +7 -exec rm {} \;
```

### Kontrola webové stránky
Spustí kontrolu dostupnosti každých 10 minut:
```bash
*/10 * * * * curl -Is http://example.com | head -n 1
```

---


---

.
```
```
