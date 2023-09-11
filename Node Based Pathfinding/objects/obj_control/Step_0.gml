if (mouse_check_button_pressed(mb_left))instance_create_depth(mouse_x,mouse_y,0,obj_pathfindingNode);
if (mouse_check_button_pressed(mb_right))instance_create_depth(mouse_x,mouse_y,0,obj_pathfinder);
if (keyboard_check_pressed(ord("Q")))nbp_debug_toggle();
if (keyboard_check_pressed(ord("W")))nbpDebugComplex = !nbpDebugComplex;
if (keyboard_check_pressed(ord("E")))global.randomNode = !global.randomNode;