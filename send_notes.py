import serial
import time

ser = serial.Serial('/dev/ttyUSB0', 31250)
print ser

ser.write('\x90')
time.sleep(1)
ser.write('\x3c')#middle C
time.sleep(1)	#Pause for 1 second
ser.write('\x00')
time.sleep(1)

#ser.write('\x80')
#time.sleep(1)
#ser.write('\x3c')#middle C
#time.sleep(1)	#Pause for 1 second
#ser.write('\x00')
#time.sleep(1)

#ser.write('\x45') #Concert Pitch
#time.sleep(1)

