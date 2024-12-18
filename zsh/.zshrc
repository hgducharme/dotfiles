# Add homebrew to the path
export PATH="/opt/homebrew/bin:$PATH"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
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

show() {
	sh ~/scripts/monitors.sh show "$1"
}

# Airpods
ap() {
	if [[ $1 == "connect" ]]; then
		bluetoothctl connect 8C:7A:AA:C7:95:60
	elif [[ $1 == "disconnect" ]]; then
		bluetoothctl disconnect 8C:7A:AA:C7:95:60
	elif [[ $1 == "toggle" ]]; then
		profile=$(pactl list | grep Active | grep a2dp | cut -d ' ' -f 3)
		card=$(pactl list | grep "Name: bluez_card." | cut -d ' ' -f 2)
		a2dp="a2dp-sink-aac"
		headset="headset-head-unit-msbc"
		if [[ $profile == "a2dp-sink-aac" ]]; then
			echo "Switching airpods from $a2dp to $headset..."
			pactl set-card-profile $card $headset
		else
			echo "Switching airpods from $headset to $a2dp..."
			pactl set-card-profile $card $a2dp
		fi
	else
	fi
}

# Files
alias zshrc="vim ~/.zshrc"
alias sourcezsh="source ~/.zshrc"
alias todo="vim ~/Documents/todo.txt"
alias dotfiles="cd ~/repos/dotfiles"
alias backup_log="cat /var/log/duplicacy_backup.log | less +G"

# Binaries/Apps
alias mkdir="mkdir -p"
alias phoro="phoronix-test-suite"
alias oo="onlyoffice --force-scale=1 &"

# Bluetooth
alias cap="ap connect"
alias dap="ap disconnect"
alias tap="ap toggle"
alias btoff="bluetoothctl power off"
alias bton="bluetoothctl power on"

# Audio
alias restart-pipewire="systemctl --user restart pipewire pipewire-pulse wireplumber && systemctl --user status pipewire pipewire-pulse wireplumber"

# Hardware
alias k2="upower --dump | grep keyboard -A 7"
alias mouse="upower --dump | grep mouse -A 7"

# Misc
alias systeminfo="inxi -Fxxxza --no-host"
alias update="sudo pacman -Syu && yay -Syu"

### macOS Related Items
alias upgrade-yabai="brew services stop yabai && brew upgrade yabai && sudo yabai --uninstall-sa && sudo yabai --load-sa && brew services start yabai"
alias brew-update="brew update && brew upgrade"
alias load-sa="sudo yabai --load-sa"
alias new-brewfile="brew bundle dump --describe --file=~/repos/dotfiles/Brewfile/Brewfile --force"
alias yabai-start="yabai --start-service"
alias yabai-stop="yabai --stop-service"
alias yabai-uninstall="yabai --uninstall-service"
alias yabai-restart="yabai --restart-service"
alias skhd-start="skhd --start-service"
alias skhd-stop="skhd --stop-service"
alias skhd-restart="skhd --restart-service"
alias skhd-uninstall="skhd --uninstall-service"
alias skhd-debug="skhd-stop || true && skhd -V"
alias mdnotes="cd /Users/hgd/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Notes"
alias update-packages="sudo port selfupdate && sudo port upgrade outdated"
alias run-docker="open -a Docker"
alias kill-docker="pkill -SIGHUP -f /Applications/Docker.app 'docker serve'"

# Project specifc aliases
alias deployht="~/repos/kindlefixer-website/scripts/deploy.sh"

# This is the location of powerlevel10k on intel mac
# source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

# This is the location of powerlevel10k on silicon mac
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Prepend texlive to the PATH according to the official documentation
export PATH=/usr/local/texlive/2024/bin/universal-darwin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
