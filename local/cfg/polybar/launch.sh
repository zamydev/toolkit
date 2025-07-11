#!/usr/bin/env bash

# Ruta del tema
dir="$HOME/.config/polybar/forest/"

# Cierra cualquier instancia existente de Polybar
killall -q polybar

# Espera a que todas las instancias se cierren
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanza Polybar con el tema "forest"
polybar -q main -c "$dir/config.ini" &
