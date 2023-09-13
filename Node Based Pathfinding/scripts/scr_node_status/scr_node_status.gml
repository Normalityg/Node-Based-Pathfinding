function nbp_node_set(){ // Function to start tracking and treating the object as a node
	// Track node and create variables 
	with(other){
		// Variable denoting if the node is in contact with a collidable
		if (collision_point(x, y, nbpCollision,true, true))blocked = true;
		else blocked = false;
		
		// Add node to global array and store a pointer in the node
		nodesPointer = array_length(nbpNodes); // Where in nbpNodes this node is stored
		nbpNodes[nodesPointer] = id;
		
		// Variable creation
		nodeRadius = nbp_node_radius_find(id); // Set radius of clear space for node
		
		// Set the default max distance of the node to the global var
		maxDistance = nbpNodeDistance;
		
		visibleNodes = []; // List of all nbpNodes this node has line of sight to
		if (nbpMakeNBake){ // If make and bake is on bake this node on make
			nbp_node_bake(id);
		}
		
	}
}

function nbp_node_delete(_nodePointer){ // Function to delete a node
	
	var nodes = nbpNodes;
	var nodesLength = array_length(nodes) - 1;
	
	nbp_node_unbake(nodes[_nodePointer]) // Unbake the node
	
	var replacementNode = nodes[nodesLength]; // Node to replace the current one with
	
	if (replacementNode = id){ // If the node is the last entry in the array just resize the array and destroy
		
		array_resize(nodes, nodesLength); // Resize the nbpNodes array
		
		return;
	}
	
	nbp_node_unbake(replacementNode); // Unbake the replacementNode
	
	//show_debug_message("First " + string(replacementNode.nodesPointer));
	replacementNode.nodesPointer = _nodePointer; // Change its pointer to the new location
	nodes[_nodePointer] = replacementNode; // Replace the deleted node with the last entry
	//show_debug_message("Second " + string(replacementNode.nodesPointer));
	array_resize(nodes, nodesLength); // Resize the nbpNodes array
	
	nbp_node_bake(replacementNode) // Rebake the displaced node
	
	//instance_destroy(); // Destroy instance after displacing the last node
	
}

function nbp_node_moved(){ // Rebakes the node when after it moves
	with(other){
		// Handle the visibleNodes array
		nbp_node_rebake();
		
		// Change amount of clear space this node has
		nodeRadius = nbp_node_radius_find(self);
		
		// Update blocked for the new position
		if (collision_point(x, y, nbpCollision,true, true))blocked = true;
		else blocked = false;
	}
}