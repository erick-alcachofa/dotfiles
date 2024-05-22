rofi_command="rofi -theme ~/.config/rofi/power-menu.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
windows=" Windows"
shutdown="󰐥 Shutdown"
reboot="󰜉 Restart"
lock="󰌾 Lock"
suspend="󰤄 Sleep"
logout="󰍃 Logout"

options="$lock\n$suspend\n$logout\n$reboot\n$shutdown\n$windows"

chosen="$(echo -e "$options" | $rofi_command -p "Power Menu" -dmenu -selected-row 0)"

confirm_exit() {
    rofi -dmenu \
		 -i \
		 -no-fixed-num-lines \
		 -p "Are You Sure?   " \
         -theme ~/.config/rofi/confirm.rasi
}

msg() {
    notify-send "Unrecognized option"
}

case $chosen in
    $shutdown)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            systemctl poweroff
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
    $reboot)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            systemctl reboot
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
    $lock)
        TEXT='#ff9dfee6'
        BLANK='#00000000'
        CLEAR='#ffffff22'
        WRONG='#880000bb'
        DEFAULT='#ff9dfee6'
        VERIFYING='#ff9dfee6'
        
        sleep 1

        i3lock \
            --insidever-color=$CLEAR     \
            --ringver-color=$VERIFYING   \
            \
            --insidewrong-color=$CLEAR   \
            --ringwrong-color=$WRONG     \
            \
            --inside-color=$BLANK        \
            --ring-color=$DEFAULT        \
            --line-color=$BLANK          \
            --separator-color=$DEFAULT   \
            \
            --verif-color=$TEXT          \
            --wrong-color=$TEXT          \
            --time-color=$TEXT           \
            --date-color=$TEXT           \
            --layout-color=$TEXT         \
            --keyhl-color=$WRONG         \
            --bshl-color=$WRONG          \
            \
            --screen 1                   \
            --blur 1                     \
            --clock                      \
            --indicator                  \
            --time-str="%H:%M:%S"        \
            --date-str="%A, %Y-%m-%d"    \
            --keylayout 1
        ;;
    $suspend)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            systemctl suspend
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
    $logout)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            i3-msg exit
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
    $windows)
        ans=$(confirm_exit &)
        if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
            . ~/dotfiles/gui/scripts/reboot-to-windows.sh
        elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
            exit 0
        else
            msg
        fi
        ;;
esac
