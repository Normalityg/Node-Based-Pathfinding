function path_refine(_path, _iterations, _refinePercent = 0.1){ // Function to smooth a path WARNING This does not use complexNodes as its collision and will end up have no space between the collisions
	
	if (array_length(_path) <= 2)return; // Return if there are not enough nodes
	
	var failed = array_create(array_length(_path) - 2); // Array for not calculation something that is proven to fail
	
	repeat(_iterations){
		
		// Get all target points
		for (var i = array_length(_path) - 2; i > 0; i --){
			
			if (failed[i - 1])continue; // If this node's failed flag is set go next
			
			// All node arrays that are needed for this calculation [nodeId, xOffset, yOffset];
			var lastPoint = _path[i + 1];
			var thisPoint = _path[i];
			var nextPoint = _path[i - 1];
			
			// Coordinate math
				// Set coords for the possible new location
			var targetPointX = (nextPoint[0].x + ((lastPoint[0].x + lastPoint[1]) - nextPoint[0].x + nextPoint[1]) / 2);
			var targetPointY = (nextPoint[0].y + ((lastPoint[0].y + lastPoint[2]) - nextPoint[0].y + nextPoint[2]) / 2);
				// Set coords for the current location
			var thisPointCalcedX = thisPoint[0].x + thisPoint[1];
			var thisPointCalcedY = thisPoint[0].y + thisPoint[2];
				// Set coords for the difference between the current and possible new location
			var pointDifferenceX = (targetPointX - thisPointCalcedX) * _refinePercent;
			var pointDifferenceY = (targetPointY - thisPointCalcedY) * _refinePercent;
				// Set coords for the possible new location
			var finalPointX = thisPointCalcedX + pointDifferenceX;
			var finalPointY = thisPointCalcedY + pointDifferenceY;
			
			// Move a percent of the way to the target points and if there is no collision save the offset
			if (!collision_line(finalPointX, finalPointY, lastPoint[0].x + lastPoint[1], lastPoint[0].y + lastPoint[2], nodeCollision,true,true) && !collision_line(finalPointX, finalPointY, nextPoint[0].x + nextPoint[1], nextPoint[0].y + nextPoint[2], nodeCollision,true,true)){
				thisPoint[1] += pointDifferenceX; 
				thisPoint[2] += pointDifferenceY; 
				continue;
			}
			
			failed[i - 1] = true; // Set the failed flag if there was a collision
			
		}
	}
}