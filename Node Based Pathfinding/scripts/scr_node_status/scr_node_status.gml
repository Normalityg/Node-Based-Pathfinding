function node_set(){ // Function to start tracking and treating the object as a node
	// Track node and create variables 
	with(other){
		// Add node to global array and store a pointer in the node
		nodesPointer = array_length(nodes); // Where in nodes this node is stored
		nodes[nodesPointer] = self;
		
		// Variable creation
		visibleNodes = []; // List of all nodes this node has line of sight to
		
		
		if (makeBake){ // Make and bake is on bake this node on make (;
			node_bake(self);
		}
	}
}

function node_delete(){ // Function can fail to fully delete an entry and cause an error.
	with(other){
		
		node_unbake(self) // Unbake the node
		
		var replacementNode = nodes[array_length(nodes) - 1]; // Node the replace the current one with
		
		if (replacementNode = self){ // If the node is the last entry in the array just resize the array and return
			
			array_resize(nodes, array_length(nodes) - 1) // Resize the nodes array
			return;
		}
		node_unbake(replacementNode) // Unbake the replacementNode
		
		nodes[nodesPointer] = replacementNode; // Replace the deleted node with the last entry
		replacementNode.nodesPointer = nodesPointer; // Change its pointer to the new location
		
		array_resize(nodes, array_length(nodes) - 1) // Resize the nodes array
		
		node_bake(replacementNode) // Rebake the displaced node
		
	}
}