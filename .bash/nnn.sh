#========================================
# <> NNN Settings <>
#========================================
#----------------------------------------
# -| ALIAS |-

alias n3='nnn -e'
alias n3plug='curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh'

#----------------------------------------
# -| EXPORT |-

export NNN_PLUG='w:wallpaper;p:preview-tui;q:cdonquit'
export NNN_OPENER=zathura
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_BMS="s:$HOME/Documents/Siemens/;w:$HOME/GitHub/Website/"
export nnn="$1"
#----------------------------------------
# -| MISC |-

nnn_cd(){
    if ! [ -z "$NNN_PIPE" ]; then
        printf "%s\0" "0c${PWD}" > "${NNN_PIPE}" !&
    fi
}

trap nnn_cd EXIT
#----------------------------------------
