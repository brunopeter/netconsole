#!/usr/bin/python3

import board
import subprocess
from PIL import Image, ImageDraw, ImageFont
import adafruit_ssd1306
import digitalio
import time

oled_reset = digitalio.DigitalInOut(board.D4)

WIDTH = 128
HEIGHT = 32
BORDER = 5
FONTSIZE = 14

i2c = board.I2C()
oled = adafruit_ssd1306.SSD1306_I2C(WIDTH, HEIGHT, i2c, addr=0x3C, reset=oled_reset)

image = Image.new("1", (oled.width, oled.height))
draw = ImageDraw.Draw(image)

try:
   font = ImageFont.truetype('FreeMono.ttf', FONTSIZE)
except:
   font = ImageFont.load_default(FONTSIZE)

while True:
   for y in range(0, 22, 2):
       draw.rectangle((0, 0, WIDTH, HEIGHT), outline=0, fill=0)
       IPAddr = subprocess.check_output('hostname -I', shell = True).decode('UTF-8').strip()
       if not IPAddr:
           IPAddr = "No IP Address"
       draw.text((0, y), IPAddr, font=font, fill=255,)

       oled.image(image)
       oled.show()

       time.sleep(4)
