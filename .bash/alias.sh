#========================================
# <> alias <>
#========================================
#----------------------------------------
# -| BASIC THINGS |-

alias clc='clear'
alias q='exit'
alias update='sudo zypper up'
alias py='ipython'
alias webcam='mpv --profile=low-latency --untimed --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0'
alias time='date +"%T"'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias pdf='zathura'
alias audio-list='pactl list short sinks'
alias nc='nextcloud'
alias startup='$HOME/.bash/STARTUP.sh'

#----------------------------------------
# -| LISTING/EXA THINGS |-

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='exa -lh'
alias l='exa'
alias la='exa -abghHliS'

#----------------------------------------
# -| MATLAB THINGS |-

alias matlab='/usr/local/MATLAB/R2021a/bin/matlab -desktop'
alias matlab-cli='matlab -nodesktop -nosplash'

#----------------------------------------
# -| OPENSUSE THINGS |-

alias update='sudo zypper up'
alias install='sudo zypper in'
alias remove='sudo zypper rm'
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
