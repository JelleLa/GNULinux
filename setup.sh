#!/bin/bash

sudo zypper in dialog &&

## START DIALOG

dialog --title "openSUSE Setup Script" --msgbox "Welcome to the openSUSE Setup Script! This Script will install neccesary software and clone useful GitHub repositories. Click Ok to continue. (c) 2021 Jelle Langedijk. All Rights Reserved" 10 40 &&

## UPDATE DIALOG

dialog --title "openSUSE Setup Script" --yesno "Check for updates first?" 10 40

case "$?" in
    0)  sudo zypper up ;;
    1)  ;;
esac

## EXA DIALOG

dialog --title "openSUSE Setup Script" --yesno "Install Exa (Replacement for ls)?" 10 40

case "$?" in
    0)  sudo zypper in exa ;;
    1)  ;;
esac
## PYTHON-IPYTHON DIALOG

dialog --title "openSUSE Setup Script" --yesno "Install IPython?" 10 40

case "$?" in
    0)  sudo zypper in python3-ipython;;
    1)  ;;
esac
## NEOFETCH DIALOG

dialog --title "openSUSE Setup Script" --yesno "Install Neofetch?" 10 40

case "$?" in
    0)  sudo zypper in neofetch ;;
    1)  ;;
esac


## VIM DIALOG

dialog --title "openSUSE Setup Script" --yesno "Install VIM?" 10 40

case "$?" in
    0)  sudo zypper in vim; wget https://github.com/JelleLa/linux/blob/master/.vimrc ;;
    1)  ;;
esac

## BASHRC DIALOG

dialog --title "openSUSE Setup Script" --yesno "Replace Bashrc?" 10 40

case "$?" in
    0)  wget https://github.com/JelleLa/linux/blob/master/.bashrc ;;
    1)  ;;
esac

## i3 DIALOG

dialog --title "openSUSE Setup Script" --yesno "Install i3-gaps?" 10 40

case "$?" in
    0)  sudo zypper in i3-gaps ;;
    1)  ;;
esac

## Picom DIALOG

dialog --title "openSUSE Setup Script" --yesno "Install Picom?" 10 40

case "$?" in
    0)  sudo zypper in picom ;;
    1)  ;;
esac

## TexLive DIALOG

dialog --title "openSUSE Setup Script" --yesno "Install TexLive?" 10 40

case "$?" in
    0)  sudo zypper in texlive && texlive-all ;;
    1)  ;;
esac

## Rofi DIALOG

dialog --title "openSUSE Setup Script" --yesno "Install Rofi?" 10 40

case "$?" in
    0)  sudo zypper in rofi ;;
    1)  ;;
esac

## fontawesome DIALOG

dialog --title "openSUSE Setup Script" --yesno "Install FontAwesome?" 10 40

case "$?" in
    0)  sudo zypper in fontawesome-fonts ;;
    1)  ;;
esac

## KITTY DIALOG

dialog --title "openSUSE Setup Script" --yesno "Install Kitty Terminal Emulator?" 10 40

case "$?" in
    0)  sudo zypper in kitty ;;
    1)  ;;
esac

## NEXTCLOUD DIALOG

dialog --title "openSUSE Setup Script" --yesno "Install and Setup NextCloud?" 10 40

case "$?" in
    0)  sudo zypper in nextcloud-desktop -y && nextcloud ;;
    1)  ;;
esac

## JUPYTER DIALOG

dialog --title "openSUSE Setup Script" --yesno "Install and Setup Jupyter?" 10 40

case "$?" in
    0)  sudo pip3 install jupyter jupyter themes && jt -t monokai ;;
    1)  ;;
esac
## END DIALOG
 dialog --title "openSUSE Setup Script" --infobox "Script is done! Redirected to the shell." 10 40
