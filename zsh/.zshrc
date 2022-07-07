# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

alias mkdir="mkdir -p"

test-microphone() {
    arecord -vv -f dat /dev/null
}

alias cap="bluetoothctl connect 8C:7A:AA:C7:95:60"
alias dap="bluetoothctl disconnect 8C:7A:AA:C7:95:60"
alias poly="sh ~/.config/polybar/launch.sh"
alias restart-pipewire="systemctl --user restart pipewire pipewire-pulse && systemctl --user status pipewire pipewire-pulse"
alias k2="upower --dump | grep keyboard -A 7"
