function pathfinder_set(){
	// Create variables in the pathfinder
	with(other){
		targetNode = -1; // Location in the node list of final destination
		movementTargetLocation = [0,0]; // Where in the world the next node is
		
		nodePath = []; // List of nodes decided by algorithm to reach the targetNode [node, xOffset, yOffset]
		currentNode = -1; // Curent node being traveled to [node, xOffset, yOffset]
		nodePathProgress = -1; // How far into the nodePath array the currentNode is
		
		closestNode = -1; // Closest node to self
	}
}