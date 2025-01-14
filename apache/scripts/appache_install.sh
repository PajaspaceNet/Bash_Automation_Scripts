#!/bin/bash
# Skript pro instalaci Apache
echo "Instaluji Apache..."
sudo apt update && sudo apt install -y apache2
echo "Spouštím Apache..."
sudo systemctl start apache2
echo "Apache běží na:"
hostname -I | awk '{print $1}'
