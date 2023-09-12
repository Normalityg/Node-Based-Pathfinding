// Make sure the pathfinders are drawn last
depth = -1;

// Make it try to navigate
nbp_pathfinder_set();

// Object/node you want to go to
targetNode = obj_mouse.id;
//targetNode = nbpNodes[0];

// Time until next path to targetNode is calculated
pathTimer = 1;

// Whether or not to stop going to the target node when it's reached
arrive = false;

data = [];
data[59] = 0;
dataTaken = 0;