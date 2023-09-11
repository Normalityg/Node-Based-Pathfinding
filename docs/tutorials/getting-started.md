# Getting started

## Overview

This tutorial is for setting up Node Based Pathfinding with a project that has a destination, enemies that want to move towards the destination, and a barrier. From now on the guide will refer to the destination (or any place you want to go) as a player, the enemies (or any object trying to get somewhere) as a pathfinder, and the barrier as a wall.

The tutorial is not a comprehensive list of things possible with Node Based Pathfinding but how to set it all up in the project.


### Setting up

You are going to need four objects, a player, a pathfinder, a wall, and a node. Feel free to name them whatever you like.

To set up Node Based Pathfinding open up scr_nbp_setup and put in the asset name of your wall (ex. obj_wall) and put that into the #macro nbpCollision. We will also turn on debug mode by setting nbpDebug to true. If having nbpDebug on is messing with performance too much turn off nbpDebugComplex! Depending on your room size you might want to change nbpNodeDistance too but for now lets leave it at the default.

With the settings set lets move onto nodes.

### Room

As with all gamemaker projects you will need a room. In the room you will place walls to create a maze, but make sure the walls in the maze are not too tight or the pathfinders wont be able to move through it. Add multiple ways to get from one place to another just to see the magic happen.

Now with your maze made, place node objects in the room but make sure they are not too far apart or they won't see eachother.

Nodes placed? Time for a player and some pathfinders. Place pathfinders on opposite sides of the room with a player anywhere in the maze. The only code we are going to use to set up the room is `if (keyboard_check_pressed(vk_space))nbp_debug_toggle();` for turning on and off debug mode all you'll have to do if press space while the game is running.

With the room set up we can move onto the Nodes.

### Nodes

Nodes are the backbone of Node Based Pathfinding (it's in the name). They contain the information needed to find a path from one node to another.

To make them store this information they need to be set with `nbp_node_set();` in the create event or any event as long as they are not set more than once. 

Thats all nodes are! Well we are going to use another function to show some information about what the node is thinking but you could just have a node with only that code and nothing would go wrong! To show the information we will enter the draw event then put in the code `nbp_node_debug_draw();`. With two function we are already finished setting up the node and one was technically unnecesary!

Now try running the project, you should be able to see the connections between nodes as long as the debug is turned on. If there is a missing connection that means that the nodes are too far apart or can't see eachother so try placing a node between them or in a more open place.

### Player

Now it's time for the player. Now the fun thing about the player is that they are just a node with an extra features, they can move!

So first setup the player object like we did for the nodes.

Now if you dont have movement code for the player just write `x = mouse_y;` and `y = mouse_y;` in the step event for simple control over the object.

But the problem now is that the node doesnt know that it's moving so it thinks it's somewhere it's not and will behave strangely. To fix this you need to put the function `nbp_node_moved();` in the step event *after* the movement code for the player.

With that the node knows when it has moved and so does every other node, and again we're done! One thing to be aware of is that moving nodes is horrible on performance so try not to have too many and if performance is an issue don't run `nbp_node_moved(); if the node is standing still.

To check run the game and you should find that there is a moving node underneath your mouse. If this is not working you may have forgotten to add `nbp_node_debug_draw();` in the draw event, or you forgot to put it into the room.

### Pathfinder

#### Basics

Finally are Pathfinders, they try to get somewhere. They will try to go to the variable targetNode when the variable pathTimer is zero. You can probably guess that from the name pathTimer counts down so you can start following a path whenever you want. Alas as with all timer variables you need to only set them once or set them only when they are equal to negative one.

As of right now the object does not have these variables. To give the object these variables we have to put `nbp_pathfinder_set();` into the create event much like a node. Also like a node it has a debug function `nbp_pathfinder_debug_draw();` in the draw event. Because you have code in the draw event you are going to want to add `draw_self();` at the start of the draw event to make sure you have see the pathfinder.

Where it differs from the node is the step event we need `nbp_pathfinder_step();` to do all the pathfinding logic for us. Its best to put this at the top of the step event but you can put it anywhere you like as long as it runs every frame.

Right now if you run the game nothing will happen thats because we have told it to go somewhere and targetNode is currently undefined. So in the create event after `nbp_pathfinder_set()` put set `targetNode = obj_player;` and `pathTimer = 0;` or however many frames you want to wait before starting along the path.

Now running the game the result should be the same because Node Based Pathfinding does not handle the movement for you, you have to do it yourself! But I can help you. First you will have to know that Node Based Pathfinding gives you access to the x and y of the next node with the variables movementX and movementY. And with that knowledge we can move with three simple lines of code, `var movex = clamp((movementX - x) / 32, - 4, 4);`, `var movey = clamp((movementY - y) / 32, - 4, 4);`, and `move_and_collide(movex,movey,obj_wall);`, this will try to move a percent of the way to the next node keeping to a relatively straight line! Make sure those lines of code are in that order or it will give an error.

Finally it will move towards the next node until it finishes the path.

#### Advanced

These are some extra functionalities that the previous code is unable to do.

If you have played around with the current state of the project you would probably have noticed that the pathfinders don't try to chase the mouse after they reach it. This can be fixed by putting the line of code `arrive = false;` into the create event, it will tell the pathfinder that it cannot arrive no matter how close it gets to the targetNode and to keep chasing it forever.

Another thing you might have noticed is the pathfinder sometimes gets caught on the corners and cant figure out how to get around them. While a lot of the code is dedicated to making this happen as few times as possible don't fret, for a variable exists just for this reason, the stuckTimer, it keeps track of how many frames its been since a new node has been reached. To try to find a new path when a pathfinder has been chasing a node for a hundred and twenty frames just write `if (stuckTimer >= 120)pathTimer = 0;`. This code will automagically try to find a new path after failing to reach the next node for two seconds.

### Thats it?

Yup you only to remember a few variables and it handles everything for you!

If you want to dive more into how everything works check out the [documentation](/docs/!general-info.md) and most of the code is well (probably over) commented so that could be helpful too.