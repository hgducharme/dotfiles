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

alias mkdir="mkdir -p"
alias cap="bluetoothctl connect 8C:7A:AA:C7:95:60"
alias dap="bluetoothctl disconnect 8C:7A:AA:C7:95:60"
alias poly="sh ~/.config/polybar/launch.sh"
alias restart-pipewire="systemctl --user restart pipewire pipewire-pulse wireplumber && systemctl --user status pipewire pipewire-pulse wireplumber"
alias k2="upower --dump | grep keyboard -A 7"
alias mouse="upower --dump | grep mouse -A 7"
alias backup_log="cat /var/log/duplicacy_backup.log | less +G"
alias oo="onlyoffice --force-scale=1 &"
alias gputemp="nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits"
alias systeminfo="inxi -Fxxxza --no-host"
alias phoro="phoronix-test-suite"
