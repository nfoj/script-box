#!/usr/bin/env bash

# author: nfoj_@hotmail.com
# description: Script to display color variations and text styles
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

# Plain colors
NONE_BLACK='\033[0;30m'
NONE_BLUE='\033[0;34m'
NONE_CYAN='\033[0;36m'
NONE_GRAY='\033[0;90m'
NONE_GREEN='\033[0;32m'
NONE_MAGENTA='\033[0;35m'
NONE_RED='\033[0;31m'
NONE_WHITE='\033[0;37m'
NONE_YELLOW='\033[0;33m'

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

# Example:

echo -e "\033[0m"Normal.'\033[0m' 
echo -e "\033[1;3m"Bold + Italic.'\033[0m'
echo -e "\033[1;3;31;42m"Bold + Italic + Red + Bg-Green.'\033[0m'

echo -e "${NONE_BLACK}Black${NO_COLOR} - ${BOLD_BLACK}Bold Black${NO_COLOR}"

#!--------------------------------------!#

clear # Limpa a tela

echo "------------------------"
echo "|         MENU         |"
echo "------------------------"
echo "| 1. Listar arquivos   |"
echo "| 2. Criar diretório   |"
echo "| 3. Sair              |"
echo "------------------------"

echo "+----------------------+"
echo "|           MENU       |"
echo "+----------------------+"
echo "| 1. Primeira Ação     |"
echo "| 2. Segunda Ação      |"
echo "| 3. Terminar          |"
echo "+----------------------+"

echo "╔════════════════════╗"
echo "║         MENU       ║"
echo "╠════════════════════╣"
echo "║ 1. Mostrar data    ║"
echo "║ 2. Mostrar usuário ║"
echo "║ 3. Voltar ao menu  ║"
echo "║ 4. Sair            ║"
echo "╚════════════════════╝"


#!--------------------------------------!#

TEMP_FILE=/sys/class/thermal/thermal_zone0/temp

ORIGINAL_TEMP=$(cat $TEMP_FILE)
TEMP_C=$((ORIGINAL_TEMP/1000))
TEMP_F=$(($TEMP_C * 9/5 + 32))

echo $TEMP_F F
