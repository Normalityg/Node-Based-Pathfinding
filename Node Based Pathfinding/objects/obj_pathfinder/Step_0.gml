pathfinder_step();

if (stuckTime > 600)pathTimer = 0; // Recalculate path if 

var movex = clamp((movementX - x) / 32, - 2, 2) //+ random_range(-1,1);
var movey = clamp((movementY - y) / 32, - 2, 2) //+ random_range(-1,1);

move_and_collide(movex,movey,obj_wall);

//var movex = clamp(sign((movementX - x) / 32) * 4, - 4, 4) //+ random_range(-1,1);
//var movey = clamp(sign((movementY - y) / 32) * 4, - 4, 4) //+ random_range(-1,1);