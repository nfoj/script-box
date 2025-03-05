#!/usr/bin/env python

# author: nfoj_@hotmail.com
# description: script to rename files
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

# install
# pip install requests

#!--------------------------------------!#

# import
import requests

# url
long_url = r"Enter the URL you want to shorten"

# main
def shorten_url_tinyurl(long_url):
    url = f'http://tinyurl.com/api-create.php?url={long_url}'
    response = requests.get(url)
    if response.status_code == 200:
        return response.text
    else:
        return None

#
short_url = shorten_url_tinyurl(long_url)


# print
if short_url:
    print('Shortened link: {}'.format(short_url))
else:
    print('Error!')
