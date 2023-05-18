#alias-custom

alias aria='aria2c --conf-path=${HOME}/aria2/aria2.conf'
alias pocomtp='aft-mtp-mount ~/mnt/sdcard/'
alias poco='cd ~/mnt/sdcard/Internal" shared storage"'
alias home='cd ~'
alias Desktop='cd ~/Desktop'
alias Downloads='cd ~/Downloads'

alias ls='ls -ltr --color=auto'

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias myip='ip addr show | grep "inet " | grep -v 127.0.0.1 | awk "{print \$2}" | cut -d "/" -f 1'

alias refresh='source ~/.bashrc'

alias mkdir='mkdir -vp'
alias mkcd='function _mkcd(){ mkdir -p "$1"; cd "$1"; }; _mkcd'
alias df='df -h'
alias free='free -m'      #free memory usage in MB

alias c='clear'
alias q='exit'

alias ?='man'

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'" #Get representation of underlying files and folders as a tree.

alias psg='ps aux | grep'  # psg <process-name>
alias edit='nano'

# History commands
alias h='history'
alias h1='history 10'
alias h2='history 20'
alias h3='history 30'
alias hgrep='history | grep'

alias ports='sudo lsof -i -P -n | grep LISTEN'  # This alias shows all ports currently in use on your system, which can be helpful for troubleshooting connection issues.

alias cpuinfo='less /proc/cpuinfo'

alias topcpu='ps -eo pid,user,%cpu,%mem,start_time,command --sort=-%cpu | head'  # This alias shows the top 10 processes using the most CPU on your system.

alias topmem='ps -eo pid,user,%cpu,%mem,start_time,command --sort=-%mem | head' #This alias shows the top 10 processes using the most memory on your system.

alias please='sudo $(history -p !!)'

alias aptu='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y'


#function

#1.Convert GIF to WebM
# gif2webm gif-name-without-format
gif2webm() {
    ffmpeg -i $1.gif -c vp9 -b:v 0 -crf 41 $1.webm
}





