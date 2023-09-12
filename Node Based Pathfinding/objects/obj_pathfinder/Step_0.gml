
if (global.randomNode){ // Logic for pathfinding behaviour before the pathfinder_step
	
	if (targetNode = obj_mouse.id || arrived = true){ // If the target is the mouse or the path was finished
		arrive = true; // Arrive to the target node (does not need to be set each time)
		
		targetNode = nbpNodes[irandom_range(0, array_length(nbpNodes) - 1)]; // Target is set to a random node
		show_debug_message(nbpNodes);
		pathTimer = 0;
	}
	
}
else {
	if (targetNode != obj_mouse.id){
		arrive = false; // Dont stop chasing the target
		targetNode = obj_mouse.id; // make the target the mouse
		pathTimer = 0; // Path at next opportunity
	}
	
}

nbp_pathfinder_step();

if (stuckTime > 120)pathTimer = 0; // Recalculate path if on the same node for 2 seconds

var movex = clamp((movementX - x) / 32, - 4, 4) //+ random_range(-1,1);
var movey = clamp((movementY - y) / 32, - 4, 4) //+ random_range(-1,1);

move_and_collide(movex,movey,obj_wall);