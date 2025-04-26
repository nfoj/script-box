#!/usr/bin/env python

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

def check_internet():
    try:
        response = requests.get("http://www.google.com", timeout = 5)
        return response.status_code == 200

    except requests.ConnectionError:
        return False

    except requests.Timeout:
        return False

print(f"{colors['COLOR_BLUE']}╔═════════════════════╗{color['NO_COLOR']}")
print(f"{colors['COLOR_BLUE']}║     Testing ...     ║{colors['COLOR_BLUE']}")
print(f"{colors['COLOR_BLUE']}╚═════════════════════╝{colors['COLOR_BLUE']}")

if check_internet():
    print(f"{colors['COLOR_GREEN']}╔═════════════════════╗{colors['NO_COLOR']}")
    print(f"{colors['COLOR_GREEN']}║     Connected!      ║{colors['NO_COLOR']}")
    print(f"{colors['COLOR_GREEN']}╚═════════════════════╝{colors['NO_COLOR']}")

else:
    print(f"{colors['COLOR_RED']}╔══════════════════════════════════════════╗{colors['NO_COLOR']}")
    print(f"{colors['COLOR_RED']}║      Check your Internet Connection      ║{colors['NO_COLOR']}")
    print(f"{colors['COLOR_RED']}║              and Try Again!              ║{colors['NO_COLOR']}")
    print(f"{colors['COLOR_RED']}╚══════════════════════════════════════════╝{colors['NO_COLOR']}")
