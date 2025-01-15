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

# Cal
echo -e " ";
echo -e "${BOLD_BLUE} ... [CALENDAR] ...${NO_COLOR}";sleep 1
echo " ";
  cal

#!--------------------------------------!#

# File
TD_FILE=$HOME/.td.txt

# Verify
if [ ! -f "$TD_FILE" ]; then
  touch "$TD_FILE"
  echo -e "${BOLD_BLUE} ... [FILE CREATED!] ...${NO_COLOR}";
  echo " ";
fi

#!--------------------------------------!#

# Help
if [ "$1" = "" -o "$1" = "-h" ]; then

  echo -e "${BOLD_BLUE} ... [TUTOR] ...${NO_COLOR}";
  echo -e " ";
  echo -e "Usage: td add \"task\" [ H | M | L ] - Optional priority (High, Medium and Low).";
  echo -e "       td rm - remove task";
  echo -e "       td list - list tasks";
  echo -e " ";
  echo -e "Example: td add \"Task - 01\" H";
  exit 0
  
fi

#!--------------------------------------!#

# Add task
if [ "$1" = "add" ] && [ -n "$2" ]; then

  if [ "$3" = "H" ]; then
        echo -e "${BOLD_RED}H: $2${NO_COLOR}" >> "$TD_FILE";
        echo -e "${BOLD_RED} ... [Task added: $2 (High)] ...${NO_COLOR}";
        echo -e " ";
    
  elif [ "$3" = "M" ]; then
        echo -e "${BOLD_MAGENTA}M: $2${NO_COLOR}" >> "$TD_FILE";
        echo -e "${BOLD_MAGENTA} ... [Task added: $2 (Medium)] ...${NO_COLOR}";
        echo -e " ";
    
  elif [ "$3" = "L" ]; then
        echo -e "${BOLD_YELLOW}L: $2${NO_COLOR}" >> "$TD_FILE";
        echo -e "${BOLD_YELLOW} ... [Task added: $2 (Low)] ...${NO_COLOR}";
        echo -e " ";
  
  else
        echo -e "${BOLD_GRAY}#: $2${NO_COLOR}" >> "$TD_FILE";
        echo -e "${BOLD_GRAY} ... [Task added: $2] ...${NO_COLOR}";
        echo -e " ";
  
  fi 
  sort -k1,1 -t $'\e' $TD_FILE -o $TD_FILE
fi

#!--------------------------------------!#

# Remove task (interactive)
if [ "$1" = "rm" ]; then
  echo -e "${BOLD_BLUE} ... [REMOVE] ...${NO_COLOR}";
  echo -e " ";
  
  echo -e "${BOLD_BLUE} Here are your current tasks: ${NO_COLOR}";
  echo -e " ";
  
  nl -w2  -s " " "$TD_FILE"
  echo -e " ";

  read -p "Enter the number of the task to remove: " task_number

  if ! [[ "$task_number" =~ ^[0-9]+$ ]]; then
    echo -e "${BOLD_RED}Invalid input. Please enter a valid number.${NO_COLOR}";
    exit 1
  fi

  sed -i "${task_number}d" "$TD_FILE"
  echo -e "${BOLD_GREEN} ... [Task removed at line $task_number] ...${NO_COLOR}";
  echo -e " ";

  sort -k1,1 -t $'\e' "$TD_FILE" -o "$TD_FILE"
   
fi

#!--------------------------------------!#

# Print
if [ "$1" = "list" ]; then
    echo -e "${BOLD_BLUE} ... ... ... ... ... ${NO_COLOR}"; sleep 1
    echo -e " ";
      
    echo -e "${BOLD_RED} ... [High] ...${NO_COLOR}"; sleep 1
    echo -e " ";
    grep "H:" "$TD_FILE"  
    echo " ";

    echo -e "${BOLD_MAGENTA} ... [Medium] ...${NO_COLOR}"; sleep 1
    echo -e " ";
    grep "M:" "$TD_FILE"
    echo " ";

    echo -e "${BOLD_YELLOW} ... [Low] ...${NO_COLOR}"; sleep 1
    echo -e " ";
    grep "L:" "$TD_FILE"
    echo " ";

    echo -e "${BOLD_GRAY} ... [#] ....${NO_COLOR}"; sleep 1
    echo -e " ";
    grep "#:" "$TD_FILE"
fi
