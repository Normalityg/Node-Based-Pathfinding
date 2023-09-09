function pathfind_a_star(_startNode, _endNode){
	// make array of checked nodes
	// make array of length global.nodes and store if they have been checked and where in checked they are
	// make array of toCheck
	// make another array of length global.nodes for if something is toCheck or not and overide if closer
	// make function for insertsorting toCheck
	// save distance from start and add distance at each point
	
	var checked = [];
	var checkedLength = -1; // It gets added to before its used so it technically starts a 0
	var toCheck = [[_startNode, _startNode.nodesPointer, -1, 0, 0, 0]]; // [nodeId, nodesPointer, lastNode, distanceFromStart, heuristic]
	var toCheckLength = 1;
	
	var checkedMaster = array_create(array_length(nodes), -1);
	var toCheckMaster = array_create(array_length(nodes), -1);
	
	var finalNode = -1;
	
	while (toCheckLength > 0 && finalNode = -1){
		
		toCheckLength --;
		var currentCheck = toCheck[toCheckLength];
		
		if (currentCheck[1] = _endNode.nodesPointer){ // If this node is the endNode
			finalNode = currentCheck;
		}
		// Add currentCheck to checked
		checkedLength ++;
		checked[checkedLength] = currentCheck;
		checkedMaster[currentCheck[1]] = checkedLength;
		
		
		// Add currentChecks visible nodes to toCheck
		var node = currentCheck[0];
		
		for (var i = array_length(node.visibleNodes) - 1; i >= 0; i --){
			
			var targetNodePointer = node.visibleNodes[i];
			var targetNode = nodes[targetNodePointer];
			
			if (checkedMaster[targetNodePointer] != -1)continue;
			checkedMaster[targetNodePointer] = -2;
			
			var crowFromStart = currentCheck[3] + sqrt(sqr(targetNode.x - node.x) + sqr(targetNode.y - node.y)); // Total distance from start
			var crowToEnd = sqrt(sqr(_endNode.x - targetNode.x) + sqr(_endNode.y - targetNode.y)); // Distance directly to the end
			
			var heuristic = crowFromStart + crowToEnd; // The rating of this node being picked (lower better)
			
			var newEntry = [targetNode, targetNodePointer, checkedLength, crowFromStart, heuristic];
			
			// Insert new entry into an array starting from the top down based on the heuristic
			toCheck[toCheckLength] = newEntry; // Set end of array to new entry
			
			
			for (var j = toCheckLength; j > 0; j --){ // Repeat up to the length of the array
				if (toCheck[j - 1][4] < newEntry[4]){
					toCheck[j] = toCheck[j - 1]; // Shift next entry up
					//toCheck[j - 1] = newEntry; // Replace shifted entry
				}
				else {
					break; // End early if the entry is in the correct place
				}
			}
			toCheck[j] = newEntry; // Replace shifted entry
			toCheckLength ++;
			
		}
		
	}
	
	if (finalNode != -1){
		var path = [];
		var pathLength = 0;
		var currentNode = finalNode;
		
		while (currentNode[2] != -1){
			path[pathLength] = currentNode;
			pathLength ++;
			currentNode = checked[currentNode[2]];
		}
		path[pathLength] = currentNode;
		return(path);
	}
	return([]);
}