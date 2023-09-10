function pathfind_a_star(_startNode, _endNode){ // Function for finding the fastest way between two nodes (sometimes makes very slight pathing mistakes but not worth the perfomance loss)
	
	var checked = []; // Array of already checked nodes
	var checkedLength = -1; // It gets added to before its used so it technically starts a 0
	var toCheck = [[_startNode, _startNode.nodesPointer, -1, 0, 0, 0]]; // Array of nodes needing to be checked [nodeId, nodesPointer, lastNode, distanceFromStart, heuristic]
	var toCheckLength = 1;
	
	var checkedMaster = array_create(array_length(nodes), -1); // List of if a node has been checked or not and a pointer to where in checked they are
	
	var finalNode = -1; // Whether or not the _endNode was found
	
	while (toCheckLength > 0 && finalNode = -1){ // Loop until all nodes have been checked or the _endNode was found
		
		// Remove an entry from toCheck and put it in currentCheck
		toCheckLength --;
		var currentCheck = toCheck[toCheckLength];
		
		// Check if this node is the _endNode and if it is stop looking
		if (currentCheck[1] = _endNode.nodesPointer){
			finalNode = currentCheck; // Store the data of the node
			break;
		}
		
		// Add currentCheck to checked and store the pointer in the master list
		checkedLength ++;
		checked[checkedLength] = currentCheck;
		checkedMaster[currentCheck[1]] = checkedLength;
		
		
		// Add currentChecks visibleNodes to toCheck
		var node = currentCheck[0]; // Store the node whose visibleNodes are being checked
		
		for (var i = array_length(node.visibleNodes) - 1; i >= 0; i --){ // Loop through each visible node
			
			var targetNodePointer = node.visibleNodes[i]; // Set this nodes pointer
			
			if (checkedMaster[targetNodePointer] != -1)continue; // Skip if this node is already in the masterlist
			
			var targetNode = nodes[targetNodePointer]; // Store the targetNode id
			
			checkedMaster[targetNodePointer] = -2; // Reserve the spot in the master list
			
			var crowFromStart = currentCheck[3] + sqrt(sqr(targetNode.x - node.x) + sqr(targetNode.y - node.y)); // Total distance from start
			var crowToEnd = sqrt(sqr(_endNode.x - targetNode.x) + sqr(_endNode.y - targetNode.y)); // Distance directly to the end
			
			var heuristic = crowFromStart + crowToEnd; // The rating of this node being picked (lower better)
			
			var newEntry = [targetNode, targetNodePointer, checkedLength, crowFromStart, heuristic]; // All the nodes data congregated in one place
			
			// Insert new entry into an array starting from the top down based on the heuristic
			for (var j = toCheckLength; j > 0; j --){ // Repeat up to the length of the array
				if (toCheck[j - 1][4] < newEntry[4]){ // Compare this and the next entry on who has a lower heuristic
					toCheck[j] = toCheck[j - 1]; // Shift old entry up if the new entry has a higher heuristic
				}
				else {
					break; // End if the new entry has a lower heuristic
				}
			}
			toCheck[j] = newEntry; // Replace displayed entry with the new entry or put it at the bottom if there were no swaps
			toCheckLength ++; // Let everything know that toCheck has be added to
			
		}
		
	}
	
	// If _endNode was found store the path and return it
	if (finalNode != -1){
		var path = [];
		var pathLength = 0;
		var currentNode = finalNode;
		
		while (currentNode[2] != -1){
			path[pathLength] = [currentNode[0], 0, 0]; // Add the nodes Id to the path and the x and y offs
			pathLength ++;
			currentNode = checked[currentNode[2]];
		}
		path[pathLength] = currentNode;
		return(path);
	}
	// Otherwise just return an empty array
	return([]);
}