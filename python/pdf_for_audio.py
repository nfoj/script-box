#!/usr/bin/env python

# author: nfoj_@hotmail.com
# description: script for convert pdf to audio
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
# pip install pyttsx3
# pip install pdfplumber
# pip install PyPDF2

#!--------------------------------------!#

# import
import pyttsx3
import pdfplumber
import PyPDF2

#!--------------------------------------!#

import PyPDF2
import pdfplumber
import pyttsx3

# path
file input("Path: ")
output_file = 'D:/text_all_pages.pm3'

try:
    with open(file, 'rb') as f:
        pdfR = PyPDF2.PdfReader(f)
        pagges = len(pdfR.pages)

    with pdfplumber.open(file) as pdf:
        all_text = ''
        for i in range(pages):
            page = pdf.pages[i]
            text = page.extract_text()
            all_text += text + ' '

            s = pyttsx3.init()
            s.save_to_file(all_text, output_file)
            s.runAndWait()
            s.stop()

        print(f"{colors['COLOR_BLUE']}... Convert Completed! ...{colors['NO_COLOR']}")

except FileNotFoundError:
    print(f"{colors['COLOR_RED']}... File not found: {file}! ...{colors['NO_COLOR']}")


except Exception as e:
    print(f"{colors['COLOR_RED']}... Error: {e}! ...{colors['NO_COLOR']}")

