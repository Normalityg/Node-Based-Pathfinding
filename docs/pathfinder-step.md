# pathfinder_step()

This function runs all the pathfinding code for the pathfinder and keeps track of [useful variables](/docs/pathfinder-set.md).

## The function is split into two sections



### Finding a new path:

It starts out by seeing if it needs to find a new path to its destination. If it does it will create a ghost node at its location then find the shortest path from the ghost node to the target node and store it in path. It then resizes path to chop off the ghost node and sets up variables for following the path.

### And Following the current path

Starting with checking if it has arrived to its goal yet if not, it checks four things, are the last two nodes on the path still in line of sight(not complex), if the target is the next node and is still in line of sight, if the target is visible and in range (complex supported), and if the target's id has change. If any of those things are true it will find a new path. If everything is fine it will then see if the current node been reached then either check the next node in the path or arrive and stop pathing.