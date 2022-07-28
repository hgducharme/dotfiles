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

test-microphone() {
    arecord -vv -f dat /dev/null
}

# Files
alias zshrc="vim ~/.zshrc"
alias todo="vim ~/Documents/todo.txt"
alias dotfiles="cd ~/dotfiles"
alias backup_log="cat /var/log/duplicacy_backup.log | less +G"

# Binaries/Apps
alias mkdir="mkdir -p"
alias phoro="phoronix-test-suite"
alias oo="onlyoffice --force-scale=1 &"

# Bluetooth
alias cap="bluetoothctl connect 8C:7A:AA:C7:95:60"
alias dap="bluetoothctl disconnect 8C:7A:AA:C7:95:60"
alias btoff="bluetoothctl power off"
alias bton="bluetoothctl power on"

# Audio
alias restart-pipewire="systemctl --user restart pipewire pipewire-pulse wireplumber && systemctl --user status pipewire pipewire-pulse wireplumber"

# Hardware
alias k2="upower --dump | grep keyboard -A 7"
alias mouse="upower --dump | grep mouse -A 7"
alias gputemp="nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits"
alias show="sh ~/scripts/monitors.sh show"

# Misc
alias poly="sh ~/.config/polybar/launch.sh"
alias systeminfo="inxi -Fxxxza --no-host"
alias update="sudo pacman -Syu && yay -Syu"
