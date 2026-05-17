function [maze, player] = HW3P6_initialize_game()
    % Maze Generation - 10x10 grid with walls (1) and paths (0)
    maze.data = [
        1 1 1 1 1 1 1 1 1 1;
        1 0 0 0 1 0 0 0 0 1;
        1 0 1 0 1 0 1 1 0 1;
        1 0 1 0 0 0 0 1 0 1;
        1 0 1 1 1 1 0 1 0 1;
        1 0 0 0 0 1 0 0 0 1;
        1 0 1 1 0 1 1 1 0 1;
        1 0 1 0 0 0 1 1 0 1;
        1 0 0 0 1 0 0 0 0 1;
        1 1 1 1 1 1 1 1 1 1
        ];
    
    maze.goal = HW3P7_select_goal(maze.data, [2, 2]);

    % Player structure
    player.position = [2, 2];  % Start position
    player.moves = 0;          % Move counter

end