pathfinder_step();
var movex = max(min((movementTargetLocation[0] - x) / 32, 8),-8);
var movey = max(min((movementTargetLocation[1] - y) / 32, 8),-8);

move_and_collide(movex,movey,obj_wall);