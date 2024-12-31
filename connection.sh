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

echo -e "${COLOR_BLUE} ... [TESTING NETWORK CONNECTIVITY] ...${NC}";sleep 2

if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
  echo -e "${COLOR_RED} ... [CHECK YOUR INTERNET CONNECTION AND TRY AGAIN] ...${NO_COLOR}";sleep 2
  exit 1
else
  echo -e "${COLOR_GREEN} ... [CONNECTED TO THE INTERNET] ...${NO_COLOR}";sleep 2
fi

echo " ";
