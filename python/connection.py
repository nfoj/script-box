#!--------------------------------------!#

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

colors = {

    'COLOR_BLUE' : '\033[1;34m',
    'COLOR_RED'  : '\033[1;31m',
    'COLOR_GREEN': '\033[1;32m',
    'NO_COLOR'   : '\033[0m'

}

#!--------------------------------------!# 

import requests

def verifica_conexao_internet():
    try:
        response = requests.get("http://www.google.com", timeout=5) # Adicionado timeout para evitar travamentos
        return response.status_code == 200

    except requests.ConnectionError:
        return False

    except requests.Timeout:
        return False

if verifica_conexao_internet():
    print(f"{colors['COLOR_GREEN']}... [CONNECTED TO THE INTERNET] ...{colors['NO_COLOR']}")

else:
    print(f"{colors['COLOR_RED']}... [CHECK YOUR INTERNET CONNECTION AND TRY AGAIN] ...{colors['NO_COLOR']}")
