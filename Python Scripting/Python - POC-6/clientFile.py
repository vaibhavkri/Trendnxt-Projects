import sys
import socket
 
 
def clientFunction():
    
	host ="127.0.0.1"
	port =9898
     
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	
	try :
		s.connect((host, port))
	except Exception as e:
		print 'Unable to connect'
		print e
     
	print 'Connected to remote server. You can type messages'
    	count=0
	while True:
		count+=1
		msg=raw_input("Enter the message to be send ")
		s.send(msg)
		
		#	if count==10000:
		#		break;
			
		data = s.recv(4096)
		
		if not data :
			print '\nDisconnected from chat server'
		elif msg=="exit":
			break
		else :
			print data
			
	s.close()
if __name__=='__main__':
	clientFunction()
