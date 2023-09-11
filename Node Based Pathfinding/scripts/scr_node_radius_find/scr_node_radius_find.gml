function node_radius_find(_node, _maxRadius = 128, _steps = 16){ // Finds a nbpNodes radius of space without collisions
	// Create variables
	var currentRadius = 0;
	var stepIncrease = _maxRadius / _steps; // How much the radius should increase at each step
	
	while(_steps > 0){
		// Decrement steps and increase the radius
		_steps --;
		currentRadius += stepIncrease;
		
		// Checks at current radius and if something is in contact stop checking and decrease currentRadius
		if (collision_circle(_node.x, _node.y, currentRadius, nbpCollision, false, true)){
			currentRadius -= stepIncrease;
			break;
		}
	}
	
	return(currentRadius * 0.5); // Return half of the highest radius that the checks managed to pass
	
}