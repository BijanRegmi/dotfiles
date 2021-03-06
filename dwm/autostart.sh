# Start KeyBindings
[[ -z $(pgrep "xbindkeys") ]] && xbindkeys&

# Redshift for those precious eyes
redshift -x
redshift -O 3500 > /dev/null &

# Setup Window Compositor
[[ -z $(pgrep picom) ]] && picom --config ~/.config/picom/picom.conf &

# Start notification-daemon
[[ -z $(pgrep dunst) ]] && dunst&

# Xmodmap
xmodmap ~/.xmodmap &

# Start mpd daemon
[ ! -s ~/.config/mpd/pid ] && mpd

# Restore pywal
wal -R