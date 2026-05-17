% Dark Cavern Game Version 1
% Upgrades from Maze Game
%   1. Maze is randomly generated.
%   2. Maze structure updates:
%       * maze now has an "h" (height) field 
%       * maze now has a "w" (width) field
%       * maze now has a "icon" field
%       * maze.data is now maze.walls 
%       * maze.goal is now maze.exit 
%   3. Player structure updates:
%       * player now has an "direction" field 

HW4_dark_cavern_v1

function location = HW4_select_random_location(maze, object_locations)
    
    reserved = maze.walls;
    for r = 1:height(object_locations)
        reserved(object_locations(r,1), object_locations(r,2));
    end

    location = [randi([1 height(reserved)]) randi([1 width(reserved)])];
    
    while reserved(location(1), location(2))
        location = [randi([1 height(reserved)]) randi([1 width(reserved)])];
    end

end

function [maze, player] = HW4_initialize_game_v1(height, width)
    
    % Maze Structure
    maze.walls = generate_maze(height, width);
    maze.h = height;
    maze.w = width;
    maze.icons.wall = '▓';
    maze.icons.exit = '⛝';
    maze.icons.open = '⛆';
    maze.exit = HW4_select_random_location(maze, [2 2]);

    % Player structure
    player.position = [2, 2];
    player.moves = 0;
    player.direction = 's';
    player.icon = '⛄';

end

function HW4_display_maze_v1(maze, player)
    clc
    
    p_row = player.position(1);
    p_col = player.position(2);   
    
    [rows, cols] = size(maze.walls);
    for i = 1:rows
        for j = 1:cols
            if i == p_row && j == p_col 
                fprintf(player.icon);
            elseif maze.walls(i,j) == 1
                fprintf(maze.icons.wall);
            elseif maze.exit(1) == i && maze.exit(2) == j 
                fprintf(maze.icons.exit);     
            else
                fprintf(maze.icons.open);
            end
        end
        fprintf('\n');
    end
end

function player = HW4_move_player_v1(maze, player, direction)

    % Get the current position
    x = player.position(1);
    y = player.position(2);

    % Determine new position based on direction
    if direction == 'w'
        x = x - 1;
    elseif direction == 's'
        x = x + 1;
    elseif direction == 'a'
        y = y - 1;
    elseif direction == 'd'
        y = y + 1;
    end
    player.direction = direction;
    
    % Apply move only if the new location is not a wall
    if maze.walls(x,y) == 0

        % Update player state
        player.position = [x y];
        player.moves = player.moves + 1;
        
    end

end

function HW4_dark_cavern_v1()
    % Initialize the game
    [maze, player] = HW4_initialize_game_v1(11,33);
    
    % Game loop
    while true
    
        HW4_display_maze_v1(maze, player)
    
        % Get player's move
        fprintf('\nEnter move (up/down/left/right): ') ;
        direction = lower(char(getkey));
    
        % Exit game
        if direction == 'x'
            clc;
            return
        end
    
        % Move the player
        player = HW4_move_player_v1(maze, player, direction);
    
        % If the player has reached the exit, end game loop
        if isequal(player.position, maze.exit) 
            break
        end
    
    end
    
    HW4_display_maze_v1(maze, player)
    fprintf( [...
        '\nCongratulations!\n' ...
        '    Number of Moves: %d\n' ...
        ], player.moves);
end
