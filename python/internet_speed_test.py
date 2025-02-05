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

# import

import sched
import numpy as np
import pandas as pd
import time
from datetime import datetime
import speedtest

#!--------------------------------------!#

# init

download = []
upload = []
ping = []
datetime []

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

#!--------------------------------------!#

# test internet speed

def test_internet_speed():
    global download, upload, ping, datetime

    # Velocity rede
    test_download = '{:.2f}'.format(st.download() / (10 ** 6))
    test_upload = '{:.2f}'.format(st.upload() / (10 ** 6))
    test_ping = st.results.ping

    # Rules
    test_datetime = time.ctime()

    #
    download.append(test_download)
    upload.append(test_upload)
    ping.append(test_ping)
    datetime.append(test_datetime)

    #
    print("Test delay time {delay_time}")
    
    scheduler.enter(delay=delay_time, priority=0, action=test_internet_speed)

#!--------------------------------------!#

# 

def df_speedtest():
    data_speed = {'Download': download, 'Upload': upload, 'Ping': ping}
    data_speeds = pd.DataFrame(data_speeds, columns=['Download', 'Upload', 'Ping'])

    #
    date_time = {'Datetime' : datetime, }
    df_date_time = pd.DataFrame(date_time, columns=['Datetime'])

    #
    dados_speedtest = pd.concat([df_date_time, data_speeds], axis=1, join='inner')
    print(dados_speedtest.to_markdown())
    scheduler.enter(delay=delay_time, priority=1, action=df_speedtest)


#!--------------------------------------!#

# save

def save_dataframe():
    global download, upload, ping, datetime

    data_speeds = {'Download': download, 'Upload': upload, 'Ping': ping}
    data_speeds = pd.DataFrame(data_speeds, columns=['Download', 'Upload', 'Ping'])

    
    date_time = {'Datetime': datetime,}
    df_date_time = pd.DataFrame(date_time, columns=['Datetime'])

    
    excel_speedtest = pd.concat([df_date_time, data_speeds], axis=1, join='inner')
    excel_speedtest.to_csv("dados_speedtest.csv", index=False)
    

#!--------------------------------------!#

# test
delay_time = delay()
scheduler.enter(0, 1, test_internet_speed)

try:
    scheduler.run()
except KeyboardInterrupt:
    print("Program interrupted by user. Exiting gracefully...")
    save_dataframe()  
