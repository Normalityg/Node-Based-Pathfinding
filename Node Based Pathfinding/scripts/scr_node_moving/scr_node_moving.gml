function node_moving_moved(){ // Rebakes the node when after it moves
	with(other){
		// Handle the visibleNodes array
		node_unbake(self);
		node_bake(self);
		
		// Change amount of clear space this node has
		nodeRadius = node_radius_find(self);
	}
}