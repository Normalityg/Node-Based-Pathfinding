# node_set()

This function sets all the variables for the calling object and only needs to be run once for the objects existence. You can use structs as long as they have the x and y variables then run `with(myStruct)node_set();` and it will become a node too!

The actual code is quite simple and just finds the location in the global array of nodes it is, finds half the distance to the nearest collidable asset, then gives itself an empty array for visible nodes and if make and bake is enabled get baked.