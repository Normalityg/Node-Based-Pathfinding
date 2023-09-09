function node_bake(_node){ // Function for adding new nodes into an already baked network
	
	var thisNode = _node; // Node being baked
	thisNode.visibleNodes = []; // Clear visibleNodes
	var visibleNodeLength = 0; // Track length of visibleNodes
	
	for (var i = array_length(nodes) - 1; i >= 0; i --){ // Loop through all nodes to check if they are visible
		
		var targetNode = nodes[i]; // Node being checked for visibility
		
		// Check if there is line of sight between the two nodes
		if (!collision_line(thisNode.x,thisNode.y,targetNode.x,targetNode.y,nodeCollision,true,true)){
			// Add node to thisNode's visibleNodes
			thisNode.visibleNodes[visibleNodeLength] = i; // Add node to visibleNodes
			visibleNodeLength ++; // Update tracked length
			
			// Add thisNode to the target node's visibleNodes
			targetNode.visibleNodes[array_length(targetNode.visibleNodes)] = thisNode.nodesPointer;
		}
	}
	
}

function node_unbake(_node){ // Function for removing a node from other nodes visibleNodes list
	
	var thisNode = _node; // Node being unbaked
	
	for (var i = array_length(thisNode.visibleNodes) - 1; i >= 0; i --){ // Loop through all visibleNodes to remove self from them
		
		var targetNode = nodes[thisNode.visibleNodes[i]]; // Node to be removed from
		
		for (var j = array_length(targetNode.visibleNodes) - 1; j >= 0; j --){ // Find self in the targetNode's visibleNodes and remove it
			
			if (targetNode.visibleNodes[j] = thisNode.nodesPointer){ // If this entry is what was being looked for
				// Remove node from visibleNodes
				targetNode.visibleNodes[j] = targetNode.visibleNodes[array_length(targetNode.visibleNodes) - 1]; // Replace self with last entry in visibleNodes
				array_resize(targetNode.visibleNodes, array_length(targetNode.visibleNodes) - 1); // Shorten visibleNodes to let everything know
				
				break;
			}
			
		}
		
	}
	
	_node.visibleNodes = []; // Empty visibleNodes of contents
}

function node_bake_all(){ // Function for connecting all nodes to eachother
	
	var bakeStartTime = get_timer();
	
	for (var i = array_length(nodes) - 1; i >= 0; i --){ // Loop through each node
		
		var thisNode = nodes[i]; // Current node being baked
		thisNode.visibleNodes = []; // Clear visibleNodes
		var visibleNodeLength = 0; // Track length of visibleNodes
		
		for (var j = array_length(nodes) - 1; j >= 0; j --){ // Loop through all nodes to check if they are visible
			
			var targetNode = nodes[j]; // Node being checked for visibility
			
			// Check if there is line of sight between the two nodes
			if (!collision_line(thisNode.x,thisNode.y,targetNode.x,targetNode.y,nodeCollision,true,true)){
				thisNode.visibleNodes[visibleNodeLength] = j; // Add node to visibleNodes
				visibleNodeLength ++; // Update tracked length
			}
		}
		
	}
	
	show_debug_message("Time to bake was" + string(get_timer() - bakeStartTime));
	// Toggle makeBake so all future nodes are automatically connected to current nodes
	makeBake = true;
}