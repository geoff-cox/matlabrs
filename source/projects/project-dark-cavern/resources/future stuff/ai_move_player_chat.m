function player = ai_move_player_chat(maze, player)
    % AI uses the right-hand rule to decide the next move.
    % Directions: right, down, left, up (clockwise order)
    directions = [0, 1; 1, 0; 0, -1; -1, 0];
    
    % If the AI does not have a stored direction, initialize it to 'right'
    if ~isfield(player, 'currentDirection')
        player.currentDirection = 1; % Start facing 'right'
    end
    
    % Get the current position of the player
    currentRow = player.position(1);
    currentCol = player.position(2);
    
    % Loop through the directions (following the right-hand rule)
    moved = false;
    for i = 1:4
        % Calculate the new direction index
        % Turning right first, then straight, left, then back.
        newDirection = mod(player.currentDirection - 1 + i, 4) + 1;
        newRow = currentRow + directions(newDirection, 1);
        newCol = currentCol + directions(newDirection, 2);

        % Check if the new position is within maze bounds and is a path (0)
        if maze.data(newRow, newCol) == 0
            % Move to the new position
            player.position = [newRow, newCol];
            player.currentDirection = newDirection; % Update facing direction
            player.moves = player.moves + 1; % Increment move counter
            
            % Mark this position as visited in the player's knowledge
            player.visited(newRow, newCol) = true;
            moved = true;
            break;
        end
    end
    
    % If no valid move is found (e.g., surrounded by walls), remain in place.
    if ~moved
        fprintf('AI is stuck. No valid moves found.\n');
    end
end