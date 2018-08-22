#!/bin/bash
case $BLOCK_BUTTON in
    1) $TERMINAL -e sudo pacman -Syu && pacman -Qu | wc -l > /home/void/.scripts/.pacupgrade && pkill -RTMIN+8 i3blocks ;;
esac

pacman -Qu | grep -v ignored | wc -l | sed -e '/^0$/d' | sed -e "/^$/d"
