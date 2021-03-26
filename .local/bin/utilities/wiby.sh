#!/usr/bin/bash

ARR=()
ARR+=("Open Random Website")
ARR+=("Search specific")
#menuchoice=$(printf '%s\n' "${ARR[@]}" | rofi -dmenu -config /home/jon/Downloads/rofiwork/rofi/1080p/launchers/ribbon/ribbon_left.rasi -p "Wiby Search:    ")
rofitheme=(~/.config/rofi/themes/wiby.rasi)
menuchoice=$(printf '%s\n' "${ARR[@]}" | rofi -dmenu -config $rofitheme -p "Wiby Search:    ")
browser=${BROWSER:-brave}

# Search Random Website, open in browser.
if [ "$menuchoice" = "Open Random Website" ]; then
	choiceWord=$($browser "https://wiby.me/surprise/")
fi

# TODO: Search for Specific Website, display list of items
if [ "$menuchoice" = "Search specific" ]; then
choiceWord=$(printf "" | rofi -dmenu -config /usr/share/rofi/themes/nord2.rasi -p "Enter query: ")
CHOICE=$($browser "https://wiby.me/json/?q=$choiceWord")

#CHOICEtime=$(printf " $(echo $CHOICE)"  | rofi -dmenu -config /usr/share/rofi/themes/nord2.rasi -p "$choiceWord: ")
exit 0
fi


#choice=$( rofi -dmenu -config /usr/share/rofi/themes/dmenu2.rasi -p "Search     :     ")
#choice=$( rofi -dmenu -config /usr/share/rofi/themes/dmenu2.rasi -p "View Random Website?")
