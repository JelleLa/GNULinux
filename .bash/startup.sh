#!/bin/bash
#VARIABLES
TERMEMU=kitty
ENDMSG="Startup Complete!"
## MOUNT MUSIC
dialog --title "Startup" --yesno "Mount Music Library?" 10 40
case "$?" in
    0)  sudo mount /dev/mmcblk0p1 /home/jlangedijk/Music ;;
    1)  ;;
esac
## CHECK FOR UPDATES
dialog --title "Startup" --yesno "Check for updates?" 10 40
case "$?" in
    0)  sudo zypper up;;
    1)  ;;
esac
clear && echo $ENDMSG
sleep 2
