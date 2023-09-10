draw_self();
pathfinder_debug_draw();
//node_debug_draw();
//
//repeat(1)var path = pathfind_a_star(self, obj_mouse);
//
//var startTime = get_timer();
//
//pathfind_refine(path, 4, 0.1);
//
//var timeTaken = get_timer() - startTime;
//draw_text(12,12,"Time taken " + string(timeTaken) + " microseconds");
//
//totalTime[totalRuns % 60] = timeTaken;
//totalRuns ++;
//
//var timeSum = 0;
//for(var i = 0; i < 60; i ++)timeSum += totalTime[i];
//
//draw_text(12,24,"Average in last second " + string(timeSum / 60) + " microseconds");
//
////pathfind_refine(path, 2);
//
//for (var i = array_length(path) - 1; i > 0; i --){
//	draw_line_color(path[i][0].x + path[i][1], path[i][0].y + path[i][2], path[i - 1][0].x + path[i - 1][1], path[i - 1][0].y + path[i - 1][2],c_aqua,c_aqua);
//}

