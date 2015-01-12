import serial
import time

ser = serial.Serial('/dev/ttyUSB1', 31250)
print ser
print "Sending Itsy Bitsy Spider"

ser.write('\x00')
time.sleep(3)

ser.write('\x37') #G2
time.sleep(0.4)
ser.write('\x3c') #C3
time.sleep(0.1)
ser.write('\x00')
time.sleep(0.1)
ser.write('\x3c') #C3
time.sleep(0.1)
ser.write('\x00')
time.sleep(0.3)
ser.write('\x3c') #C3
time.sleep(0.1)
ser.write('\x3e') #D3
time.sleep(0.4)
ser.write('\x40') #E3
time.sleep(0.1)
ser.write('\x40') #E3
time.sleep(0.4)

ser.write('\x40') #E3
time.sleep(0.4)
ser.write('\x3e') #D3
time.sleep(0.4)
ser.write('\x3c') #C3
time.sleep(0.4)
ser.write('\x3e') #D3
time.sleep(0.4)
ser.write('\x40') #E3
time.sleep(0.4)
ser.write('\x3c') #C3
time.sleep(0.4)

ser.write('\x40') #E3
time.sleep(0.2)
ser.write('\x00')
time.sleep(0.2)
ser.write('\x40') #E3
time.sleep(0.4)
ser.write('\x41') #F3
time.sleep(0.4)
ser.write('\x43') #G3
time.sleep(0.4)
ser.write('\x40') #E3
time.sleep(0.4)



ser.write('\x00')
