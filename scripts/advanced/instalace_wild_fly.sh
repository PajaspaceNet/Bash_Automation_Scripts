#!/bin/bash

# ----------------------------
# Konfigurace
# ----------------------------
NEWUSER="novyuser"                 # jméno uživatele, pod kterým poběží WildFly
WILDFLY_VERSION="35.0.1.Final"     # verze WildFly
INSTALL_DIR="/opt/wildfly"         # adresář pro WildFly

# ----------------------------
# Instalace OpenJDK 17
# ----------------------------
echo "Instaluji OpenJDK 17..."
sudo dnf install -y java-17-openjdk java-17-openjdk-devel

# Kontrola instalace
java -version

# ----------------------------
# Vytvoření adresáře pro WildFly
# ----------------------------
echo "Vytvářím adresář pro WildFly..."
sudo mkdir -p $INSTALL_DIR
sudo chown $NEWUSER:$NEWUSER $INSTALL_DIR
cd $INSTALL_DIR

# ----------------------------
# Stažení a rozbalení WildFly
# ----------------------------
echo "Stahuji WildFly $WILDFLY_VERSION..."
wget https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz
tar xvf wildfly-$WILDFLY_VERSION.tar.gz
mv wildfly-$WILDFLY_VERSION/* .
rm -rf wildfly-$WILDFLY_VERSION*
rm -f wildfly-$WILDFLY_VERSION.tar.gz

# ----------------------------
# Vytvoření systemd služby
# ----------------------------
echo "Vytvářím systemd službu pro WildFly..."
sudo tee /etc/systemd/system/wildfly.service > /dev/null <<EOL
[Unit]
Description=WildFly Application Server
After=network.target

[Service]
Type=simple
User=$NEWUSER
Group=$NEWUSER
ExecStart=$INSTALL_DIR/bin/standalone.sh -b=0.0.0.0
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOL

# ----------------------------
# Načtení a spuštění služby
# ----------------------------
echo "Spouštím WildFly službu..."
sudo systemctl daemon-reload
sudo systemctl enable wildfly
sudo systemctl start wildfly
sudo systemctl status wildfly

# ----------------------------
# Přidání administrátora
# ----------------------------
echo "Přidej administrátora do WildFly:"
echo "Spusť $INSTALL_DIR/bin/add-user.sh a vytvoř Management User"
echo "Admin konzole bude dostupná na http://server_ip:9990"
echo "Web server běží na http://server_ip:8080"
