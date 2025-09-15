#!/bin/bash
# nastavi noveho uzivatele , prideli mu root prava , a rootovi se zakaze hlasit prez SSH
# Název nového uživatele
NEWUSER="novyuser"

# Vytvoření uživatele a nastavení hesla
sudo adduser $NEWUSER
echo "Zadej heslo pro $NEWUSER:"
sudo passwd $NEWUSER

# Přidání uživatele do sudo skupiny (wheel)
sudo usermod -aG wheel $NEWUSER

# Zakázání SSH root login
sudo sed -i 's/^#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

echo "Hotovo! Uživateli $NEWUSER jsou přidělena sudo práva a root login přes SSH je zakázán."
echo "Nyní se můžeš přihlásit přes: ssh $NEWUSER@server_ip"
