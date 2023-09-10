function node_debug_draw(){ // Draw lines for the nodes connections
	if (debug){ // Check if debug has been turned on
		with(other){
			// Draw a line half way to all of its visibleNodes
			for (var i = array_length(visibleNodes) - 1; i >= 0; i --){ 
				draw_line_color(x,y,x + (nodes[visibleNodes[i]].x - x) / 2,y + (nodes[visibleNodes[i]].y - y) / 2, c_blue,c_blue);
			}
			
			// Draw a rectangle at the nodes position
			draw_rectangle_color(x - 2,y - 2,x + 2,y + 2,c_black,c_black,c_black,c_black,false);
			
			// Draw the radius of the node
			draw_circle_color(x,y,nodeRadius,c_black,c_black,true);
		}
	}
}