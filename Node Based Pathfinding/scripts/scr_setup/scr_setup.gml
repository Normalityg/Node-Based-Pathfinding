function setup(){ // Has necesary variables
	// Macros
	#macro nodes global.pathfindingNodes
	#macro debug global.nodeDebug
	#macro makeBake global.nodeMakeBake
	#macro complexNodes global.complexNodeVisibility
	#macro nodeDistance global.maxNodeDistance
	
	#macro nodeCollision obj_wall // Replace this with the object(s) you want the nodes to not make connections through
	
	// Create variables that the nodes and pathfinders need to work
	debug = false;
	makeBake = true;
	complexNodes = true;
	nodeDistance = 256;
	
	
	nodes = [];
}