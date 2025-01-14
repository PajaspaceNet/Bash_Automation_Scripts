# Bash_Automation_Scrpits
Bash skripty pro automatizaci běžných úkolů. Vhodné pro začátečníky i pokročilé uživatele Bash

...welcome ... vitejte ... :-) </br>
**Bash Automation Scripts** je kolekce skriptů vytvořených pro automatizaci každodenních úkolů. Skripty jsou rozděleny podle obtížnosti na:
- **Lehké skripty:** Jednoduché úlohy vhodné pro začátečníky.
- **Těžké skripty:** Pokročilé úkoly, které vyžadují složitější logiku nebo práci s API.
- **Vychytávky:** Speciální skripty nebo triky, které zefektivní práci a přidají trochu zábavy.

Projekt je ideální pro každého, kdo chce začít s Bash scripty nebo hledá inspiraci pro vlastní automatizaci.

---

## 📂 Struktura projektu

```
Bash_Automation_Scripts/
├── easy/                # Lehké skripty
│   ├── backup.sh        # Zálohování složky
│   ├── clean_logs.sh    # Čištění starých logů
│   ├── ...
├── advanced/            # Pokročilé skripty
│   ├── analyze_logs.sh  # Analýza logů
│   ├── api_fetch.sh     # Práce s API
│   ├── ...
├── tricks/              # Různé vychytávky
│   ├── colorful_output.sh  # Barevný výstup v terminálu
│   ├── dynamic_alias.sh    # Dynamické aliasy
│   ├── ...
├── examples/            # Ukázky použití (cron, systemd)
│   ├── cron-examples.md    # Ukázky pro cron
│   ├── systemd-example.service  # Ukázka služby
│   ├── ...
├── README.md            # Dokumentace projektu
```



## 🚀 Jak začít

1. **Naklonuj tento repozitář:**
   ```
   git clone https://github.com/tvoje-jmeno/Bash_Automation_Scripts.git
   cd Bash_Automation_Scripts
   ```

2. **Spusť první skript:**
   Přidej spustitelné oprávnění a spusť skript:
 
   ```
   chmod +x easy/backup.sh
   ./easy/backup.sh /zdroj /cíl
   ```

3. **Prozkoumej další skripty:**
   Vyzkoušej různé skripty v adresářích `easy`, `advanced` nebo `tricks`.

---

## 🛠️ Obsah skriptů

### Lehké skripty (`easy/`)
Jednoduché úkoly, které lze snadno přizpůsobit:
- **`backup.sh`:** Zálohování složek.
- **`clean_logs.sh`:** Odstranění souborů starších než X dní.
- **`rename_files.sh`:** Automatické přejmenování souborů podle šablony.

### Těžké skripty (`advanced/`)
Složitější úlohy s větší přidanou hodnotou:
- **`analyze_logs.sh`:** Filtruje logy podle zadaných parametrů.
- **`api_fetch.sh`:** Načítá data z API a ukládá je do souboru.
- **`system_monitor.sh`:** Sleduje stav systému (CPU, RAM, disk) a generuje report.

### Vychytávky (`tricks/`)
Tipy a triky pro efektivní práci:
- **`colorful_output.sh`:** Přidává barevný výstup do Bash skriptů.
- **`generate_ascii_art.sh`:** Generuje ASCII art pro zadaný text.
- **`dynamic_alias.sh`:** Dynamicky přidává aliasy pro rychlé příkazy.

---

## 📖 Příklady použití -  `examples/`  

### Cron úlohy (`cron-examples.md`)
Některé skripty lze snadno naplánovat pomocí cron. Například:

- **Spuštění zálohy každý den ve 3 ráno:**
  ```bash
  0 3 * * * /cesta/k/skriptum/easy/backup.sh /zdroj /cíl
  ```

- **Mazání logů starších než 7 dní každý týden:**
  ```bash
  0 0 * * 7 /cesta/k/skriptum/easy/clean_logs.sh /cesta/k/logum
  ```

### Systemd služby (`systemd-example.service`)
Pro skripty, které běží nepřetržitě nebo se spouští při startu systému:

- Ukázkový soubor `systemd` služby:
  ```ini
  [Unit]
  Description=System Monitor Service
  After=network.target

  [Service]
  ExecStart=/cesta/k/skriptum/advanced/system_monitor.sh
  Restart=always

  [Install]
  WantedBy=multi-user.target
  ```

  Aktivace služby:
  ```bash
  sudo systemctl enable systemd-example.service
  sudo systemctl start systemd-example.service
  ```

---

## 📜 Licence
Tento projekt je licencován pod licencí [MIT](LICENSE). Můžeš ho volně používat, upravovat a sdílet.

---



![Bash Version](https://img.shields.io/badge/Bash-%3E=4.0-blue)
