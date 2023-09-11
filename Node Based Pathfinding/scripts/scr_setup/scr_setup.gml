// Macros
#macro nbpNodes global.nbpNodesList
#macro nbpDebug global.nbpFlagDebug
#macro nbpMakeNBake global.nbpFlagBakeNewNodes
#macro nbpComplexNodes global.nbpFlagComplexNodeVisibility
#macro nbpNodeDistance global.nbpMaxNodeDistance

#macro nbpCollision obj_wall // Replace this with the asset(s) you want the nbpNodes to not make connections through

function setup(){ // Has necesary variables
	
	// Create variables that the nbpNodes and pathfinders need to work
	nbpDebug = false;
	nbpMakeNBake = true;
	nbpComplexNodes = true;
	nbpNodeDistance = 512;
	
	// Set the array of nodes to empty
	nbpNodes = [];
}