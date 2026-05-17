function HW4_dark_cavern_script_ai()

    % Initialize the game
    maze = initialize_game(15,21);

    tic
    
    direction = 's';

    % Game loop
    while true

        display_maze(maze)
        
        fprintf('\nElapsed time: %g seconds\n', round(toc,2))
        fprintf('\nItems:\n')
        if maze.player.has_key
            fprintf('  * Key\n')
        end
        if maze.player.has_torch
            fprintf('  * Torch\n')
        end

        % Get player's move
        fprintf('\nEnter move (up/down/left/right): ') ;
        direction = ai_move_right_turn(maze, direction);
        
        pause(0.1)

        % Move the player
        maze = move_player(maze, direction);

        % If the player has the key and reached the goal, end game loopx
        if isequal(maze.player.position, maze.goal.position) 
            if maze.player.has_key
                break
            else
                fprintf('\nYou need the Key!\n')
            end
        end

    end

    maze.player.sight = true(15,21);
    display_maze(maze)
    fprintf( [...
        '\nCongratulations!\n' ...
        '    Number of Moves: %d\n' ...
        '    Time to Finish:  %g seconds\n' ...
        ], maze.player.moves, round(toc,2));

end