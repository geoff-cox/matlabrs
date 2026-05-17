function player = HW4_move_player_v3(maze, player, direction)

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
        if x == maze.key(1) && y == maze.key(2)
            player.has_key = true;
        end
        if x == maze.torch(1) && y == maze.torch(2)
            player.has_torch = true;
        end
        %new_sight = HW4_get_line_of_sight_v3(maze, player);
        player = HW4_line_of_sight_v3(maze, player);
        
    end

end