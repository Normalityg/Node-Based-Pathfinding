if (mouse_check_button_pressed(mb_left))instance_create_depth(mouse_x,mouse_y,0,obj_pathfindingNode);
if (keyboard_check_pressed(vk_space))nbp_debug_toggle();
if (keyboard_check_pressed(ord("T")))global.randomNode = !global.randomNode;