# Node-Based-Pathfinding

Using the functions from Node Based Pathfinding is pretty simple if you do not want to add any complex behaviours by following the [getting started guide](/tutorials/getting-started.md) to set up your pathfinding. All functions are prefixed with nbp_ for compatability.

And if you want to change the code I have written it's probably best if you don't just have to guess what something is trying to do so I have listed all functions included, their purposes and how it's done below. I have also documented most of the code so these docs are mainly just for clarifying anything you don't understand.

For those who are going to read what I wrote I use *list* and *array* interchangably and only thought of the fact that lists are a thing in gm after so just imagine whenever I say list I meant array.

## Table of contents



### General

- [Macros](/docs/macros.md): macros that are used by Node Based Pathfinding
- [setup()](/docs/setup.md): sets up variables for scripts.
- [debug_toggle()](/docs/debug-toggle.md): swaps whether or not debug for nbp is on

### Node specific functions

- [node_set()](/docs/node-set.md): sets up node variables
- [node_delete()](/docs/node-delete.md): removes a node from tracking
- [node_exists(_pointer,_identity)](/docs/node-exists): checks if a node still exists
- [node_moved()](/docs/node-moved.md): resets the node for a new position
- [node_radius_find(node,[maxRadius],[steps])](/docs/node-radius-find.md): returns half the distance to the closest collibable

- [node_bake(_node)](/docs/node-bake.md): finds all the visible nodes in range and tells them it can see them
- [node_bake_ghost(_node)](/docs/node-bake-ghost.md): finds all the visible nodes in range
- [node_bake_all()](/docs/node-bake-all.md): reset all nodes visible nodes and then find all the nodes they can see
- [node_unbake(_node)](/docs/node-unbake.md): tell all the nodes it can see that it cant see them anymore

- [node_debug_draw()](/docs/node-debug-draw.md): goes in the nodes draw event if debugging or visualisations are needed

### Pathfinder specific functions

- [pathfinder_set()](/docs/pathfinder-set.md): sets up pathfinder variables
- [pathfinder_step()](/docs/pathfinder-step.md): runs code to handle the pathfinding

- [pathfinder_debug_draw()](/docs/pathfinder-debug-draw.md): goes in the pathfinders draw event if debugging or visualisations are needed

### Path functions

- [path_a_star(startNode,endNode)](/docs/path-a-star.md): finds the fastest way from the startNode to the endNode using the node network
- [path_refine(path,iterations,[refinePercent])](/docs/path-refine.md): shortens the distance needed to travel along a path BUT does not verify that the path is safe/navigable