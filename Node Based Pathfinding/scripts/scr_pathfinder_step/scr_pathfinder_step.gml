function nbp_pathfinder_step(){ // Code that runs during a pathfinders step event
	with(other){
		if (pathTimer > 0)pathTimer -= 1; // Count down till a new path is calculated
		if (pathTimer = 0 && targetNode != undefined){ // When timer is over get new path
			pathTimer = -1; // Put timer out of use
			arrived = false; // Unset flag to indicate its now traveling to somewhere
			chasingTarget = false;
			
			// Create a ghost node
			var ghostNode = {
				x: other.x,
				y: other.y,
				nodesPointer: array_length(nbpNodes), // Set the nbpNodes pointer to an non existent slot in the nbpNodes array
			}
			nbp_node_bake_ghost(ghostNode); // Lightly bake the ghost with no return pointers
			
			path = nbp_path_a_star(ghostNode, targetNode.id); // Pathfind from the ghostNode to the targetNode
			if (path = false){ // If the path doesnt exist try again in a few frames
				arrived = true; // Set so that other pathfinding code wont run until a successfu path is found
				path = []; // Get rid of current path 
				pathTimer = irandom_range(10,30); // Try to find a new path in up to half a second
				return;
			}
			
			array_resize(path, array_length(path) - 1); // Resize the array removing the ghost node from it
			pathProgress = array_length(path) - 1; // Start at the last node
			
			currentNode = path[pathProgress]; // Set currentNode to the last node in the list
			
			stuckTime  = 0; // Set stucktime to 0
			if (pathProgress = 0)chasingTarget = true; // Set chasing target if the target is next
		}
		
		// If the pathfinding is running
		if (arrived = false){
			// Add to the stuck time
			stuckTime ++;
			
			// If something is blocking the target and the last node recalc the path in the next few frames
			if (pathTimer = -1 && array_length(path) >= 2)if (collision_line(path[0][0].x + path[0][1], path[0][0].y + path[0][2], path[1][0].x + path[1][1], path[1][0].y + path[1][2], nbpCollision, true, true))pathTimer = irandom_range(0,3);
			
			if (collision_line(x, y, path[0][0].x + path[0][1], path[0][0].y + path[0][2], nbpCollision, true, true)){ // If something is blocking the pathfinder from the targetNode
				if (pathTimer = -1 && chasingTarget)pathTimer = irandom_range(0,3);
			}
			else if (!chasingTarget && point_distance(x, y, path[0][0].x + path[0][1], path[0][0].y + path[0][2]) < nbpNodeDistance){ // Otherwise the targetNode is visible and in range check the switch to the last node in the path
				var canSeeTarget = !nbpComplexNodes; // If complexNodes is enabled it isnt sure it can see yet
				
				if (nbpComplexNodes){ // Check from the edge of the sprite
					// Get the distance to the closest collidable
					var nodeRadius = nbp_node_radius_find(self) * 2;
					// Get unit circle pointed at target node
					var directionToTarget = point_direction(x,y,targetNode.x,targetNode.y);
					var vecToTarget = [dcos(directionToTarget), -dsin(directionToTarget)];
					// This nbpNodes radius coords
					var thisLeftLineX = -vecToTarget[1] * nodeRadius, thisLeftLineY  = vecToTarget[0] * nodeRadius; // left line vec from 0,0
					var thisRightLineX = (x) - thisLeftLineX, thisRightLineY = (y) - thisLeftLineY; // Reverse the left line vec and add position
					// Target nbpNodes radius coords
					var targetLeftLineX = -vecToTarget[1] * targetNode.nodeRadius, targetLeftLineY  = vecToTarget[0] * targetNode.nodeRadius; // left line vec from 0,0
					var targetRightLineX = (targetNode.x) - targetLeftLineX, targetRightLineY = (targetNode.y) - targetLeftLineY; // Reverse the left line vec and add position
					
					// If either line is blocked dont add visibility
					if (!collision_line(x + thisLeftLineX, y + thisLeftLineY, targetNode.x + targetLeftLineX, targetNode.y + targetLeftLineY,nbpCollision,true,true) && !collision_line(thisRightLineX, thisRightLineY, targetRightLineX, targetRightLineY,nbpCollision,true,true))canSeeTarget = true;
					
				}
				
				if (canSeeTarget){
					pathProgress = 0; // Set path progress to last node
					
					chasingTarget = true; // Set chasing target
					
					currentNode = path[pathProgress]; // Set currentNode to the new node
					stuckTime  = 0; // Reset stuckTime
				}
			}
			
			// If the targetNode has changed recalculate the path
			if (targetNode.id != path[0][0].id)pathTimer = 0;
			
			// Check if its in range of the next node on the path and that its within the node radius then set the next path as the target
			if (point_distance(x, y, currentNode[0].x + currentNode[1], currentNode[0].y + currentNode[2]) < nodeRange && point_distance(x, y, currentNode[0].x + currentNode[1], currentNode[0].y + currentNode[2]) < currentNode[0].nodeRadius){
				if (pathProgress = 0){ // If end of path has been reached
					if (arrive){
						arrived = true; // Set arrived to true and stop the pathfinding code
						chasingTarget = false; // Reset chasingTarget
						
						path = []; // Clear path array
						
						targetNode = undefined; // Stop the pathfinder from trying to path to what it already found
						
						pathTimer = -1; // Stop any currentPath timers
					}
				}
				else{ // Everything as normal
					pathProgress --;
					
					currentNode = path[pathProgress]; // Set currentNode to the new node
					
					stuckTime  = 0;// Reset stuckTime
					
					// Set chasingTarget flag when the next node is the target
					if (pathProgress = 0)chasingTarget = true;
					else chasingTarget = false;
				}
			}
			
			// Update the movementX and movementY with currentNode's location
			movementX = currentNode[0].x + currentNode[1];
			movementY = currentNode[0].y + currentNode[2];
			
		}
	}
}