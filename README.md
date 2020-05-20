# nodeUp
just bash practice :)

Update IP address records between nodes without using Dynamic DNS servers. The program mainly uses SSH for operations; therefore all known nodes can be accessed as PUBLIC SPACE keep accounts secure!

Note: preferably create a secured account then copy the script into the users home directory and run as the newly created account...

# Repeater mode
On the first script run you will have the option to decide if the current node should be treated as a repeater. When using the current node as a repeater, the script will introduce all locally known hosts(except noted in .ignore) to the current host being updated before concluding with writing the nodes IP and records to the .nodes file

Ignoring hosts: to prevent the script from transmitting a given host, please add the "node name" of the host into the file .nodes.ignore
### Example cat of .nodes.ignore(create if missing):
```
node1
node3
```
...each node on a new line

# functions:
	-h --help			list help commands
	-l --list			list saved servers from .nodes and check if they are online
	-u --update			update known servers, send my ip address to known hosts
	-cp --copy [src] [dst]		copy a file from/to a known host
	-c --connect [node]		connect to a known host
	-a --add			start the node addition helper, add node to "subnet"
	-i --introduce [node] [node]	introduce two nodes to one another
	--forget [node]			forget given node, remove keys and records
