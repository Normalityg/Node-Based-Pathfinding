function nbp_debug_toggle(){ // Enables and disables the nbpDebug mode
	nbpDebug = !nbpDebug;
}

function nbp_node_debug_draw(){ // Draw node information
	if (nbpDebug){ // Check if nbpDebug has been turned on
		with(other){
			// Create an empty array for drawing complexNodes
			if (nbpComplexNodes)var vecToTarget = [0,0];
			// Draw a line half way to all of its visibleNodes
			for (var i = array_length(visibleNodes) - 1; i >= 0; i --){ 
				
				var targetNode = nbpNodes[visibleNodes[i]];
				
				draw_line_color(x,y,x + (targetNode.x - x) / 2,y + (targetNode.y - y) / 2, c_blue,c_blue);
				
				if (nbpComplexNodes && nbpDebugComplex){ // Radius's connection lines
					// Get unit circle pointed at target node
					var directionToTarget = point_direction(x,y,targetNode.x,targetNode.y);
					vecToTarget[0] = dcos(directionToTarget); 
					vecToTarget[1] = -dsin(directionToTarget);
					// This nbpNodes radius coords
					var thisLeftLineX = -vecToTarget[1] * nodeRadius, thisLeftLineY  = vecToTarget[0] * nodeRadius; // Left line vec from 0,0
					var thisRightLineX = (x) - thisLeftLineX, thisRightLineY = (y) - thisLeftLineY; // Reverse the left line vec and add position
					// Target nbpNodes radius coords
					var targetLeftLineX = -vecToTarget[1] * targetNode.nodeRadius, targetLeftLineY  = vecToTarget[0] * targetNode.nodeRadius; // left line vec from 0,0
					var targetRightLineX = (targetNode.x) - targetLeftLineX, targetRightLineY = (targetNode.y) - targetLeftLineY; // Reverse the left line vec and add position
					
					
					// Draw lines from the edges of this node's radius to the edges of targetNode's radius
					draw_line_color(x + thisLeftLineX, y + thisLeftLineY, targetNode.x + targetLeftLineX, targetNode.y + targetLeftLineY, c_blue,c_blue);
					draw_line_color(thisRightLineX, thisRightLineY, targetRightLineX, targetRightLineY, c_blue,c_blue);
				}
			}
			
			// Draw a rectangle at the nbpNodes position
			draw_rectangle_color(x - 1,y - 1,x + 2,y + 2,c_black,c_black,c_black,c_black,false);
			
			if (nbpComplexNodes && nbpDebugComplex){
				// Draw a transparent circle showing the nbpNodes radius
				draw_set_alpha(.2);
				draw_circle_color(x,y,nodeRadius,c_white,c_white,false);
				draw_set_alpha(1);
				
				// If the nbpNodes radius is low warn
				if (nodeRadius <= 0)draw_text_color(x - 40,y,"No radius",c_maroon,c_maroon,c_maroon,c_maroon,1);
				else if (nodeRadius <= 8)draw_text_color(x - 80,y,"Radius is very low",c_red,c_red,c_red,c_red,1);
				
			}
			
			// Display whether or not the node is unreachable
			if (nodeBlocked && nbpDebugComplex)draw_text_color(x - 40,y - 12,"BLOCKED",c_maroon,c_maroon,c_maroon,c_maroon,1);
		}
	}
}

function nbp_pathfinder_debug_draw(){ // Draw pathfinder information
	if (nbpDebug){ // Check if nbpDebug has been turned on
		// Dont draw if it needs to caculate a new path
		if (pathTimer != -1)return;
		
		// Draw current path
		if (path != false && array_length(path) > 0){
			for (var i = array_length(path) - 1; i > 0; i --){
				if (nbp_node_exists(path[i][3],path[i][4]) && nbp_node_exists(path[i - 1][3],path[i - 1][4]))draw_line_color(path[i][0].x + path[i][1], path[i][0].y + path[i][2], path[i - 1][0].x + path[i - 1][1], path[i - 1][0].y + path[i - 1][2],c_aqua,c_aqua);
			}
			if (nbpDebugComplex)draw_line_color(x, y, currentNode[0].x + currentNode[1], currentNode[0].y + currentNode[2],c_lime,c_lime);
		}
		if (nbpDebugComplex){ // Draw information as lines of text over the pathfinder
			draw_text(x,y,"Arived " + string(arrived)); // Displays if the pathfinder has arrived or not
			draw_text(x,y + 12,"Stuck time " + string(stuckTime)); // How long the pathfinder has been following the current node
			//draw_text(x,y + 24,"" + string()); // Empty slots for debugging the pathfinding
			//draw_text(x,y + 36,"" + string()); // Empty slots for debugging the pathfinding
		}
		
	}
}