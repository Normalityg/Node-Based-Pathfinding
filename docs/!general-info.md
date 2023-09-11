# Node-Based-Pathfinding

Using the functions from Node Based Pathfinding is pretty simple if you do not want to add any complex behaviours by following the [getting started guide](/tutorials/getting-started.md) to set up your pathfinding. All functions are prefixed with nbp_ for compatability.

And if you want to change the code I have written it's probably best if you don't just have to guess what something is trying to do so I have listed all functions included, their purposes and how it's done below. I have also documented most of the code so these docs are mainly just for clarifying anything you don't understand.

For those who are going to read what I wrote I use *list* and *array* interchangably and only thought of the fact that lists are a thing in gm after so just imagine whenever I say list I meant array.

## Table of contents



### General

- [Macros](/docs/macros.md)
- [setup()](/docs/setup.md)
- [debug_toggle()](/docs/debug-toggle.md)

### Node specific functions

- [node_set()](/docs/node-set.md) 
- [node_delete()](/docs/node-delete.md) 
- [node_moved()](/docs/node-moved.md) 
- [node_radius_find(node,[maxRadius],[steps])](/docs/node-radius-find.md) 

- [node_bake(_node)](/docs/node-bake.md) 
- [node_bake_ghost(_node)](/docs/node-bake-ghost.md) 
- [node_bake_all()](/docs/node-bake-all.md) 
- [node_unbake(_node)](/docs/node-unbake.md) 

- [node_debug_draw()](/docs/node-debug-draw.md) 

### Pathfinder specific functions

- [pathfinder_set()](/docs/pathfinder-set.md) 
- [pathfinder_step()](/docs/pathfinder-step.md) 

- [pathfinder_debug_draw()](/docs/pathfinder-debug-draw.md) 

### Path functions

- [path_a_star(startNode,endNode)](/docs/path-a-star.md) 
- [path_refine(path,iterations,[refinePercent])](/docs/path-refine.md) 