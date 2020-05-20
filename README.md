# nodeUp
just bash practice :)

update IP address records between nodes without using Dynamic DNS servers. known nodes can be accessed as PUBLIC SPACE keep accounts secure!

# functions:
	-h --help			list help commands
	-l --list			list saved servers from .nodes and check if they are online
	-u --update			update known servers, send my ip address to known hosts
	-cp --copy [src] [dst]		copy a file from/to a known host
	-c --connect [node]		connect to a known host
	-a --add			start the node addition helper, add node to "subnet"
	-i --introduce [node] [node]	introduce two nodes to one another
	--forget [node]			forget given node, remove keys and records
