#! /bin/bash
# Definir colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color (Restablecer color)
# Mostrar texto artístico
echo -e "-----------------------------------------------"
echo -e "${GREEN} ___  ___  ___  _    _ __ _  ___ "
echo -e "${GREEN}|_ _|| . || . || |  | / /| ||_ _|"
echo -e "${GREEN} | | | | || | || |_ |  \\ | | | | "
echo -e "${GREEN} |_| \`___'\`___'|___||_\\_\\|_| |_|"
echo -e "${NC}"              "${YELLOW}by.zamdev${NC}"
echo -e "-----------------------------------------------"

#pide el root solo una vez 
sudo -v

#esto es un bucle que mantiene el root y no vuelva  pedir pass
while true; do sudo -v; sleep 60; done &

#actualiza los repositorios 
echo -e "${YELLOW}Actualizando Repositorios${NC}"
sudo pacman -Syu --noconfirm

#instala utilidades base para mi entorno :V
echo -e "${YELLOW}Instalando utilidades base....${NC}"

sudo pacman -S --noconfirm picom udiskie rofi  feh  python-psutil lxappearance  base-devel rust baobab


#instala herrmientas del dia dia  :V
echo -e "${YELLOW}Instalando Herramientas del dia....${NC}"
sudo pacman -S --noconfirm  vlc firefox obsidian git unzip polybar code breeze obsidian leafpad cava

#instala paru repistorios AUR
echo -e "${YELLOW}Instalando paru Repositorios Aur....${NC}"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si 

echo -e "${YELLOW}Instalando Herramientas Aur....${NC}"
#instala herramientas de paru 
#nerd-fonts
paru -S --noconfirm  papirus-icon-theme  arc-gtk-theme rar 


echo -e "${YELLOW}Instalando repo de blackarch....${NC}"
sudo pacman-key --recv-keys 4345771566D76038C7FEB43863EC0ADBEA87E4E3
sudo pacman-key --lsign-key 63EC0ADBEA87E4E3
echo -e "\n[blackarch]\nServer = https://mirror.blackarch.org/blackarch/\$repo/os/\$arch" | sudo tee -a /etc/pacman.conf
sudo pacman -Sy

echo -e "${YELLOW}Instalando rofi....${NC}"
git clone https://github.com/adi1090x/rofi.git
cd rofi 
chmod +x setup.sh
./setup.sh

echo -e "${YELLOW}Copiando carpetas locales....${NC}"

rm -rf /home/zamy/.config
cp /home/zamy/toolkit/local/.config  /home/zamy
sudo cp /home/zamy/toolkit/local/default/grub  /etc/default/


reboot




echo -e "${YELLOW}reniciando pc ....${NC}"
# Finalizar el mantenimiento de sudo
kill $!
#reboot 
