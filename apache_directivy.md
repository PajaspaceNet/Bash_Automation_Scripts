 **Stručný přehled nejdůležitějších direktiv Apache na Red Hat / RHEL**

---

## 🔹 Přehled direktiv Apache

| Sekce / Soubor                     | Direktiva                                      | Popis                                       | Příklad / Poznámka                         |
| ---------------------------------- | ---------------------------------------------- | ------------------------------------------- | ------------------------------------------ |
| `/etc/httpd/conf/httpd.conf`       | `Listen`                                       | Port, na kterém Apache naslouchá            | `Listen 80`                                |
| `/etc/httpd/conf/httpd.conf`       | `ServerRoot`                                   | Kořenový adresář Apache                     | `/etc/httpd`                               |
| `/etc/httpd/conf/httpd.conf`       | `User` / `Group`                               | Uživatel a skupina, pod kterými běží Apache | `User apache`, `Group apache`              |
| `/etc/httpd/conf/httpd.conf`       | `DocumentRoot`                                 | Kořenový adresář webu                       | `/var/www/html`                            |
| `/etc/httpd/conf/httpd.conf`       | `Timeout`                                      | Maximální čas pro spojení                   | `Timeout 60`                               |
| `/etc/httpd/conf/httpd.conf`       | `KeepAlive`                                    | Povolit persistentní spojení                | `KeepAlive On`                             |
| `/etc/httpd/conf.d/*.conf`         | `ServerName`                                   | Název serveru / domény                      | `ServerName www.example.com`               |
| `/etc/httpd/conf.d/*.conf`         | `ServerAlias`                                  | Alternativní domény                         | `ServerAlias example.org`                  |
| `/etc/httpd/conf.d/*.conf`         | `SSLCertificateFile` / `SSLCertificateKeyFile` | SSL certifikát a klíč                       | `/etc/pki/tls/certs/server.crt`            |
| `/etc/httpd/conf.modules.d/*.conf` | `LoadModule`                                   | Načtení modulu Apache                       | `LoadModule ssl_module modules/mod_ssl.so` |
| `/etc/httpd/conf.d/*.conf`         | `<VirtualHost>`                                | Definice virtuálního hosta                  | `<VirtualHost *:80> ... </VirtualHost>`    |
| `/var/log/httpd/`                  | `CustomLog` / `ErrorLog`                       | Cesty k logům                               | `ErrorLog /var/log/httpd/error_log`        |

---

### 🔹 Tipy pro práci s konfigurací

1. **Hledání konkrétní direktivy:**

```bash
grep -R "Timeout" /etc/httpd/
```

2. **Načtení nové konfigurace bez restartu:**

```bash
sudo systemctl reload httpd
```

3. **Restart Apache:**

```bash
sudo systemctl restart httpd
```

4. **Kontrola stavu služby:**

```bash
sudo systemctl status httpd
```

5. **Test konfigurace před restartem:**

```bash
apachectl configtest
```

* Upozorní tě na chyby v syntaxi.

---



---

### 1️⃣ Pokud generuješ Apache konfiguraci skriptem

* Ano, v takovém skriptu je vhodné **vytvářet `.conf` soubory**, kde použiješ `<` a `>` direktivy, např.:

```bash
cat <<EOF > /etc/httpd/conf.d/muj_web.conf
<VirtualHost *:80>
    ServerName www.example.com
    DocumentRoot /var/www/html/muj_web
    ErrorLog /var/log/httpd/muj_web_error.log
    CustomLog /var/log/httpd/muj_web_access.log combined
</VirtualHost>
EOF
```

* Tady `<<EOF ... EOF` je **here-document**, které umožní vložit multi-line text včetně `<VirtualHost>` přímo do souboru.

---

### 2️⃣ Co je důležité

* **Nepoužívej `<` mimo here-document** – Bash by to vyhodnotil jako přesměrování.
* V repozitáři se ukládají **šablony `.conf`** nebo **skripty, které je generují**, ne samotné běžící soubory na serveru.
* Pokud chceš mít flexibilní repozitář, můžeš mít **proměnné** pro doménu, cesty, porty:

```bash
DOMAIN="www.example.com"
DOCROOT="/var/www/html/muj_web"

cat <<EOF > /etc/httpd/conf.d/$DOMAIN.conf
<VirtualHost *:80>
    ServerName $DOMAIN
    DocumentRoot $DOCROOT
</VirtualHost>
EOF
```

---

### 🔹 Shrnutí

* `<` a `>` se **používají v Apache direktivách** (`<VirtualHost>`, `<Directory>`, `<IfModule>`).
* V Bash skriptech je nejlepší je vložit přes **here-document (`cat <<EOF ... EOF`)**, aby Bash správně zachoval syntax Apache.
* V repozitáři se ukládá **šablona nebo generující skript**, ne přímo aktivní konfigurace na serveru.

---



