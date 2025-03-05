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

# import
import os
import re

# enter path
directory = input("Enter path: ")

# instructions
print("To look for specific files, enter what you know, using .* for any characters you don't know.")
print("Example: IMG.* will filter files that start with IMG - IMG123.jpg, IMG_report.txt and IMG")

# pattern and name
pattern = input(f"{colors['COLOR_BLUE']}Enter pattern: {colors['NO_COLOR']}")
new_name = input(f"{colors['COLOR_BLUE']}Enter the new name: {colors['NO_COLOR']}")

# main
def rename_files(directory, pattern, new_name):

    # list the files
    files = os.listdir(directory)
    counter = 0

    for file in files:
        if re.match(pattern, file):
            filetype = file.split('.')[-1]
            os.rename(directory + '/' + file, directory + '/' + new_name + '-' + str(counter) + '.' + filetype)
            counter += 1

rename_files(directory, pattern, new_name)

print(f"{colors['COLOR_GREEN']}... Completed! ...{colors['NO_COLOR']}")
