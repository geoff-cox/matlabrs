function maze = initialize_ai_game(height, width)
    
    % rng(1) % Uncomment to set a random seed for debugging
    
    % Maze Data Matrix
    maze.data = generate_maze(height, width);
    maze.h = height;
    maze.w = width;

    % Player structure
    maze.player.position = [2, 2];
    maze.player.moves = 0;
    maze.player.direction = 's';
    maze.player.icon = '8v';
    maze.player.has_key = false;
    maze.player.has_torch = false;
    maze.player.sight = get_line_of_sight(maze);
    maze.player.visited = false(height,width);
    maze.player.visited(2,2) = true;
    
    % Maze Goal Object
    maze.goal.position = select_goal(maze);
    maze.goal.icon = '<>';

    % Maze Key Object
    maze.key.position = select_key(maze);
    maze.key.icon = '0m';

    % Maze Torch Object
    maze.torch.position = select_torch(maze);
    maze.torch.icon = '~*';

end