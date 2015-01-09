import serial
import time

ser = serial.Serial('/dev/ttyUSB0', 38400)
print ser
#Switch middle C on.
ser.write('\x90')
time.sleep(1)	#Pause for 1 second
ser.write('\x3c')
time.sleep(1)
ser.write('\x00')
time.sleep(1)
#Switch middle C off
ser.write('\x80')
time.sleep(1)	#Pause for 1 second
ser.write('\x3c')
time.sleep(1)
ser.write('\x00')
time.sleep(1)
