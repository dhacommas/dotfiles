###alias-custom###

alias aria='aria2c'
alias pocomtp='aft-mtp-mount /home/dhacommas/mnt/sdcard/'
alias poco='cd ~/mnt/sdcard/Internal" shared storage"'
alias home='cd ~'
alias desktop='cd ~/Desktop'
alias downloads='cd ~/Downloads'

alias lsa='ls -altr --color=auto'


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

alias refresh='source ~/.bashrc && source ~/.bash_aliases && source ~/.profile'

alias mkdir='mkdir -vp'
alias mkcd='function _mkcd(){ mkdir -vp "$1"; cd "$1"; }; _mkcd'
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

alias pycharm='sh ~/Downloads/pycharm/bin/pycharm.sh'

#-------------------------------------------------------------------------------

##yt-dlp
alias ytdlp='yt-dlp'
##yt-dlp_local
alias video-local='cd ~/Downloads/ytdlp && yt-dlp --config-location .config/main.conf --config-location ./config/video.conf'
alias audio-local='cd ~/Downloads/ytdlp && yt-dlp --config-location ./config/main.conf --config-location ./config/audio.conf'
alias playlist-local='cd ~/Downloads/ytdlp && yt-dlp --config-location ./config/main.conf --config-location ./config/playlist.conf'

##yt-dlp_media
alias video='cd /media/dhacommas/BoxIt/ytdlp && yt-dlp --config-location ./config/main.conf --config-location ./config/video.conf'
alias audio='cd /media/dhacommas/BoxIt/ytdlp && yt-dlp --config-location ./config/main.conf --config-location ./config/audio.conf'
alias playlist='cd /media/dhacommas/BoxIt/ytdlp && yt-dlp --config-location ./config/main.conf --config-location ./config/playlist.conf'

#-------------------------------------------------------------------------------

### function ###

#1.Convert GIF to WebM
# gif2webm gif-name-without-format
gif2webm() {
    ffmpeg -i $1.gif -c vp9 -b:v 0 -crf 41 $1.webm
}

#2. Function extract for common file formats ###
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}
IFS=$SAVEIFS
