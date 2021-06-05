import sys
import socket
import select

RECV_BUFFER = 4096 
#PORT = 9009

def serverThread(sockfd):
	
	global RECV_BUFFER
	
 
    	while True:
		
		try:		
			data = sockfd.recv(RECV_BUFFER)
			print "message from client is %s "%data
			sockfd.send("Your Message is Recieved by server ")    
			if data=="exit":
				break
		except Exception as e:
			print e
			pass

	sockfd.close()
