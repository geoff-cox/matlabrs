function HW4_dark_cavern_v3()

    % Initialize the game
    [maze, player] = HW4_initialize_game_v3(11,13);
    
    tic

    message = '';
    
    % Game loops
    while true
    
        HW4_display_maze_v3(maze, player)
    
        fprintf('\n')
        fprintf('Elapsed time: %g seconds\n', round(toc,2))
        fprintf('Number of Moves: %i\n', player.moves)
        fprintf('Inventory:\n')
        if player.has_key
            fprintf(' > Key\n');
        end
        if player.has_torch
            fprintf(' > Torch\n');
        end
        fprintf('%s\n', message)
        message = '';
        
        % Get player's move
        fprintf('Enter move (up/down/left/right): ') ;
        direction = lower(char(getkey));
    
        % Exit game
        if direction == 'x'
            clc;
            return
        end

        % Move the player
        player = HW4_move_player_v3(maze, player, direction);
    
        % If the player has the key and reached the goal, end game loop
        if isequal(player.position, maze.exit) 
            if player.has_key
                break
            else
                message = 'You need the Key!';
            end
        end
    
    end
    
    HW4_display_maze_v3(maze, player)
    fprintf( [...
        '\nCongratulations! You made it out!\n\n' ...
        'Elapsed time: %g seconds\n' ...
        'Number of Moves: %i\n' ...
        ], round(toc,2), player.moves);

end