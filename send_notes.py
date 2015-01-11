import serial
import time

ser = serial.Serial('/dev/ttyUSB1', 31250)
print ser

ser.write('\x90')
time.sleep(1)
ser.write('\x3c')#middle C
time.sleep(1)	#Pause for 1 second
ser.write('\x00')
time.sleep(1)

ser.write('\x90')
time.sleep(1)
ser.write('\x3d')
time.sleep(1)	#Pause for 1 second
ser.write('\x00')
time.sleep(1)

ser.write('\x90')
time.sleep(1)
ser.write('\x3e')
time.sleep(1)	#Pause for 1 second
ser.write('\x00')
time.sleep(1)

ser.write('\x90')
time.sleep(1)
ser.write('\x3f')
time.sleep(1)	#Pause for 1 second
ser.write('\x00')
time.sleep(1)

ser.write('\x90')
time.sleep(1)
ser.write('\x40')
time.sleep(1)	#Pause for 1 second
ser.write('\x00')
time.sleep(1)

time.sleep(3)
ser.write('\x80')
ser.write('\x40')
ser.write('\00')

#ser.write('\x80')
#time.sleep(1)
#ser.write('\x3c')#middle C
#time.sleep(1)	#Pause for 1 second
#ser.write('\x00')
#time.sleep(1)

#ser.write('\x45') #Concert Pitch
#time.sleep(1)

