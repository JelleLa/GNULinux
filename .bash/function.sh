###############################################################################
#░▒█▀▀▄░█▀▀▄░▒█▀▀▀█░▒█░▒█░▒█▀▀▄░▒█▀▀▄
#░▒█▀▀▄▒█▄▄█░░▀▀▀▄▄░▒█▀▀█░▒█▄▄▀░▒█░░░
#░▒█▄▄█▒█░▒█░▒█▄▄▄█░▒█░▒█░▒█░▒█░▒█▄▄▀
#	AUTHOR: J. Langedijk
#	DESCRIPTION: bashrc file
###############################################################################
#------------------------------------------------------------------------------
# -| PRINTS |-

function mkd (){
    mkdir $1 && echo "Created directory $1."
}

function mkf (){
    touch $1 && echo "Created file $1."
}

function rmv (){
    if [[ -d $1 ]]; then
        rm -r $1 && echo "Directory $1 removed"
    elif [[ -f $1 ]]; then
        rm -r $1 && echo "File $1 removed"
    else
        exit 1
    fi
}

#------------------------------------------------------------------------------
# -| FILE COMPILATION |-

function md2pdf (){
	pandoc $1 --pdf-engine=xelatex -o $2
}
function tex2md (){
	pandoc -s $1 -o $2
}
function tex2pdf (){
	pdflatex $1 $2
}
function md2beamer (){
    pandoc -t beamer $1 -o $2 && zathura $2
}

#------------------------------------------------------------------------------
# -| AUDIO |-

function audio-set (){
    pacmd set-default-sink $1
}

#------------------------------------------------------------------------------
# -| EXTRACTION |-

function extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "What the fuck is '$1'... That ain't an archive!" ;;
       esac
   else
       echo "'$1' is likely not an archive!"
   fi
 }


#------------------------------------------------------------------------------
# -| LISP (Over SBCL/COMMON LISP) |-

function lisp () {
    if [ -z "$1" ]; then
        sbcl
    else
        sbcl --script $1
    fi
}
