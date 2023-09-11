# Node-Based-Pathfinding

Using the functions from Node Based Pathfinding is pretty simple if you do not want to add any complex behaviours by following the [getting started guide](/tutorials/getting-started) to set up your pathfinding. All functions are prefixed with nbp_ for compatability.

And if you want to change the code I have written it's probably best if you don't just have to guess what something is trying to do so I have listed all functions included, their purposes and how it's done below. I have also documented most of the code so these docs are mainly just for clarifying anything you don't understand.

For those who are going to read what I wrote I use *list* and *array* interchangably and only thought of the fact that lists are a thing in gm after so just imagine whenever I say list I meant array.

## Table of contents



### General

- [Macros](/macros)
- [setup()](/setup)
- [debug_toggle()](/debug-toggle)

### Node specific functions

- [node_set()](/node-set) 
- [node_delete()](/node-delete) 
- [node_moved()](/node-moved) 
- [node_radius_find(node,[maxRadius],[steps])](/node-radius-find) 

- [node_bake(_node)](/node-bake) 
- [node_bake_ghost(_node)](/node-bake-ghost) 
- [node_bake_all()](/node-bake-all) 
- [node_unbake(_node)](/node-unbake) 

- [node_debug_draw()](/node-debug-draw) 

### Pathfinder specific functions

- [pathfinder_set()](/pathfinder-set) 
- [pathfinder_step()](/pathfinder-step) 

- [pathfinder_debug_draw()](/pathfinder-debug-draw) 

### Path functions

- [path_a_star(startNode,endNode)](/path-a-star) 
- [path_refine(path,iterations,[refinePercent])](/path-refine) 