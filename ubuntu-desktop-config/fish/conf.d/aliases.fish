# Basic Commands
function df
  command df -h
end

function la
  command ls -la $argv
end

function ll
  command ls -alF $argv
end

function vim
  command nvim $argv
end

# Git Commands
function ga
  git add $argv
end

functions -e gs

function gs
  git status
end

function gpoh
  git push origin HEAD
end

function gc
  git commit
end

function gcm
  git commit -m $argv
end

function gco
  git checkout $argv
end

function gcb
  git checkout (git branch -a | fzf-tmux -d 15 --no-preview | sed "s/remotes\/origin\///g" | sed "s/ //g")
end

# Navigation
function .3
  cd ../../..
end

function .4
  cd ../../../..
end

function .5
  cd ../../../../..
end

# Tmux
function trw
 tmux rename-window $argv
end

# Docker
function dimg
  docker images
end

function dps
  docker ps -a
end

# Shorten neofetch
function neo
  neofetch
end

# Screenshot
functions -e ss
function ss
  maim -s /home/ryan/Pictures/screenshot.png
end

# Edit Conf Files
function polycfg
  nvim /home/ryan/.config/polybar/config
end

function i3cfg
  nvim /home/ryan/.config/i3/config
end

function xres
  nvim /home/ryan/.Xresources
end

function kittyconf
  nvim /home/ryan/.config/kitty/kitty.conf
end

function picomconf
  nvim /home/ryan/.config/picom/picom.conf
end

function vimrc
  nvim /home/ryan/.config/nvim/init.vim
end

# Fzf -> nvim
function ff
  nvim (fzf)
end

# Computer Resource Monitoring
function psmem
  ps auxf | sort -nr -k 4
end

function psmem10
  ps auxf | sort -nr -k 4 | head -10
end

function pscpu
  ps auxf | sort -nr -k 3
end

function pscpu10
  ps auxf | sort -nr -k 3 | head -10
end

# SSH to Raspberry Pis
function sshpi0
  ssh pi@192.168.1.12
end

function sshpi2
  ssh pi@192.168.1.14
end

function sshpi3
  ssh pi@192.168.1.11
end

function sshpi4
  ssh ubuntu@192.168.1.13
end
