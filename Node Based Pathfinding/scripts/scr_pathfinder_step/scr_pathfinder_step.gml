function pathfinder_step(){ // Code that runs during a pathfinders step event
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
				nodesPointer: array_length(nodes), // Set the nodes pointer to an non existent slot in the nodes array
			}
			node_bake_ghost(ghostNode); // Lightly bake the ghost with no return pointers
			
			path = path_a_star(ghostNode, targetNode); // Pathfind from the ghostNode to the targetNode
			if (path = false){ // If the path doesnt exist try again in a few frames
				arrived = true; // Set so that other pathfinding code wont run until a successfu path is found
				pathTimer = irandom_range(1,5); // Try to find a new path in a few frames
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
			if (stuckTime > 60)pathTimer = 0;
			// If something is blocking the target and the last node recalc the path in the next few frames
			if (array_length(path) >= 2)if (collision_line(path[0][0].x + path[0][1], path[0][0].y + path[0][2], path[1][0].x + path[1][1], path[1][0].y + path[1][2], nodeCollision, true, true))pathTimer = irandom_range(0,4);
			
			// If something is blocking the target and this object while its chasing it recalc the path in the next few frames
			if (chasingTarget && collision_line(x, y, path[0][0].x + path[0][1], path[0][0].y + path[0][2], nodeCollision, true, true))pathTimer = irandom_range(0,4);
			
			// Check if its in range of the next node on the path and that its within the node radius then set the next path as the target
			if (point_distance(x, y, currentNode[0].x, currentNode[0].y) < nodeRange && point_distance(x, y, currentNode[0].x, currentNode[0].y) < currentNode[0].nodeRadius){
				if (pathProgress = 0){ // If end of path has been reached
					if (arrive){
						arrived = true; // Set arrived to true and stop the pathfinding code
						chasingTarget = false; // Reset chasingTarget
						//targetNode = undefined; // Make the targetNode unknown
						pathTimer = 30;
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