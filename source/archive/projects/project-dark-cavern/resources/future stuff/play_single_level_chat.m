function score = HW4P10_play_single_level(maze, player)
    % Initialize score and timer for the level
    levelScore = 100; % Starting score for the level
    startTime = tic;

    % Game loop for a single level
    while ~isequal(player.position, maze.goal)
        HW3P8_display_maze(maze, player);

        % Get player's move
        fprintf('\nEnter move (w/a/s/d for direction, x to exit): ');
        direction = lower(char(getkey));

        % Exit game
        if direction == 'x'
            clc;
            fprintf('Game exited. Final score: %d\n', levelScore);
            return;
        end

        % Move the player
        player = HW3P9_move_player(maze, player, direction);

        % Decrease score as moves increase
        levelScore = levelScore - 1;

        % Add a chance for dynamic obstacles to move every few turns
        if mod(player.moves, 5) == 0
            maze.data = HW4P9_move_obstacles(maze.data);
        end
    end

    % Calculate time bonus
    timeTaken = toc(startTime);
    timeBonus = max(0, 50 - floor(timeTaken)); % Bonus points for completing faster

    % Display completion message
    fprintf('You completed the level in %d moves with a time bonus of %d points.\n', player.moves, timeBonus);

    % Return final score for the level
    score = levelScore + timeBonus;
end