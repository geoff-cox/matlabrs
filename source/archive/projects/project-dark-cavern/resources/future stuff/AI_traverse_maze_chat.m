function AI_traverse_maze(maze, goal)
    % Player starts at [2,2]
    playerPos = [2, 2];
    
    % Display initial maze
    HW3P8_display_maze(maze, struct('position', playerPos));
    pause(0.5); % Pause to visualize the movement
    
    % Define direction vectors (right-hand rule)
    % [dy, dx] represents directions: right, down, left, up
    directions = [0, 1; 1, 0; 0, -1; -1, 0];
    currentDirection = 1; % Start facing 'right'

    % Continue until the goal is reached
    while ~isequal(playerPos, goal)
        % Attempt to move following the right-hand rule
        moved = false;
        for i = 1:4
            % Compute new direction by turning right
            newDirection = mod(currentDirection - 1 + i, 4) + 1;
            newRow = playerPos(1) + directions(newDirection, 1);
            newCol = playerPos(2) + directions(newDirection, 2);

            % Check if the move is valid (within maze bounds and not a wall)
            if maze(newRow, newCol) == 0
                % Move to the new position
                playerPos = [newRow, newCol];
                currentDirection = newDirection; % Update direction
                moved = true;
                
                % Display the maze with the new position
                HW3P8_display_maze(maze, struct('position', playerPos));
                pause(0.2); % Pause to visualize the movement
                
                break;
            end
        end

        % If no move is possible, continue to the next direction (backtracking)
        if ~moved
            % If no forward moves are possible, backtrack in the last direction
            newDirection = mod(currentDirection + 2, 4) + 1; % Reverse direction
            playerPos = playerPos + directions(newDirection, :);
        end
    end

    % Display the final message when the goal is reached
    fprintf('AI reached the goal at [%d, %d].\n', goal(1), goal(2));
end
