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
		nodeRadius = nbp_node_radius_find(self); // Set radius of clear space for node
		
		visibleNodes = []; // List of all nbpNodes this node has line of sight to
		if (nbpMakeNBake){ // If make and bake is on bake this node on make
			nbp_node_bake(self);
		}
		
	}
}

function nbp_node_delete(){ // Function to delete a node
	with(other){
		
		nbp_node_unbake(self) // Unbake the node
		
		var replacementNode = nbpNodes[array_length(nbpNodes) - 1]; // Node the replace the current one with
		
		if (replacementNode = self){ // If the node is the last entry in the array just resize the array and destroy
			
			array_resize(nbpNodes, array_length(nbpNodes) - 1) // Resize the nbpNodes array
			
			instance_destroy();
		}
		nbp_node_unbake(replacementNode) // Unbake the replacementNode
		
		nbpNodes[nodesPointer] = replacementNode; // Replace the deleted node with the last entry
		replacementNode.nodesPointer = nodesPointer; // Change its pointer to the new location
		
		array_resize(nbpNodes, array_length(nbpNodes) - 1) // Resize the nbpNodes array
		
		nbp_node_bake(replacementNode) // Rebake the displaced node
		
		instance_destroy(); // Destroy instance after displacing the last node
		
	}
}

function nbp_node_moved(){ // Rebakes the node when after it moves
	with(other){
		// Handle the visibleNodes array
		nbp_node_unbake(self);
		nbp_node_bake(self);
		
		// Change amount of clear space this node has
		nodeRadius = nbp_node_radius_find(self);
		
		// Update blocked for the new position
		if (collision_point(x, y, nbpCollision,true, true))blocked = true;
		else blocked = false;
	}
}