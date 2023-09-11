# node_debug_draw()

Draw all the debug information for the current node and settings if debug is on:

### Default

- Connecting line between itself and all nodes it can see.
- A 3px by 3px black square at its x,y

### If complexNodes is enabled:

- it will also draw the extra collision lines it runs and a circle showing the nodes radius
- If the nodes radius is low a warning will be shown