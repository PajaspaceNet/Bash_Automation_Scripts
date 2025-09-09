## 🔹 Red Hat Server – Rychlý checklist problémů

### 1️⃣ Systém a aktualizace

* [ ] SELinux blokuje služby → `sestatus`, `audit2allow`.
* [ ] Yum/DNF konflikty nebo chybějící balíčky → `yum check`, `dnf check`.
* [ ] Kernel nebo bezpečnostní aktualizace chybí → `yum update`, `dnf update`.

### 2️⃣ Síť a konektivita

* [ ] Firewall blokuje port → `firewall-cmd --list-all`.
* [ ] Nesprávná IP/DNS/route → `ip a`, `ping`, `nslookup`.
* [ ] Služby nedostupné zvenčí → test portu `telnet <host> <port>` nebo `nc`.

### 3️⃣ Uživatelské účty a oprávnění

* [ ] SSH přístup nefunguje → kontrola `/etc/ssh/sshd_config`, klíčů.
* [ ] Nesprávná práva k souborům → `ls -l`, `chmod`, `chown`.
* [ ] Špatná konfigurace skupin nebo uživatelů → `groups <user>`, `/etc/passwd`.

### 4️⃣ Služby a démony

* [ ] Služba nefunguje → `systemctl status <service>`.
* [ ] Chyby v logu → `journalctl -u <service>` nebo `/var/log/messages`.
* [ ] Restart po aktualizaci selhal → `systemctl restart <service>`.

### 5️⃣ Disky a úložiště

* [ ] Plné disky → `df -h`, `du -sh /*`.
* [ ] Chybějící inode → `df -i`.
* [ ] NFS nebo LVM problémy → `mount`, `lvdisplay`, `pvdisplay`.

### 6️⃣ Performance / Monitoring

* [ ] Přetížení CPU → `top`, `htop`.
* [ ] Přetížení RAM → `free -h`, `vmstat`.
* [ ] Disk I/O problémy → `iotop`, `iostat`.
* [ ] Zavěšené procesy → `ps aux | grep <process>`, `kill`.

### 7️⃣ Bezpečnost

* [ ] Neaktualizované balíčky → `yum check-update`.
* [ ] Selhání auditů → `auditctl`, `ausearch`.
* [ ] Problémy s SSH nebo TLS certifikáty → `ssh -v`, `openssl s_client -connect`.

---

