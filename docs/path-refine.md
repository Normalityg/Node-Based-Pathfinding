# path_refine(path, iterations, [refinePercent] = 0.1)

First of all as a warning this function does not use ComplexNodes as its collision so it will try for the most direct path it can get even if that means there is no room for movement.

Additionaly this function is not build to split the path to get the fastest path possible but if someone wants to code it I'll take that code and add it to the default but I dont see much real use for it so I'll only end up doing it if I get a burst of motivation/interest. Also performance would probably be effected on longer paths.

This function takes an input path then tries to shorten that path iterations times by refinePercent percent.

For each iteration every node apart from the first and last along the path is checked to see if it can be moved to shorten the path. If the node has no failed an iteration before (this could be removed for smoother paths) it will try to move it closer to a point in between the next and last node in the list. If it can it will move refinePercent of the way there.