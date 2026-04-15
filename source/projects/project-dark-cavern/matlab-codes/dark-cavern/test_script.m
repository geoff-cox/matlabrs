rng(2)

[maze, player] = HW4_initialize_game_v3(37, 93);

HW4_display_maze_v3(maze,player)

[V,E] = maze_to_graph(maze.walls);

G = construct_graph(V, E, 'maze graph');

% visualize_graph(G);

