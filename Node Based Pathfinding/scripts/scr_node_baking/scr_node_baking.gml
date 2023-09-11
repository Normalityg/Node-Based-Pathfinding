function node_bake(_node){ // Function for adding new nbpNodes into an already baked network
	
	var thisNode = _node; // Node being baked
	thisNode.visibleNodes = []; // Clear visibleNodes
	var visibleNodeLength = 0; // Track length of visibleNodes
	
	for (var i = array_length(nbpNodes) - 1; i >= 0; i --){ // Loop through all nbpNodes to check if they are visible
		
		var targetNode = nbpNodes[i]; // Node being checked for visibility
		
		if (nbpNodeDistance < point_distance(thisNode.x,thisNode.y,targetNode.x,targetNode.y))continue; // If the node is further than the max distance dont add
		
		// Check if there is line of sight between the two nbpNodes
		if (!collision_line(thisNode.x,thisNode.y,targetNode.x,targetNode.y,nbpCollision,true,true)){
			if (nbpComplexNodes){ // Shoots two extra raycasts from the edges of each nbpNodes radius
				// Get unit circle pointed at target node
				var directionToTarget = point_direction(thisNode.x,thisNode.y,targetNode.x,targetNode.y);
				var vecToTarget = [dcos(directionToTarget), -dsin(directionToTarget)];
				// This nbpNodes radius coords
				var thisLeftLineX = thisNode.x + -vecToTarget[1] * thisNode.nodeRadius, thisLeftLineY  = thisNode.y + vecToTarget[0] * thisNode.nodeRadius; // Left line
				var thisRightLineX = thisNode.x + vecToTarget[1] * thisNode.nodeRadius, thisRightLineY = thisNode.y + -vecToTarget[0] * thisNode.nodeRadius; // Right line
				// Target nbpNodes radius coords
				var targetLeftLineX = targetNode.x + -vecToTarget[1] * targetNode.nodeRadius, targetLeftLineY  = targetNode.y + vecToTarget[0] * targetNode.nodeRadius; // Left line
				var targetRightLineX = targetNode.x + vecToTarget[1] * targetNode.nodeRadius, targetRightLineY = targetNode.y + -vecToTarget[0] * targetNode.nodeRadius; // Right line
				
				// If either line is blocked dont add visibility
				if (collision_line(thisLeftLineX, thisLeftLineY, targetLeftLineX, targetLeftLineY,nbpCollision,true,true) || collision_line(thisRightLineX, thisRightLineY, targetRightLineX, targetRightLineY,nbpCollision,true,true))continue;
				
			}
			
			// Add node to thisNode's visibleNodes
			thisNode.visibleNodes[visibleNodeLength] = i; // Add node to visibleNodes
			visibleNodeLength ++; // Update tracked length
			
			// Add thisNode to the target node's visibleNodes
			targetNode.visibleNodes[array_length(targetNode.visibleNodes)] = thisNode.nodesPointer;
			
		}
	}
	
}

function node_bake_ghost(_node){ // Function for nbpNodes that only want to tap into the network for information
	
	var thisNode = _node; // Node being baked
	thisNode.visibleNodes = []; // Set visibleNodes
	var visibleNodeLength = 0; // Track length of visibleNodes
	
	thisNode.nodeRadius = node_radius_find(_node) * 2; // Double the ghosts radius to get the max radius
	
	for (var i = array_length(nbpNodes) - 1; i >= 0; i --){ // Loop through all nbpNodes to check if they are visible
		
		var targetNode = nbpNodes[i]; // Node being checked for visibility
		
		if (nbpNodeDistance < point_distance(thisNode.x,thisNode.y,targetNode.x,targetNode.y))continue; // If the node is further than the max distance dont add
		
		// Check if there is line of sight between the two nbpNodes
		if (!collision_line(thisNode.x,thisNode.y,targetNode.x,targetNode.y,nbpCollision,true,true)){
			if (nbpComplexNodes){ // Shoots two extra raycasts from the edges of each nbpNodes radius
				// Get unit circle pointed at target node
				var directionToTarget = point_direction(thisNode.x,thisNode.y,targetNode.x,targetNode.y);
				var vecToTarget = [dcos(directionToTarget), -dsin(directionToTarget)];
				// This nbpNodes radius coords
				var thisLeftLineX = thisNode.x + -vecToTarget[1] * thisNode.nodeRadius, thisLeftLineY  = thisNode.y + vecToTarget[0] * thisNode.nodeRadius; // Left line
				var thisRightLineX = thisNode.x + vecToTarget[1] * thisNode.nodeRadius, thisRightLineY = thisNode.y + -vecToTarget[0] * thisNode.nodeRadius; // Right line
				// Target nbpNodes radius coords
				var targetLeftLineX = targetNode.x + -vecToTarget[1] * targetNode.nodeRadius, targetLeftLineY  = targetNode.y + vecToTarget[0] * targetNode.nodeRadius; // Left line
				var targetRightLineX = targetNode.x + vecToTarget[1] * targetNode.nodeRadius, targetRightLineY = targetNode.y + -vecToTarget[0] * targetNode.nodeRadius; // Right line
				
				// If either line is blocked dont add visibility
				if (collision_line(thisLeftLineX, thisLeftLineY, targetLeftLineX, targetLeftLineY,nbpCollision,true,true) || collision_line(thisRightLineX, thisRightLineY, targetRightLineX, targetRightLineY,nbpCollision,true,true))continue;
				
			}
			
			// Add node to thisNode's visibleNodes
			thisNode.visibleNodes[visibleNodeLength] = i; // Add node to visibleNodes
			visibleNodeLength ++; // Update tracked length
			
		}
	}
	
}

function node_unbake(_node){ // Function for removing a node from other nbpNodes visibleNodes list
	
	var thisNode = _node; // Node being unbaked
	
	for (var i = array_length(thisNode.visibleNodes) - 1; i >= 0; i --){ // Loop through all visibleNodes to remove self from them
		
		var targetNode = nbpNodes[thisNode.visibleNodes[i]]; // Node to be removed from
		
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

function node_bake_all(){ // Function for connecting all nbpNodes to eachother
	
	for (var i = array_length(nbpNodes) - 1; i >= 0; i --){ // Loop through each node
		
		var thisNode = nbpNodes[i]; // Current node being baked
		thisNode.visibleNodes = []; // Clear visibleNodes
		var visibleNodeLength = 0; // Track length of visibleNodes
		
		for (var j = array_length(nbpNodes) - 1; j >= 0; j --){ // Loop through all nbpNodes to check if they are visible
			
			var targetNode = nbpNodes[j]; // Node being checked for visibility
			
			if (nbpNodeDistance < point_distance(thisNode.x,thisNode.y,targetNode.x,targetNode.y))continue; // If the node is further than the max distance dont add
			
			// Check if there is line of sight between the two nbpNodes
			if (!collision_line(thisNode.x,thisNode.y,targetNode.x,targetNode.y,nbpCollision,true,true)){
								
				if (nbpComplexNodes){ // Shoots two extra raycasts from the edges of each nbpNodes radius
					// Get unit circle pointed at target node
					var directionToTarget = point_direction(thisNode.x,thisNode.y,targetNode.x,targetNode.y);
					var vecToTarget = [dcos(directionToTarget), -dsin(directionToTarget)];
					// This nbpNodes radius coords
					var thisLeftLineX = thisNode.x + -vecToTarget[1] * thisNode.nodeRadius, thisLeftLineY  = thisNode.y + vecToTarget[0] * thisNode.nodeRadius; // Left line
					var thisRightLineX = thisNode.x + vecToTarget[1] * thisNode.nodeRadius, thisRightLineY = thisNode.y + -vecToTarget[0] * thisNode.nodeRadius; // Right line
					// Target nbpNodes radius coords
					var targetLeftLineX = targetNode.x + -vecToTarget[1] * targetNode.nodeRadius, targetLeftLineY  = targetNode.y + vecToTarget[0] * targetNode.nodeRadius; // Left line
					var targetRightLineX = targetNode.x + vecToTarget[1] * targetNode.nodeRadius, targetRightLineY = targetNode.y + -vecToTarget[0] * targetNode.nodeRadius; // Right line
					
					// If either line is blocked dont add visibility
					if (collision_line(thisLeftLineX, thisLeftLineY, targetLeftLineX, targetLeftLineY,nbpCollision,true,true) || collision_line(thisRightLineX, thisRightLineY, targetRightLineX, targetRightLineY,nbpCollision,true,true))continue;
				}
				// Add node to thisNode's visibleNodes
				thisNode.visibleNodes[visibleNodeLength] = j; // Add node to visibleNodes
				visibleNodeLength ++; // Update tracked length
				
			}
		}
		
	}
	// Toggle nbpMakeNBake so all future nbpNodes are automatically connected to current nbpNodes
	nbpMakeNBake = true;
}