function pathfinder_set(){
	// Create variables in the pathfinder
	with(other){
		targetNode = obj_mouse.id; // The node that is being pathed to
		
		currentNode = -1; // Curent node being traveled to [node, xOffset, yOffset]
		movementTargetLocation = [0,0]; // Where in the world the next node is
		
		pathTimer = 5; // Timer that when hits zero recalculates path
		path = []; // List of nodes decided by the pathfinding algorithm to reach the targetNode [node, xOffset, yOffset]
		pathProgress = -1; // How far into the nodePath array the currentNode is
		
		nodeRange = 32; // Number of pixels distance from a node for the pathfinder to move onto the next node
		
		stuckTime = 0; // How long a specific node has been targeted useful for if the pathfinder is stuck and needs to rerun pathfinding
		
		// Flags
		chasingTarget = false; // Is on if the targetNode is the next node
		arrive = true; // If this is false the pathfinder will not stop chasing the target node unless manually told to stop
		arrived = true; // Whether or not to keep trying to path towards the next node
	}
}