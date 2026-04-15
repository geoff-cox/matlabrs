% Assume maze is a generated m x n matrix with walls (1) and paths (0)
% Player starts at [2, 2], object is at [5, 5]
maze.data = [
    1 1 1 1 1 1 1;
    1 0 0 0 0 0 1;
    1 0 1 1 1 0 1;
    1 0 1 0 0 0 1;
    1 0 1 0 1 0 1;
    1 0 0 0 1 0 1;
    1 1 1 1 1 1 1;
];

player.position = [6, 2];

player = get_line_of_sight(maze,player);

disp(player.line_of_sight); % Output will be true or false


