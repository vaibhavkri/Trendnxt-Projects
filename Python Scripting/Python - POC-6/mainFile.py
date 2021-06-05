import thread
import time
from serverFile import serverThread
import socket

PORT=9898
RECV_BUFFER = 4096

def startServerThread():
	global PORT
	try:
		
		server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR,1)
		server_socket.bind(('', PORT))
		server_socket.listen(10)
		print 'main server started'
		while True:
			sockfd, addr = server_socket.accept()
			print "connection accepted "
			thread.start_new_thread(serverThread,(sockfd,))
			
	except Exception as e:
		print e

if __name__=='__main__':
	startServerThread()
