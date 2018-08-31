#!/bin/sh

volume_print() {

    if pacmd list-sinks | grep active | head -n 1 | grep -q speaker; then
        icon=""
    elif pacmd list-sinks | grep active | head -n 1 | grep -q headphones; then
        icon=""
    else
        icon=""
    fi

    muted=$(pamixer --get-mute)

    if [ "$muted" = true ]; then
#        echo " --"
        echo ""
    else
        echo "$icon $(pamixer --get-volume)"
    fi
}

volume_print

pactl subscribe | while read -r event; do
    if echo "$event" | grep -q "sink"; then
        volume_print
    fi
done
