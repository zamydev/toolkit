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

sudo pacman -S --noconfirm qtile rofi alacritty picom udiskie  feh neofetch  python-psutil lxappearance lightdm-gtk-greeter-settings  breeze base-devel rust

#instala herrmientas del dia dia  :V
echo -e "${YELLOW}Instalando Herramientas del dia....${NC}"
sudo pacman -S --noconfirm nitrogen vlc unzip ranger nemo flameshot firefox obsidian  git ksnip yazi polybar  

#instala paru repistorios AUR
echo -e "${YELLOW}Instalando paru Repositorios Aur....${NC}"
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

echo -e "${YELLOW}Instalando Herramientas Aur....${NC}"
#instala herramientas de paru 
paru -S papirus-icon-theme nerd-fonts arc-gtk-theme sublime-text-4   --noconfirm 

echo -e "${YELLOW}Instalando rofi....${NC}"
git clone https://github.com/adi1090x/rofi.git

echo -e "${YELLOW}Copiando archivos de configuracion locales ....${NC}"

rm -rf ~/.config
cp -r ~/toolkit/local/.config  ~/
cp -r ~/toolkit/local/wallaper  ~/

echo -e "${YELLOW}reniciando pc ....${NC}"
# Finalizar el mantenimiento de sudo
kill $!
reboot 
