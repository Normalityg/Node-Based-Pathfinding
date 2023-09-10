function node_radius_find(_node, _maxRadius = 64, _steps = 8){ // Finds a nodes radius of space without collisions
	// Create variables
	var currentRadius = 0;
	var stepIncrease = _maxRadius / _steps; // How much the radius should increase at each step
	
	while(_steps > 0){
		// Decrement steps and increase the radius
		_steps --;
		currentRadius += stepIncrease;
		
		// Checks at current radius and if something is in contact stop checking and decrease currentRadius
		if (collision_circle(_node.x, _node.y, currentRadius, nodeCollision, false, true)){
			currentRadius -= stepIncrease;
			break;
		}
	}
	
	return(currentRadius) // Return the highest radius that the checks managed to pass
	
}