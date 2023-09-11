# node_unbake(nodeId)

This function removes the given node from all nodes it can see's visible lists. Could cause issues with ghost nodes so make sure you know who to call.

Loops through all nodes it can see and loops through each's list of what *they* can see and when it finds itself replace it with the last entry and resize their visible nodes list.