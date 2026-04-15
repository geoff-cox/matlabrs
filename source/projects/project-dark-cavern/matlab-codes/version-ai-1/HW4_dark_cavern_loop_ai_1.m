function HW4_dark_cavern_loop_ai_1()
    % Initialize the game
    h = 5; w = 7;
    [maze, player] = HW4_initialize_game_ai_1(h,w);
    
    n_attempts = 100;
    
    step_dir = struct('w',[-1 0],'a',[0 -1],'s',[1 0],'d',[0 1]);
    directions = 'wasd';

    % Learning Loop
    for attempt = 1:n_attempts

        player.actions = char(32*ones(1,10000));
        player.rewards = zeros(1,10000);
        player.moves = 0;

        % Single Game loop
        while true
        
            HW4_display_maze_ai_1(maze, player)
        
            % Get player's move
            fprintf('\nEnter move (up/down/left/right): ') ;
            direction = directions(randi(4));
        
            % Move the player
            player = HW4_move_player_ai_1(maze, player, direction);
        
            % If the player has reached the exit, end game loop
            if isequal(player.position, maze.exit) 
                break
            end
        
        end
        HW4_display_maze_ai_1(maze, player)
        player.actions(player.moves+1:end) = [];
        player.rewards(player.moves+1:end) = [];
        p = [2,2];
        for step = 1:player.moves
            if player.rewards(step) ~= -100
                p = p + step_dir.(player.actions(step));
            end
            player.reward_data(p(1),p(2)) = player.reward_data(p(1),p(2)) + player.rewards(step);
            
        end
        player.reward_data

    end
    
    HW4_display_maze_v1(maze, player)
    fprintf( [...
        '\nCongratulations!\n' ...
        '    Number of Moves: %d\n' ...
        ], player.moves);
end
