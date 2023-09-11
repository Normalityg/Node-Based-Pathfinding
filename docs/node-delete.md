# node_delete()

Weirdly this function sometimes throws an error. Don't now why it just does so I don't recommend using it and if you are going to, probably figure out how to fix that.

This function deletes the node calling it both from all array and from existence using instance_destroy().

It starts by removing any pointers to its location in global.nbpNodesList by unbaking itself then finds the last entry in the nodes list to swap places with itself. It then checks if it is that node and if so will resize the array before deleting itself.

If it is not the last node in the array it will unbake that node then move that node into its slot in the array before baking it again. The array then gets resized so things don't break.