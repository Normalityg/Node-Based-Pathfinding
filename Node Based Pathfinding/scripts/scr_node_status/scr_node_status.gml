function nbp_node_set(){ // Function to start tracking and treating the object as a node
	// Track node and create variables 
	
	// Unique identifier for this node only
	nodeIdentity = nbpNodeCount;
	nbpNodeCount ++;
	
	// Variable denoting if the node is in contact with a collidable
	if (collision_point(x, y, nbpCollision,true, true))nodeBlocked = true;
	else nodeBlocked = false;
	
	// Add node to global array and store a pointer in the node
	nodesPointer = array_length(nbpNodes); // Where in nbpNodes this node is stored
	nbpNodes[nodesPointer] = self;
	
	// Variable creation
	nodeRadius = nbp_node_radius_find(self); // Set radius of clear space for node
	
	// Set the default max distance of the node to the global var
	nodeMaxDistance = nbpNodeDistance;
	
	visibleNodes = []; // List of all nbpNodes this node has line of sight to
	if (nbpMakeNBake){ // If make and bake is on bake this node on make
		nbp_node_bake(self);
	}
	
}

function nbp_node_delete(_nodePointer){ // Function to delete a node
	
	var nodes = nbpNodes;
	var nodesLength = array_length(nodes) - 1;
	
	nbp_node_unbake(nodes[_nodePointer]) // Unbake the node
	
	var replacementNode = nodes[nodesLength]; // Node to replace the current one with
	
	if (_nodePointer = nodesLength){ // If the node is the last entry in the array just resize the array and destroy
		
		array_resize(nodes, nodesLength); // Resize the nbpNodes array
		
		return;
	}
	
	nbp_node_unbake(replacementNode); // Unbake the replacementNode
	
	replacementNode.nodesPointer = _nodePointer; // Change its pointer to the new location
	nodes[_nodePointer] = replacementNode; // Replace the deleted node with the last entry
	
	array_resize(nodes, nodesLength); // Resize the nbpNodes array
	
	nbp_node_bake(replacementNode) // Rebake the displaced node
	
	//instance_destroy(); // Destroy instance after displacing the last node
	
	
}

function nbp_node_moved(){ // Rebakes the node when after it moves
	// Unbake the visibleNodes array
	nbp_node_rebake();
	
	// Change amount of clear space this node has
	nodeRadius = nbp_node_radius_find(self);
	
	// Update blocked for the new position
	if (collision_point(x, y, nbpCollision,true, true))nodeBlocked = true;
	else nodeBlocked = false;
	
}

function nbp_node_exists(_pointer, _identity){ // Check if the nodes pointer is an available pointer then check if that pointer is the same as the node in that pointer using its nodeIdentity
	
	if (_pointer >= array_length(nbpNodes)){ // Check if the pointer is invalid
		return(false); 
	}
	else{ // If the pointer is valid compare the identity at that pointer and the given identity
		if (nbpNodes[_pointer].nodeIdentity != _identity){
			return(false);
		}
	}
	
	// Return the fact that the information is up to date
	return(true);
}