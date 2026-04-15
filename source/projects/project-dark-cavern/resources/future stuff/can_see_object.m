% function result = can_see_object(maze, location)
% 
%     % Assume there is line of sight between player and object
%     result = true;
% 
%     % Get the start and end positions
%     p_r = maze.player.position(1);
%     p_c = maze.player.position(2);
%     o_r = location(1);
%     o_c = location(2);
% 
%     % Traverse from the starting position to the ending position
%     while p_r ~= o_r || p_c ~= o_c
% 
%         % Calculate the differences
%         dr = abs(o_r - p_r);
%         dc = abs(o_c - p_c);
% 
%         % Determine the direction of movement
%         r_step = sign(o_r - p_r);
%         c_step = sign(o_c - p_c);
% 
%         % Update row or col steps toward object
%         if dr > dc % Move in row direction only
%             c_step = 0;
%         elseif dc > dr % Move in col direction only
%             r_step = 0;
%         end
% 
%         % Move position toward object
%         p_r = p_r + r_step;
%         p_c = p_c + c_step;
% 
%         % Check if the new position is a wall
%         if maze.data(p_r, p_c) == 1
%             if p_r == o_r && p_c == o_c
%                 result = true;
%             else
%                 result = false;
%             end
%             return;
%         end
% 
%     end
% 
% end

function hasLineOfSight = can_see_object(maze, location)

hasLineOfSight = true;
    % Get the start and end positions
    startRow = maze.player.position(1);
    startCol = maze.player.position(2);
    endRow = location(1);
    endCol = location(2);
    
    % Calculate the differences
    deltaRow = abs(endRow - startRow);
    deltaCol = abs(endCol - startCol);
    
    % Determine the direction of movement
    stepRow = sign(endRow - startRow);
    stepCol = sign(endCol - startCol);

    % Initialize the error terms for the algorithm
    err = deltaCol - deltaRow;

    % Traverse from the starting position to the ending position
    while startRow ~= endRow || startCol ~= endCol
        % Check if the current cell is a wall

        if maze.data(startRow, startCol) == 1
            if startRow == endRow && startCol == endCol
                hasLineOfSight = true;
            else
                hasLineOfSight = false;
            end
            % hasLineOfSight = false;
            return;
        end
        
        % Update the error term and adjust the position accordingly
        e2 = 2 * err;
        if e2 > -deltaRow
            err = err - deltaRow;
            startCol = startCol + stepCol;
        end
        if e2 < deltaCol
            err = err + deltaCol;
            startRow = startRow + stepRow;
        end
    end

    % Check the final position (the object's position)
    % hasLineOfSight = maze.data(endRow, endCol) == 0;
end
