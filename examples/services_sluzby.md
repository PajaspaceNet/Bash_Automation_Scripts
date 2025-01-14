
---
---
```markdown
# Vytvoření Bash skriptu a systemd služby

Tento návod vám ukáže, jak vytvořit jednoduchý Bash skript a spustit ho jako systémovou službu pomocí `systemd`.

---

## 1️⃣ Vytvoření skriptu

1. **Vytvořte soubor skriptu:**
   ```
 ```
   sudo nano /usr/local/bin/muj-skript.sh
   ```

2. **Do souboru vložte následující kód:**
   ```
   #!/bin/bash
   echo "Skript byl spuštěn!" >> /var/log/muj-skript.log
   ```

3. **Ujistěte se, že skript má správná oprávnění:**
   ```
   sudo chmod +x /usr/local/bin/muj-skript.sh
   ```

---

## 2️⃣ Vytvoření systemd služby

1. **Vytvořte soubor služby:**
   ```
   sudo nano /etc/systemd/system/muj-skript.service
   ```

2. **Do souboru vložte následující konfiguraci:**
   ```
   [Unit]
   Description=Moje automatická služba

   [Service]
   ExecStart=/usr/local/bin/muj-skript.sh

   [Install]
   WantedBy=multi-user.target
   ```

3. **Načtěte změny a povolte službu:**
   ```
   sudo systemctl daemon-reload
   sudo systemctl enable muj-skript.service
   ```

---

## 3️⃣ Otestování služby

1. **Restartujte systém, aby se služba automaticky spustila:**
   ```bash
   sudo reboot
   ```

2. **Zkontrolujte logy, abyste ověřili, že skript běžel:**
   ```bash
   cat /var/log/muj-skript.log
   ```

---

## 🛠️ Dulezite

- **Logování:** Ve skriptu se loguje do souboru `/var/log/muj-skript.log`. Ujistěte se, že tento soubor je zapisovatelný.
- **Oprávnění:** Skript musí mít spustitelná oprávnění, a cesta k souboru musí být správná.
- **Debugging:** Pokud něco nefunguje, zkontrolujte stav služby pomocí:
  ```
  sudo systemctl status muj-skript.service
  ```
- **Změny ve službě:** Pokud upravíte službu, nezapomeňte znovu načíst její konfiguraci:
  ```
  sudo systemctl daemon-reload
  ```




