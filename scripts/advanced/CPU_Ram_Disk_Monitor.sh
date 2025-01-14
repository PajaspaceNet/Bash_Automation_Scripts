#!/bin/bash
# system_monitor.sh
# Skript pro monitorování CPU, RAM a disku
# Výstupy se ukládají do logu.

# Cesta k logovacímu souboru
LOG_FILE="/var/log/system_monitor.log"

# Funkce: Zobrazení hlavičky
print_header() {
    echo "-----------------------------------"
    echo " SYSTEM MONITORING - $(date)"
    echo "-----------------------------------"
}

# Funkce: Výpis aktuálního využití CPU
print_cpu_usage() {
    echo "Aktuální využití CPU:"
    top -bn1 | grep "Cpu(s)" | awk '{print "  Využití: " $2 "% (uživatelské), " $4 "% (systémové), " $8 "% (nečinné)"}'
}

# Funkce: Výpis nejvíce zatěžujících procesů
print_top_processes() {
    echo "Top 5 nejvíce zatěžujících procesů:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | awk 'NR==1{print $0} NR>1{print "  " $0}'
}

# Funkce: Výpis využití RAM
print_ram_usage() {
    echo "Využití RAM:"
    free -h | awk '/^Mem/ {printf "  Použito: %s, Volno: %s, Celkem: %s\n", $3, $4, $2}'
}

# Funkce: Výpis využití disku
print_disk_usage() {
    echo "Využití disku:"
    df -h --total | grep "total" | awk '{printf "  Použito: %s, Volno: %s, Celkem: %s\n", $3, $4, $2}'
}

# Funkce: Ukládání do logu
log_system_usage() {
    echo "$(date): CPU=$(top -bn1 | grep 'Cpu(s)' | awk '{print $2 "%"}'), RAM=$(free -h | awk '/^Mem/ {print $3 "/" $2}'), DISK=$(df -h --total | grep "total" | awk '{print $3 "/" $2}')" >> "$LOG_FILE"
}

# Hlavní část skriptu
print_header
print_cpu_usage
print_top_processes
print_ram_usage
print_disk_usage

# Uložení do logu
log_system_usage
echo -e "\nVýstup uložen do logu: $LOG_FILE"

# Upozornění na nízké zdroje
cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
ram_free=$(free -h | awk '/^Mem/ {print $4}')
disk_free=$(df -h --total | grep "total" | awk '{print $4}')

if (( $(echo "$cpu_idle < 20.0" | bc -l) )); then
    echo -e "\n  UPOZORNĚNÍ: CPU HODNĚ zatíženo! Nečinné procento: $cpu_idle% "
fi

if [[ "$ram_free" == *M ]]; then
    echo -e "\n  UPOZORNĚNÍ: Kriticky málo RAM! Dostupné: $ram_free "
fi

if [[ "$disk_free" == *G && "${disk_free%G}" -lt 10 ]]; then
    echo -e "\n  UPOZORNĚNÍ: Málo místo na disku! Dostupné: $disk_free "
fi
