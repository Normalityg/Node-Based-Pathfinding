draw_self();
node_debug_draw();

var startTime = get_timer();
repeat(10)var path = pathfind_a_star(self, obj_mouse);
draw_text(12,12,"Time taken " + string(get_timer() - startTime) + " microseconds");

for (var i = array_length(path) - 1; i > 0; i --){
	draw_line_color(path[i][0].x, path[i][0].y, path[i - 1][0].x, path[i - 1][0].y,c_aqua,c_aqua);
}