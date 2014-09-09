import struct
import socket
import select

ICMP_TYPE = 8
ICMP_CODE = 0
ICMP_CHECKSUM = 0
ICMP_ID = 0
ICMP_SEQ_NR = 0

header = struct.pack('bbHHh', ICMP_TYPE, ICMP_CODE, ICMP_CHECKSUM, ICMP_ID, ICMP_SEQ_NR)

try:
	ps = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.getprotobyname('icmp'))
except(socket.error, e):
	print("socket error:%s", e)
	
hostname = input("input host name:")
host = socket.gethostbyname(hostname)

ps.sendto(header, (host, 1))

while 1:
	 iwtd, owtd, ewtd = select.select([ps], [], [], timeout)
	 break
	 if iwtd: 	
		#pong, address = ps.recvfrom(48)
		print(iwtd)
