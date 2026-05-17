HW3P10_play_maze_game

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

function goal = HW3P7_select_goal(maze, start)
    
    rand_row = randi([2 9]);
    rand_col = randi([2 9]);
    while isequal([rand_row, rand_col], start) || maze(rand_row, rand_col) == 1
        rand_row = randi([2 9]);
        rand_col = randi([2 9]);
    end
    goal = [rand_row, rand_col];
end

function HW3P8_display_maze(maze, player)
    clc
    
    [rows, cols] = size(maze.data);
    for i = 1:rows
        for j = 1:cols
            if i == player.position(1) && j == player.position(2)
                fprintf(':)');  % '@' for player
            elseif maze.data(i, j) == 1
                fprintf('##');  % '#' for wallss
            else
                fprintf('  ');  % ' ' (emptyspace) for open paths
            end
        end
        fprintf('\n');
    end
end

function player = HW3P9_move_player(maze, player, direction)
    % Get the current position
    x = player.position(1);
    y = player.position(2);

    % Determine new position based on direction
    if strcmp(direction, 'w')
        newX = x - 1;
        newY = y;
    elseif strcmp(direction, 's')
        newX = x + 1;
        newY = y;
    elseif strcmp(direction, 'a')
        newX = x;
        newY = y - 1;
    elseif strcmp(direction, 'd')
        newX = x;
        newY = y + 1;
    else
        newX = x;
        newY = y;
        fprintf('Invalid move\n');
    end

    % Check if new position is within bounds and not a wall
    if maze.data(newX, newY) == 0
        player.position = [newX, newY];
        player.moves = player.moves + 1;
    end
end

function HW3P10_play_maze_game()

    [maze, player] = HW3P6_initialize_game();

    % Game loop
    while ~isequal(player.position, maze.goal)
        % Display the maze with the player's current position
        HW3P8_display_maze(maze, player);
    
        % Get player's move
        fprintf('\nEnter move (up/down/left/right): ') ;
        direction = lower(char(getkey));
    
        % Exit game
        if direction == 'x'
            clc;
            return
        end
    
        % Move the player
        player = HW3P9_move_player(maze, player, direction);
    
    end
    fprintf('Congratulations! You reached the goal in %d moves.\n', player.moves);
end