function nbp_pathfinder_set(){
	// Create variables in the pathfinder
	with(other){
		targetNode = -1; // The node that is being pathed to
		
		currentNode = -1; // Curent node being traveled to [node, xOffset, yOffset]
		
		// Where in the world the next node on the path is at
		movementX = x; // Start going to self x
		movementY = y; // Start going to self y
		
		pathTimer = -1; // Timer that when hits zero recalculates path
		path = []; // List of nbpNodes decided by the pathfinding algorithm to reach the targetNode [node, xOffset, yOffset]
		pathProgress = -1; // How far into the nodePath array the currentNode is
		
		nodeRange = 32; // Number of pixels distance from a node for the pathfinder to move onto the next node
		
		stuckTime = 0; // How long a specific node has been targeted useful for if the pathfinder is stuck and needs to rerun pathfinding
		
		// Flags
		chasingTarget = false; // Is on if the targetNode is the next node
		arrive = true; // If this is false the pathfinder will not stop chasing the target node unless manually told to stop
		arrived = true; // Whether or not to keep trying to path towards the next node
	}
}