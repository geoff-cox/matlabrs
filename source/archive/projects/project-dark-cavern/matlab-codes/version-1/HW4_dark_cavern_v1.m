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