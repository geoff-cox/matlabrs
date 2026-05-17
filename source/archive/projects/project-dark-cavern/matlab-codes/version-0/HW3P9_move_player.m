% Player movement function
function player = HW3P9_move_player(maze, player, direction)
    % Get the current position
    x = player.position(1);
    y = player.position(2);

    % Determine new position based on direction
    if direction == 'w'
        newX = x - 1;
        newY = y;
    elseif direction == 's'
        newX = x + 1;
        newY = y;
    elseif direction == 'a'
        newX = x;
        newY = y - 1;
    elseif direction == 'd'
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