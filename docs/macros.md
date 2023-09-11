# Macros

The macros can be found and modified in [setup()](/docs/setup.md) script.

- nbpNodes: An array of all nodes currently active in the network
- nbpDebug: Flag for if debug view should be on
- nbpDebugComplex: Flag for if the debug view should be extra detailed or not
- nbpMakeNBake: Bake nodes when they are added into the network via set
- nbpComplexNodes: Flag for if the nodes are just line of sight from the center or if they need to be line of sight from its edge of the radius circle aswell 
- nbpNodeDistance: The maximum distance that each node can be before it's not considered in its 'vision'

- nbpCollision: What asset blocks the line of sight checks when baking the nodes