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

poly() {
  if [ $1 = "reset" ]; then
    rm -r ~/.config/polybar.old/
    cd ~/repos/polybar-themes/
    printf '1' | ./setup.sh > /dev/null
    poly --custom
  else
	  /bin/bash ~/.config/polybar/launch.sh "$1" &
  fi
}

gpu() {
	query=""
	if [[ $1 == "temp" ]]; then
		query="temperature.gpu"
	elif [[ $1 == "memory.total" ]]; then
		query="memory.total"
	elif [[ $1 == "memory.used" ]]; then
		query="memory.used"
	elif [[ $1 == "memory.free" ]]; then
		query="memory.free"
	else
		nvidia-smi
		return
	fi

	nvidia-smi --query-gpu=$query --format=csv,noheader
}

# Files
alias zshrc="vim ~/.zshrc"
alias sourcezsh="source ~/.zshrc"
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
alias show="sh ~/scripts/monitors.sh show"

# Misc
alias systeminfo="inxi -Fxxxza --no-host"
alias update="sudo pacman -Syu && yay -Syu"
