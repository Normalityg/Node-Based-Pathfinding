function setup(){ // Has necesary variables
	// Macros
	#macro nodes global.pathfindingNodes
	#macro debug global.nodeDebug
	#macro makeBake global.nodeMakeBake
	#macro complexNodes global.complexNodeVisibility
	#macro pathRefining global.autoRefinePathOnFind
	
	#macro nodeCollision obj_wall // Replace this with the object(s) you want the nodes to not make connections through
	
	// Create variables that the nodes and pathfinders need to work
	debug = true;
	makeBake = true;
	complexNodes = false;
	pathRefining = true;
	
	
	nodes = [];
}