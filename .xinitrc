dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
xset r rate 200 50
#exec startxfce4
#exec gnome-session
#exec cinnamon-session
exec startkde
#exec i3
