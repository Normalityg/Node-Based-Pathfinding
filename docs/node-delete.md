# node_delete(_nodePointer)

When using this function errors can pop up if you do not do [node_exists()](/docs/node-exists) checks to verify that the node you are trying to access is still valid.

This function deletes the node with its pointer from all tracking arrays removing it from the network.

It starts by removing any pointers to its location in global.nbpNodesList by unbaking itself then finds the last entry in the nodes list to swap places with itself. It then checks if it is that node and if so will resize the array and be done with it. If it is not the last node in the array it will unbake that node then move that node into its slot in the array before baking it again. The array then gets resized so things don't break.