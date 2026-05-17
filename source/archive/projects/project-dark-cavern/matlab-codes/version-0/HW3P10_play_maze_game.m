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
    fprintf('\nCongratulations! You reached the goal in %d moves.\n', player.moves);
end