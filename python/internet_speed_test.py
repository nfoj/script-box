#!/usr/bin/env python

# author: nfoj_@hotmail.com
# description: internet speed test
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

import sched
import numpy as np
import pandas as pd
import time
from datetime import datetime
import speedtest

st = speedtest.Speedtest()
scheduler = sched.scheduler()

st.get_best_server()

def delay():
    ok = False
    delay_time = 0

    while True:
        delay_time = input("Enter the interval in seconds between each internet test (300s = 5min): ")

        if  delay_time.isnumeric():
            delay_time = int(delay_time)
            ok = True

        else:
            print("Please enter nambers only.")

        if ok:
            break

    return delay_time
