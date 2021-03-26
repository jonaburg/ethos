#!/usr/bin/env bash

ARR=()
ARR+=("")
#telegram"
ARR+=("")
#youtube
ARR+=("")
#github
rofitheme=(~/.config/rofi/themes/quicklinks.rasi)
menuchoice=$(printf '%s\n' "${ARR[@]}" | rofi -dmenu -config $rofitheme -p ":    ")
rofi_command="rofi -theme ~/.config/rofi/themes/quicklinks.rasi"

# Browser
if [[ -f /sbin/brave ]]; then
	app="brave"
elif [[ -f /usr/bin/firefox ]]; then
	app="firefox"
elif [[ -f /usr/bin/chromium ]]; then
	app="chromium"
elif [[ -f /usr/bin/midori ]]; then
	app="midori"
else
	msg "No suitable web browser found!"
	exit 1
fi

if [ "$menuchoice" = "" ]; then
telegram-desktop
exit 0
fi
if [ "$menuchoice" = "" ]; then
$app https://youtube.com
exit 0
fi
if [ "$menuchoice" = "" ]; then
$app https://github.com
exit 0
fi

#chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  $app" -dmenu -selected-column 0)"
#case $chosen in
#    $google)
#        $app https://www.google.com &
#        ;;
#    $facebook)
#        $app https://www.facebook.com &
#        ;;
#    $youtube)
#        $app https://www.youtube.com &
#        ;;
#    $wiby)
#        $app https://www.wiby.org &
#        ;;
#esac


