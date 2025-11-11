read -p "Hostname wird auf T570 festgelegt... "
echo "T570" > .bashrc

read -p "Nutzer mit wheel-Gruppenmitgliedschaft wird hinzugefügt..."
useradd -mG wheel lenader
echo "Passwort festlegen... "
passwd lenader

 read -p "git wird konfiguriert auf Benjamin Sommer, benjamin.sommer.13@icloud.com"
git config --system user.name "Benjamin Sommer"
git config --system user.email "Benjamin Sommer"

read -p "Authentifikation Github... "
gh auth

read -p "Sudoers bearbeiten (wheel-Gruppe!)... "
visudo

read -p "Systemkonfiguration bearbeiten... "
hx /etc/rc.conf

read -p "Abgeschlossen! TODO: Gewünschte Services aktivieren, Kernel-Loader konfigurieren, DNS"


