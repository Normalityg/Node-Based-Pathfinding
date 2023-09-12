draw_text(14,12,"fps: " + string(fps_real));
draw_text(18, room_height - 102, "Q to toggle debug");
draw_text(18, room_height - 86, "W to toggle complex debug");
draw_text(18, room_height - 70, "E to go toward a random node");
draw_text(18, room_height - 54, "left click to add node");
draw_text(18, room_height - 38, "right click to add pathfinder");

//var time = get_timer();
//
//
//
//var timeTaken = get_timer() - time;
//
//data[dataTaken] = timeTaken;
//dataTaken = (dataTaken + 1) % 60;
//
//draw_text(14, 28, string(timeTaken));
//
//var averageTime = 0;
//for (var i = 0; i < 60; i ++)averageTime += data[i];
//
//draw_text(14, 44, string(averageTime / 60));