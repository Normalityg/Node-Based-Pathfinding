function node_debug_draw(){ // Draw lines for the nodes connections
	if (debug){ // Check if debug has been turned on
		with(other){
			for (var i = array_length(visibleNodes) - 1; i >= 0; i --){ // Draw a line half way to all of its visibleNodes
				draw_line_color(x,y,x + (nodes[visibleNodes[i]].x - x) / 2,y + (nodes[visibleNodes[i]].y - y) / 2, c_blue,c_blue);
			}
		}
	}
}

function node_debug_draw_end(){ // Draw node information
	if (debug){ // If debug has been turned on
		with(other){
			draw_rectangle_color(x - 2,y - 2,x + 2,y + 2,c_black,c_black,c_black,c_black,false); // Draw a rectangle at the nodes position
		}
	}
}