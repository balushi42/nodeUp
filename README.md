# Introduction

Update IP address records between nodes without using Dynamic DNS servers. The program mainly uses SSH & SCP for operations, to do so the script mainly relies on SSH Keys, managing the Node Name to ip:user:port:key translation. To link nodes or to create a new subnet you need 2 seperate nodes with different IP at minimum, the script offers an add and introduce flags which can be used to add a node to the subnet or introduce two nodes reducing the chain length. The script can also be run periodically to update known nodes with latest IP Address(from the ssh variables).

Information stored and accessable by the nodes account may be tampered with by others who have access to the subnet; therefore assume nodes as PUBLIC SPACE keep accounts secure!
Note: preferably create a secured account then copy the script into the users home directory and run as the newly created account...

# Usage
To setup the current user as a node use following commands:
	
	chmod +x nodeUP
	./nodeUP

for docker see below

# Repeater mode
On the first script run you will have the option to decide if the current node should be treated as a repeater. When using the current node as a repeater, the script will introduce all locally known hosts(except noted in .ignore) to the current remote node being updated. Then the script concludes by writing the local IP into the remote node '.nodes' file

Ignoring hosts: to prevent the script from transmitting a given host, please add the "node name" of the host into the file .nodes.ignore
### Example cat of .nodes.ignore(create if missing):

	node1
	node3

...each node on a new line

# functions:
	-h --help			list help commands
	-l --list			list saved servers from .nodes and check if they are online
	-u --update			update known servers, send my ip address to known hosts
	-cp --copy [src] [dst]		copy a file from/to a known host (SCP)
	-c --connect [node]		connect to a known host (SSH)
	-a --add			start the node addition helper, add node to "subnet"
	-i --introduce [node] [node]	introduce two nodes to one another
	-f --forget [node]		forget given node, remove keys and records from both local and remote nodes
	--force [node]			forget given node, remove keys and records ONLY the local node

# Docker
Edit the "config" file before building! specify node name and port used. commands:

	docker build -t node .
	#start container & ssh service
	docker run -dt --rm --publish=2221:22 --name node1 node
	#open bash shell as root user
	docker exec -it node1 /bin/bash
	

# Known issues
- ssh from some clients into docker nodes gives error? putty specifically
