import serial
import time

def noteOn( str ):
	ser.write('\x90')  #Note on MIDI status message
	ser.write( str )   #Write note number
	ser.write('\x00')  #Write velocity
	return

def noteOff( str ):
	ser.write('\x80')  #Note off MIDI status message
	ser.write( str )   #Write note number
	ser.write(b'\x00')  #Write velocity
	return

def playNote( str, float ):
	noteOn(str)		#Turn note on
	time.sleep(float)	#Sustain for duration
	noteOff(str)		#Turn note off

ser = serial.Serial('/dev/ttyUSB1', 32077)
print ser


playNote('\x40', 0.2)
playNote('\x41', 0.2)
playNote('\x42', 0.2)
playNote('\x43', 0.2)
playNote('\x44', 0.2)
playNote('\x45', 0.2)
playNote('\x46', 0.2)
playNote('\x47', 0.2)
playNote('\x48', 0.2)
playNote('\x49', 0.2)
playNote('\x48', 0.2)
playNote('\x47', 0.2)
playNote('\x46', 0.2)
playNote('\x45', 0.2)
playNote('\x44', 0.2)
playNote('\x43', 0.2)
playNote('\x42', 0.2)
playNote('\x41', 0.2)
playNote('\x40', 0.2)

ser.close()
