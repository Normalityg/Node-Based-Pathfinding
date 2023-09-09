function node_moving_moved(){ // Rebakes the node when after it moves
	with(other){
		node_unbake(self);
		node_bake(self);
	}
}