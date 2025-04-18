#!/usr/bin/env bash

# author: nfoj_@hotmail.com
# description: script for connection check
# system: arch linux

#!--------------------------------------!#

# Color

# Style           |   # Colors       | # background
# 00: none        |   # 30: black    | # 40: black
# 01: Bold        |   # 31: red      | # 41: red
# 03: Italic      |   # 32: green    | # 42: green
# 04: Underlined  |   # 33: yellow   | # 43: yellow
# 05: Blinking    |   # 34: blue     | # 44: blue
# 07: Reverse     |   # 35: magenta  | # 45: magenta
# 08: Hidden      |   # 36: cyan     | # 46: cyan
#                 |   # 37: white    | # 47: white

# Note:
# '\033[Style;Color;Backgroundm'
# STYLE_COLOR_BACKGROUND='\033[00;00;00m'

COLOR_BLUE='\033[1;34m'
COLOR_RED='\033[1;31m'
COLOR_GREEN='\033[1;32m'
NO_COLOR='\033[0m'

#!--------------------------------------!#

# connect
# 8.8.8.8 == Google
echo -e " "
echo -e "${COLOR_BLUE}╔════════════════════════════════════╗ ${NO_COLOR}"
echo -e "${COLOR_BLUE}║    Testing Network Connectivity    ║ ${NO_COLOR}"
echo -e "${COLOR_BLUE}╚════════════════════════════════════╝ ${NO_COLOR}"

if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
   echo -e "${COLOR_RED}╔══════════════════════════════════════════╗ ${NO_COLOR}"
   echo -e "${COLOR_RED}║      Check your Internet Connection      ║ ${NO_COLOR}"
   echo -e "${COLOR_RED}║              and Try Again!              ║ ${NO_COLOR}"
   echo -e "${COLOR_RED}╚══════════════════════════════════════════╝ ${NO_COLOR}"
else
   echo -e "${COLOR_GREEN}╔═════════════════════╗ ${NO_COLOR}"
   echo -e "${COLOR_GREEN}║      Connected!     ║ ${NO_COLOR}"
   echo -e "${COLOR_GREEN}╚═════════════════════╝ ${NO_COLOR}"   
fi

#!--------------------------------------!#

# update
echo " "
echo -e "${COLOR_BLUE}╔══════════════════════════════╗ ${NO_COLOR}"
echo -e "${COLOR_BLUE}║    Starting System Update    ║ ${NO_COLOR}"
echo -e "${COLOR_BLUE}╚══════════════════════════════╝ ${NO_COLOR}"
echo " "

sudo pacman -Syu &> /dev/null
sudo pacman -Rns $(pacman -Qtdq) # &> /dev/null

echo -e "${COLOR_GREEN}╔═══════════════════════════════╗ ${NO_COLOR}"
echo -e "${COLOR_GREEN}║    Completed Atualization!    ║ ${NO_COLOR}"
echo -e "${COLOR_GREEN}╚═══════════════════════════════╝ ${NO_COLOR}"
echo " "

#!--------------------------------------!#

# cleaning

echo -e "${COLOR_BLUE}╔═══════════════════════════════╗ ${NO_COLOR}"
echo -e "${COLOR_BLUE}║      Clearing RAM Cache!      ║ ${NO_COLOR}"
echo -e "${COLOR_BLUE}╚═══════════════════════════════╝ ${NO_COLOR}"

sync
sudo sysctl -w vm.drop_caches=3 &> /dev/null

echo -e "${COLOR_GREEN}╔═══════════════════════════════╗ ${NO_COLOR}"
echo -e "${COLOR_GREEN}║      Cleaning Completed!      ║ ${NO_COLOR}"
echo -e "${COLOR_GREEN}╚═══════════════════════════════╝ ${NO_COLOR}"
echo " "

#!--------------------------------------!#

# reboot

echo -e "${COLOR_BLUE}╔═══════════════════════════════════════════════╗${NO_COLOR}"
echo -e "${COLOR_BLUE}║      Do you want to [Restart] the System      ║${NO_COLOR}"
echo -e "${COLOR_BLUE}║       the System to apply the updates?        ║${NO_COLOR}"
echo -e "${COLOR_BLUE}╚═══════════════════════════════════════════════╝${NO_COLOR}"
echo " "

read -p "[Yes] or [No]: " CONFIRMA
echo " "

CONFIRMA=$(echo "$CONFIRMA" | tr '[:upper:]' '[:lower:]')

case "$CONFIRMA" in
    "yes")
        reboot
        ;;
    "no")
        echo -e "${COLOR_RED}╔═══════════════════════════════╗ ${NO_COLOR}"
        echo -e "${COLOR_RED}║      Operation Canceled!      ║ ${NO_COLOR}"
        echo -e "${COLOR_RED}╚═══════════════════════════════╝ ${NO_COLOR}"
        exit 0
        ;;
    *)
        echo -e "${COLOR_RED}╔═══════════════════════════════╗ ${NO_COLOR}"
        echo -e "${COLOR_RED}║        Invalid Option!        ║ ${NO_COLOR}"
        echo -e "${COLOR_RED}╚═══════════════════════════════╝ ${NO_COLOR}"
        ;;
esac
