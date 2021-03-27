#!/usr/bin/bash
###############################################################################
# Title: Wiby Rofi Search
# Author: Jon Burga
# Date: 2020.03.27
# Deps: rofi, rofi-blocks, curl.
###############################################################################
set -x

###############################################################################
# Variables
###############################################################################

ARR=()
ARR+=("Open Random Website")
ARR+=("Search specific")
theme=(~/.config/rofi/themes/wiby_solid.rasi)
menu_choice=$(printf '%s\n' "${ARR[@]}" | rofi -dmenu -config $theme -p "Wiby Search  :    ")
browser=${BROWSER:-brave}


###############################################################################
# Functions
#####################################################

process_wiby(){
link=$(cat /tmp/wibyout | jq .'[] | .URL + " > " + .Title' | rofi -dmenu -modi blocks -config ~/.config/rofi/themes/wiby_list.rasi -show blocks -p "Query Results:")
url=$(echo $link | awk -F">" {'print $1'} | awk -F'"' {'print $2'})
}
#

###############################################################################
# Search Random Website, open in browser.
#####################################################

if [ "$menu_choice" = "Open Random Website" ]; then
  choiceWord=$($browser "https://wiby.me/surprise/")
fi

###############################################################################
# Search for Specific Website, display list of items
###############################################################################

if [ "$menu_choice" = "Search specific" ]; then
  choiceWord=$(printf "" | rofi -dmenu -config /usr/share/rofi/themes/nord2.rasi -p "Enter query: ")
  CHOICE=$(curl https://wiby.me/json/?q=$choiceWord > /tmp/wibyout )
  process_wiby
  $browser "$url"
exit 0
fi
