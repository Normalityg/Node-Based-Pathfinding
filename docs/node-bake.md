# node_bake(nodeId)

This function adds all nodes that the given node can see to an array. This function should only be run if the node is not yet baked or your pathfinding time might increase immensly.

It loops through every entry of global.nbpNodesList and checks if it has line of sight with them. If they do have line of sight it will see if it needs to check the edges of its radius too. If all the checks come back alright it adds the current nodes pointer in the nodes list to its list of visibleNodes and adds it own pointer to the list of the other node too.