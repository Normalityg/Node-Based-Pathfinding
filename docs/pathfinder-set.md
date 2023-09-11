# pathfinder_set()

This function sets all the variables that a pathfinder needs to both follow a path and find one. They all have descriptive comments so im not going to go over them here.

### Notable variable ordered by importance:

- movementX: The X that the next node is at. Move towards this to progress on the path.
- movementY: The Y that the next node is at. Move towards this to progress on the path.
- targetNode: The id of the node that this node is pathfinding towards.
- pathTimer: If this number is positive it will count down and when reaching 0 will find a new path from itself to the current targetNode
- arrived: If the node has reached the end of its path or not. Can be stopped from arriving by setting arive to false.
- stuckTimer: A number keeping track of how many frames that the current node has been followed for.
- chasingTarget: A flag keeping track of whether or not the next node is the last node.
- currentNode[0]: this is the id of the node that is being currently being followed.