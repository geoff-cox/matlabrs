function [maze, player] = HW4P6_initialize_game(level)

    % Generate random maze (1 for walls, 0 for paths)
    switch level

        case 1
            maze.data = generate_maze(10, 10);

        case 2
            maze.data = generate_maze(14, 14);

        case 3
            maze.data = generate_maze(15, 20);

        otherwise
            maze.data = generate_maze(5, 5);

    end
    
    maze.goal = HW3P7_select_goal(maze.data, [2, 2]);

    % Player structure
    player.position = [2, 2]; % Start position
    player.moves = 0;

end