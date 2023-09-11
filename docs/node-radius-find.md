# node_radius_find(nodeId, [maximumRadius] = 128, [steps] = 16)

Returns half the distance to the closest collidable asset up to the maximum radius.

All this function does is repeat checking if there is a collidable asset within the current radius until either it finds something or it reaches the maximum radius without finding anything and returns half the highest value it finds.