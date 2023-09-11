# path_a_star(startNodeId, endNodeId)

The function that makes everything tick, because I have commented practically every line of the code I will only be writing an overview of the code. In very very short terms, this function checks all nodes in can using the nodes visibleNodes variable until it either finds the endNode or has checked all the nodes it has access to.

If the endNode has been found it gets stored in finalNode for reversing the path to it. To reverse the path the finalNode is checked and because each node stores what node added it to the list it then checks that node recursively until it has reached the startNode. Each node is stored in the path array starting with the last node in the lowest position into the first node in the highest position.