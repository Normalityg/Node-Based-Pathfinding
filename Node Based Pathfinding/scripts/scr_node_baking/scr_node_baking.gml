function nbp_node_bake(_node){ // Function for adding new nbpNodes into an already baked network
	
	var thisNode = _node; // Node being baked
	thisNode.visibleNodes = []; // Clear visibleNodes
	var visibleNodeLength = 0; // Track length of visibleNodes
	
	var visibleNodeDistance = thisNode.maxDistance // Store the maxDistance of the node
	
	// Empty array for complexNodes collision checks
	if (nbpComplexNodes)var vecToTarget = [0,0];
	
	for (var i = array_length(nbpNodes) - 1; i >= 0; i --){ // Loop through all nbpNodes to check if they are visible
		
		var targetNode = nbpNodes[i]; // Node being checked for visibility
		
				//var thisRightLineX = (thisNode.x * 2) - thisLeftLineX, thisRightLineY = (thisNode.y * 2) - thisLeftLineY; 
				//var targetRightLineX = (thisNode.x * 2) - targetLeftLineX, targetRightLineY = (thisNode.y * 2) - targetLeftLineY; 
				
		if (visibleNodeDistance < point_distance(thisNode.x,thisNode.y,targetNode.x,targetNode.y))continue; // If the node is further than the max distance dont add
		
		// Check if there is line of sight between the two nbpNodes
		if (!collision_line(thisNode.x,thisNode.y,targetNode.x,targetNode.y,nbpCollision,true,true)){
			if (nbpComplexNodes){ // Shoots two extra raycasts from the edges of each nbpNodes radius
				// Get unit circle pointed at target node
				var directionToTarget = point_direction(thisNode.x,thisNode.y,targetNode.x,targetNode.y);
				vecToTarget[0] = dcos(directionToTarget); 
				vecToTarget[1] = -dsin(directionToTarget);
				// This nbpNodes radius coords
				var thisLeftLineX = -vecToTarget[1] * thisNode.nodeRadius, thisLeftLineY  = vecToTarget[0] * thisNode.nodeRadius; // Left line vec from 0,0
				var thisRightLineX = (thisNode.x) - thisLeftLineX, thisRightLineY = (thisNode.y) - thisLeftLineY; // Reverse the left line vec and add position
				// Target nbpNodes radius coords
				var targetLeftLineX = -vecToTarget[1] * targetNode.nodeRadius, targetLeftLineY  = vecToTarget[0] * targetNode.nodeRadius; // left line vec from 0,0
				var targetRightLineX = (targetNode.x) - targetLeftLineX, targetRightLineY = (targetNode.y) - targetLeftLineY; // Reverse the left line vec and add position
				
				// If either line is blocked dont add visibility
				if (collision_line(thisNode.x + thisLeftLineX, thisNode.y + thisLeftLineY, targetNode.x + targetLeftLineX, targetNode.y + targetLeftLineY,nbpCollision,true,true) || collision_line(thisRightLineX, thisRightLineY, targetRightLineX, targetRightLineY,nbpCollision,true,true))continue;
				
			}
			
			// Add node to thisNode's visibleNodes
			thisNode.visibleNodes[visibleNodeLength] = i; // Add node to visibleNodes
			visibleNodeLength ++; // Update tracked length
			
			// Add thisNode to the target node's visibleNodes
			targetNode.visibleNodes[array_length(targetNode.visibleNodes)] = thisNode.nodesPointer;
			
		}
	}
	
}

function nbp_node_bake_ghost(_node){ // Function for nbpNodes that only want to tap into the network for information
	
	var thisNode = _node; // Node being baked
	thisNode.visibleNodes = []; // Set visibleNodes
	var visibleNodeLength = 0; // Track length of visibleNodes
	
	thisNode.maxDistance = nbpNodeDistance; // Set the ghost nodes maxDistance
	var visibleNodeDistance = thisNode.maxDistance // Store the maxDistance of the node
	
	thisNode.nodeRadius = nbp_node_radius_find(_node) * 2; // Double the ghosts radius to get the max radius
	
	// Empty array for complexNodes collision checks
	if (nbpComplexNodes)var vecToTarget = [0,0];
	
	for (var i = array_length(nbpNodes) - 1; i >= 0; i --){ // Loop through all nbpNodes to check if they are visible
		
		var targetNode = nbpNodes[i]; // Node being checked for visibility
		
		if (visibleNodeDistance < point_distance(thisNode.x,thisNode.y,targetNode.x,targetNode.y))continue; // If the node is further than the max distance dont add
		
		// Check if there is line of sight between the two nbpNodes
		if (!collision_line(thisNode.x,thisNode.y,targetNode.x,targetNode.y,nbpCollision,true,true)){
			if (nbpComplexNodes){ // Shoots two extra raycasts from the edges of each nbpNodes radius
				// Get unit circle pointed at target node
				var directionToTarget = point_direction(thisNode.x,thisNode.y,targetNode.x,targetNode.y);
				vecToTarget[0] = dcos(directionToTarget); 
				vecToTarget[1] = -dsin(directionToTarget);
				// This nbpNodes radius coords
				var thisLeftLineX = -vecToTarget[1] * thisNode.nodeRadius, thisLeftLineY  = vecToTarget[0] * thisNode.nodeRadius; // Left line vec from 0,0
				var thisRightLineX = (thisNode.x) - thisLeftLineX, thisRightLineY = (thisNode.y) - thisLeftLineY; // Reverse the left line vec and add position
				// Target nbpNodes radius coords
				var targetLeftLineX = -vecToTarget[1] * targetNode.nodeRadius, targetLeftLineY  = vecToTarget[0] * targetNode.nodeRadius; // left line vec from 0,0
				var targetRightLineX = (targetNode.x) - targetLeftLineX, targetRightLineY = (targetNode.y) - targetLeftLineY; // Reverse the left line vec and add position
				
				// If either line is blocked dont add visibility
				if (collision_line(thisNode.x + thisLeftLineX, thisNode.y + thisLeftLineY, targetNode.x + targetLeftLineX, targetNode.y + targetLeftLineY,nbpCollision,true,true) || collision_line(thisRightLineX, thisRightLineY, targetRightLineX, targetRightLineY,nbpCollision,true,true))continue;
				
			}
			
			// Add node to thisNode's visibleNodes
			thisNode.visibleNodes[visibleNodeLength] = i; // Add node to visibleNodes
			visibleNodeLength ++; // Update tracked length
			
		}
	}
	
}

function nbp_node_unbake(_node){ // Function for removing a node from other nbpNodes visibleNodes list
	
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
	
	thisNode.visibleNodes = []; // Empty visibleNodes of contents
}

function nbp_node_rebake(){ // Function to rebake the calling object
	var _node = other.id; // Get the calling objects id
	
	// Unbake and rebake the calling node
	nbp_node_unbake(_node);
	nbp_node_bake(_node);
	
}

function nbp_node_bake_all(){ // Function for connecting all nbpNodes to eachother
	
	// Empty array for complexNodes collision checks
	if (nbpComplexNodes)var vecToTarget = [0,0];
	
	for (var i = array_length(nbpNodes) - 1; i >= 0; i --){ // Loop through each node
		
		var thisNode = nbpNodes[i]; // Current node being baked
		thisNode.visibleNodes = []; // Clear visibleNodes
		var visibleNodeLength = 0; // Track length of visibleNodes
		
		var visibleNodeDistance = thisNode.maxDistance // Store the maxDistance of the node
	
		for (var j = array_length(nbpNodes) - 1; j >= 0; j --){ // Loop through all nbpNodes to check if they are visible
			
			var targetNode = nbpNodes[j]; // Node being checked for visibility
			
			if (visibleNodeDistance < point_distance(thisNode.x,thisNode.y,targetNode.x,targetNode.y))continue; // If the node is further than the max distance dont add
			
			// Check if there is line of sight between the two nbpNodes
			if (!collision_line(thisNode.x,thisNode.y,targetNode.x,targetNode.y,nbpCollision,true,true)){
								
				if (nbpComplexNodes){ // Shoots two extra raycasts from the edges of each nbpNodes radius
					var directionToTarget = point_direction(thisNode.x,thisNode.y,targetNode.x,targetNode.y);
					vecToTarget[0] = dcos(directionToTarget); 
					vecToTarget[1] = -dsin(directionToTarget);
					// This nbpNodes radius coords
					var thisLeftLineX = -vecToTarget[1] * thisNode.nodeRadius, thisLeftLineY  = vecToTarget[0] * thisNode.nodeRadius; // Left line vec from 0,0
					var thisRightLineX = (thisNode.x) - thisLeftLineX, thisRightLineY = (thisNode.y) - thisLeftLineY; // Reverse the left line vec and add position
					// Target nbpNodes radius coords
					var targetLeftLineX = -vecToTarget[1] * targetNode.nodeRadius, targetLeftLineY  = vecToTarget[0] * targetNode.nodeRadius; // left line vec from 0,0
					var targetRightLineX = (targetNode.x) - targetLeftLineX, targetRightLineY = (targetNode.y) - targetLeftLineY; // Reverse the left line vec and add position
					
					// If either line is blocked dont add visibility
					if (collision_line(thisNode.x + thisLeftLineX, thisNode.y + thisLeftLineY, targetNode.x + targetLeftLineX, targetNode.y + targetLeftLineY,nbpCollision,true,true) || collision_line(thisRightLineX, thisRightLineY, targetRightLineX, targetRightLineY,nbpCollision,true,true))continue;
					
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