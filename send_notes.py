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

ser = serial.Serial('/dev/ttyUSB0', 32077)
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

time.sleep(1)
#Mario!
#1 - E3 E3 E3 C3 E3 G3 G3
playNote('\x40', 0.2) #E3
playNote('\x40', 0.2) #E3
playNote('\x40', 0.2) #E3
playNote('\x3c', 0.2) #C3
playNote('\x40', 0.2) #E3
playNote('\x43', 0.2) #G3
playNote('\x43', 0.2) #G3

#2 - C G E A B A# A G
playNote('\x3c', 0.2) #C3
playNote('\x43', 0.2) #G3
playNote('\x40', 0.2) #E3
playNote('\x39', 0.2) #A3
playNote('\x3b', 0.2) #B3
playNote('\x3a', 0.2) #A#3
playNote('\x39', 0.2) #A3
playNote('\x43', 0.2) #G3

#3 - E G A F G E C D B
#2 - C G E A B A# A G
#3 - E G A F G E C D B
#4 - G F# F D# E
#5 - A A C A C D
#4 - G F# F D# E + C C C
#4 - G F# F D# E
#5 - A A C A C D
#4 - G F# F D# E
#5 - A A C A C D + C# D C


ser.close()
