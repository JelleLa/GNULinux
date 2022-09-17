#! /bin/bash
#=================================
# - Title: Locker
# - Author: Jelle Langedijk
# - Filename: `locker.sh`
# - Purpose: Fancy i3lock
#=================================
IMG=/tmp/i3lockbg.png
scrot -o $IMG
convert $IMG -blur 0x6 $IMG
i3lock -i $IMG
