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

# Menu
echo -e " "
echo "╔═════════════════════╗"
echo "║   Testing Network   ║"
echo "╠═════════════════════╣"
echo "║ 1. Test - Google    ║"
echo "║ 2. Enter the Domain ║"
echo "║ 3. Enter the IP     ║"
echo "║ 4. Exit             ║"
echo "╚═════════════════════╝"
read -p "Enter option: " option
echo " "

case "$option" in
  "1")
    # connect
    # 8.8.8.8 == Google
    echo -e "${COLOR_BLUE}╔═════════════════════╗ ${NO_COLOR}"
    echo -e "${COLOR_BLUE}║      Testing ...    ║ ${NO_COLOR}"
    echo -e "${COLOR_BLUE}╚═════════════════════╝ ${NO_COLOR}"
    echo " "

    if ! ping -c 3 8.8.8.8 -q &> /dev/null; then
      echo -e "${COLOR_RED}╔══════════════════════════════════════════╗ ${NO_COLOR}"
      echo -e "${COLOR_RED}║      Check your Internet Connection      ║ ${NO_COLOR}"
      echo -e "${COLOR_RED}║              and Try Again!              ║ ${NO_COLOR}"
      echo -e "${COLOR_RED}╚══════════════════════════════════════════╝ ${NO_COLOR}"
      echo " "         
      exit 1
    else
      echo -e "${COLOR_GREEN}╔═════════════════════╗ ${NO_COLOR}"
      echo -e "${COLOR_GREEN}║      Connected!     ║ ${NO_COLOR}"
      echo -e "${COLOR_GREEN}╚═════════════════════╝ ${NO_COLOR}"
      exit 1
    fi
    ;;

  "2")
    # google.com
    read -p "Enter the Domain (www.google.com): " domain
    echo -e " "
    echo -e "${COLOR_BLUE}╔═════════════════════╗ ${NO_COLOR}"
    echo -e "${COLOR_BLUE}║      Testing ...    ║ ${NO_COLOR}"
    echo -e "${COLOR_BLUE}╚═════════════════════╝ ${NO_COLOR}"
    echo " "

    if ! ping -c 3 "$domain" -q &> /dev/null; then
      echo -e "${COLOR_RED}╔══════════════════════════════════════════╗ ${NO_COLOR}"
      echo -e "${COLOR_RED}║      Check your Internet Connection      ║ ${NO_COLOR}"
      echo -e "${COLOR_RED}║              and Try Again!              ║ ${NO_COLOR}"
      echo -e "${COLOR_RED}╚══════════════════════════════════════════╝ ${NO_COLOR}"
      echo " "
      exit 1
    else
      echo -e "${COLOR_GREEN}╔═════════════════════╗ ${NO_COLOR}"
      echo -e "${COLOR_GREEN}║      Connected!     ║ ${NO_COLOR}"
      echo -e "${COLOR_GREEN}╚═════════════════════╝ ${NO_COLOR}"
      exit 1
    fi
    ;;

  "3")
    # 8.8.8.8
    read -p "Enter the IP (8.8.8.8): " ip_user
    echo -e " "
    echo -e "${COLOR_BLUE}╔═════════════════════╗ ${NO_COLOR}"
    echo -e "${COLOR_BLUE}║      Testing ...    ║ ${NO_COLOR}"
    echo -e "${COLOR_BLUE}╚═════════════════════╝ ${NO_COLOR}"
    echo " "

    if ! ping -c 3 "$ip_user" -q &> /dev/null; then
      echo -e "${COLOR_RED}╔══════════════════════════════════════════╗ ${NO_COLOR}"
      echo -e "${COLOR_RED}║      Check your Internet Connection      ║ ${NO_COLOR}"
      echo -e "${COLOR_RED}║              and Try Again!              ║ ${NO_COLOR}"
      echo -e "${COLOR_RED}╚══════════════════════════════════════════╝ ${NO_COLOR}"
      exit 1
    else
      echo -e "${COLOR_GREEN}╔═════════════════════╗ ${NO_COLOR}"
      echo -e "${COLOR_GREEN}║      Connected!     ║ ${NO_COLOR}"
      echo -e "${COLOR_GREEN}╚═════════════════════╝ ${NO_COLOR}"
      exit 1
    fi
    ;;

  "4")
     exit
     ;;

  *)
     echo -e "${COLOR_RED}╔═════════════════════╗ ${NO_COLOR}"
     echo -e "${COLOR_RED}║   Invalid option!   ║ ${NO_COLOR}"
     echo -e "${COLOR_RED}╚═════════════════════╝ ${NO_COLOR}"
     ;;
esac
