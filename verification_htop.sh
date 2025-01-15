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

# Bold
BOLD_BLACK='\033[1;30m'
BOLD_BLUE='\033[1;34m'
BOLD_CYAN='\033[1;36m'
BOLD_GRAY='\033[1;90m'
BOLD_GREEN='\033[1;32m'
BOLD_MAGENTA='\033[1;35m'
BOLD_RED='\033[1;31m'
BOLD_WHITE='\033[1;37m'
BOLD_YELLOW='\033[1;33m'

# No color
NO_COLOR='\033[0m'

#!--------------------------------------!#

# File
VF_HTOP=$HOME/.vf.txt

# Verify
if [ ! -f "$VF_HTOP" ]; then
  touch "$VF_HTOP"
  echo -e "${BOLD_BLUE} ... [FILE CREATED!] ...${NO_COLOR}";
  echo " ";
fi

#!--------------------------------------!#

# 
echo -e "${BOLD_BLUE} ... [CHECKING SYSTEM DATA] ...${NO_COLOR}";
echo " ";

#!--------------------------------------!#

# top

top -bn1 -o -%MEM |



# awk '
#    /KiB Swap/ {printf "Swap: %s total, %s usado, %s livre\n", $3, $6, $5}
#    /^ *PID/ {header=1; next} # Marca o início do cabeçalho das colunas
#    header && NR>1 && n<6 {print $1, $2, $9, $10; n++} # Imprime os 5 processos após o cabeçalho
# '

echo " ";

#!--------------------------------------!#

# completed

echo -e "${BOLD_GREEN} ... [COMPLETED] ...${NO_COLOR}"; sleep 2

echo " ";
