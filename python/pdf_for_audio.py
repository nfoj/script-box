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

#!--------------------------------------!#1

# voices 
engine = pyttsx3.init()
voices = engine.getProperty('voices')

for voice in voices:
    print(f"ID: {voice.id} - Name: {voice.name}")

#!--------------------------------------!#1

# path
file_path = input("Digite o caminho do arquivo PDF: ")
output_file = input("Digite o caminho para salvar o arquivo de áudio: ")

# 
colors = {
    'COLOR_BLUE': '\033[94m',  
    'COLOR_RED': '\033[91m', 
    'NO_COLOR': '\033[0m' 
}

try:
    # Abre o arquivo PDF
    with open(file_path, 'rb') as f:
        pdfR = PyPDF2.PdfReader(f)
        pages = len(pdfR.pages)  # Obtém o número de páginas do PDF

    # Extrai o texto de todas as páginas
    with pdfplumber.open(file_path) as pdf:
        all_text = ''
        for i in range(pages):
            page = pdf.pages[i]
            text = page.extract_text()
            all_text += text + ' '

        # Inicializa o pyttsx3
        s = pyttsx3.init()

        # Obtém as vozes disponíveis
        voices = s.getProperty('voices')
        voice_id = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Speech\\Voices\\Tokens\\TTS_MS_PT-BR_MARIA_11.0"
        s.setProperty('voice', voice_id)

        # Gera o áudio com o texto
        s.save_to_file(all_text, output_file)
        s.runAndWait() 
        s.quit()

    print(f"{colors['COLOR_BLUE']}... Conversão Completa! Áudio gerado em: {output_file} ...{colors['NO_COLOR']}")

except FileNotFoundError:
    print(f"{colors['COLOR_RED']}... Arquivo não encontrado: {file_path}! ...{colors['NO_COLOR']}")

except Exception as e:
    print(f"{colors['COLOR_RED']}... Ocorreu um erro: {e} ...{colors['NO_COLOR']}")

