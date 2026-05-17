function maze = generate_maze(m, n)
    % Ensure m and n are odd to simplify path carving
    if mod(m, 2) == 0, m = m + 1; end
    if mod(n, 2) == 0, n = n + 1; end

    % Initialize maze with all walls (1)
    maze = ones(m, n);

    % Set player start position as a path (0)
    playerStart = [2, 2];
    maze(playerStart(1), playerStart(2)) = 0;

    % Initialize a stack with the starting point
    stack = playerStart;

    % Direction vectors for up, down, left, right
    directions = [-2 0; 2 0; 0 -2; 0 2];

    % Recursive carving loop
    while ~isempty(stack)
        % Get current cell from the top of the stack
        [currentRow, currentCol] = deal(stack(end, 1), stack(end, 2));
        stack(end, :) = []; % Pop the top of the stack

        % Randomly shuffle the directions to ensure random carving
        directions = directions(randperm(4), :);

        % Try each direction
        for i = 1:4
            % Compute new position based on the direction
            newRow = currentRow + directions(i, 1);
            newCol = currentCol + directions(i, 2);

            % Check if the new position is within bounds and is a wall
            if newRow > 1 && newRow < m && newCol > 1 && newCol < n && maze(newRow, newCol) == 1
                % Check if the position has at least 3 adjacent walls
                if sum(maze(newRow-1:newRow+1, newCol-1:newCol+1), 'all') >= 7
                    % Set the wall between current position and new position to path
                    maze((currentRow + newRow) / 2, (currentCol + newCol) / 2) = 0;
                    % Set the new position as path
                    maze(newRow, newCol) = 0;
                    % Push the new position onto the stack
                    stack = [stack; newRow, newCol];
                end
            end
        end
    end
end
