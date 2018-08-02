export PATH="$PATH:$HOME/.scripts"
export EDITOR="nano"
export TERMINAL="urxvt"
export BROWSER="firefox"
export ZSH="/home/void/.oh-my-zsh"

# autostart i3 when logged in:
if [[ "$(tty)" = "/dev/tty1" ]]; then
        pgrep i3 || exec startx
fi

ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

DEFAULT_USER="void"

# System Maintainence
alias progs="(pacman -Qet && pacman -Qm) | sort -u" # List programs I've installed
alias orphans="pacman -Qdt" # List orphan programs
alias sdn="sudo shutdown now"

# Some aliases
alias p="sudo pacman"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias g="git"

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias YT="youtube-viewer"
alias speedtest="speedometer -r wlp2s0"
