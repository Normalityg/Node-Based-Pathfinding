if (mouse_check_button_pressed(mb_left))instance_create_depth(mouse_x,mouse_y,0,obj_pathfindingNode);
if (keyboard_check_pressed(vk_space))debug = !debug;
if (keyboard_check_pressed(vk_alt))node_bake_all();