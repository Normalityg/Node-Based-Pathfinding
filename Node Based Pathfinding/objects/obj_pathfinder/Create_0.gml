nbp_pathfinder_set();

// Object/node you want to go to
targetNode = obj_mouse.id;

// Time until next path to targetNode is calculated
pathTimer = 1;

// Whether or not to stop going to the target node when it's reached
arrive = false;