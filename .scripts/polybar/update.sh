function check_updates()
{
if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qu --aur | wc -l); then
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -gt 0 ]; then
    echo "$updates" > $HOME/.updates
else
    echo "" > $HOME/.updates
fi
sleep 600
}

case "$1" in
	"update")
		$TERMINAL -e $HOME/.scripts/polybar/update.sh install;;
	"install")
		sudo pacman -Syu && trizen -Syu --aur && echo "" > $HOME/.updates;;
	*)
		check_updates &
		while :
		do
			cat $HOME/.updates;
			sleep 5
		done;;
esac
