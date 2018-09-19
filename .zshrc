# env vars
export PATH="$PATH:$HOME/.scripts"
export EDITOR="vim"
export TERMINAL="urxvt"
#export BROWSER="firefox"
export BROWSER="chromium"
export ZSH="/home/void/.oh-my-zsh"
export MPD_HOST="127.0.0.1"
#export MPD_HOST="/tmp/mpd.sock"
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

# autostart i3 when logged in:
if [[ "$(tty)" = "/dev/tty1" ]]; then
        pgrep i3 || exec startx
fi

# Import colorscheme from wal
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
. "${HOME}/.cache/wal/colors.sh"
alias dmen='dmenu_run -nb "$color0" -nf "$color15" -sb "$color1" -sf "$color15"'

# command and completion settings
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"
#CASE_SENSITIVE="true"
#HYPHEN_INSENSITIVE="true"
#ENABLE_CORRECTION="true"
plugins=(git colored-man-pages colorize cp extract last-working-dir zsh-syntax-highlighting)
ZSH_THEME="sunrise"
source $ZSH/oh-my-zsh.sh
DEFAULT_USER="void"

# aliases
alias progs="pacman -Qett" # List all programs installed, including optionally required ones
alias pacprogs="pacman -Qentt" # List programs installed from sync, inluding optionally required ones
alias aurprogs="pacman -Qemtt" # List programs installed from AUR, including optionally required ones
alias orphans="pacman -Qqdt" # List true orphans
alias orphans_all="pacman -Qqdtt" # List all orphans
alias progs_size="expac -H M '%m\t%n' | sort -h"
alias uninstall="p -Rns"
alias p="sudo pacman"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias ipv6off="sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1"
alias ipv6on="sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0"
alias ipadr="dig +short myip.opendns.com @208.67.222.222"
alias ipadr6="curl -6s icanhazip.com || echo off"
alias vpn="sudo protonvpn-cli"
alias dns="echo `cat /etc/resolv.conf | grep -v '#' | awk '{print $2}'`"
alias v="vim"
alias sv="sudo vim"
alias sdn="shutdown now"
alias mkd="mkdir -pv"
