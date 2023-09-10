function node_debug_draw(){ // Draw node information
	if (debug){ // Check if debug has been turned on
		with(other){
			// Draw a line half way to all of its visibleNodes
			for (var i = array_length(visibleNodes) - 1; i >= 0; i --){ 
				
				var targetNode = nodes[visibleNodes[i]];
				
				draw_line_color(x,y,x + (targetNode.x - x) / 2,y + (targetNode.y - y) / 2, c_blue,c_blue);
				
				if (complexNodes){ // Radius's connection lines
					var directionToTarget = point_direction(x,y,targetNode.x,targetNode.y);
					var vecToTarget = [dcos(directionToTarget), -dsin(directionToTarget)];
					
					var thisLeftLineX = x + -vecToTarget[1] * nodeRadius;
					var thisLeftLineY  = y + vecToTarget[0] * nodeRadius;
					
					var thisRightLineX = x + vecToTarget[1] * nodeRadius;
					var thisRightLineY = y + -vecToTarget[0] * nodeRadius;
					
					var targetLeftLineX = targetNode.x + -vecToTarget[1] * targetNode.nodeRadius;
					var targetLeftLineY  = targetNode.y + vecToTarget[0] * targetNode.nodeRadius;
					
					var targetRightLineX = targetNode.x + vecToTarget[1] * targetNode.nodeRadius;
					var targetRightLineY = targetNode.y + -vecToTarget[0] * targetNode.nodeRadius;
					
					draw_line_color(thisLeftLineX, thisLeftLineY, targetLeftLineX, targetLeftLineY, c_blue,c_ltgrey);
					draw_line_color(thisRightLineX, thisRightLineY, targetRightLineX, targetRightLineY, c_blue,c_ltgray);
				}
			}
			
			// Draw a rectangle at the nodes position
			draw_rectangle_color(x - 2,y - 2,x + 2,y + 2,c_black,c_black,c_black,c_black,false);
			
			// Draw a transparent circle showing the nodes radius
			draw_set_alpha(.2);
			draw_circle_color(x,y,nodeRadius,c_white,c_white,false);
			draw_set_alpha(1);
		}
	}
}

function pathfinder_debug_draw(){ // Draw pathfinder information
	if (debug){ // Check if debug has been turned on
		// Draw current path
		if (path != false && array_length(path) > 0){
			for (var i = array_length(path) - 1; i > 0; i --){
				draw_line_color(path[i][0].x + path[i][1], path[i][0].y + path[i][2], path[i - 1][0].x + path[i - 1][1], path[i - 1][0].y + path[i - 1][2],c_aqua,c_aqua);
			}
		}
		// Show whether or not 
		draw_text(x,y,"Arived " + string(arrived));
		draw_text(x,y + 12,"Path progress " + string(pathProgress));
		draw_text(x,y + 24,"Path timer " + string(pathTimer));
		
	}
}