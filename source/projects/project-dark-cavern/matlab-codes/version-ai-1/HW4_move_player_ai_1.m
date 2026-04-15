function player = HW4_move_player_ai_1(maze, player, direction)

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
    player.moves = player.moves + 1;
    player.direction = direction;
    player.actions(player.moves) = direction;
    
    % Apply move only if the new location is not a wall
    if maze.walls(x,y) == 0

        % Update player state
        player.position = [x y];
        player.rewards(player.moves) = maze.rewards.open;
    
    else
        player.rewards(player.moves) = maze.rewards.wall;
    end
    

end