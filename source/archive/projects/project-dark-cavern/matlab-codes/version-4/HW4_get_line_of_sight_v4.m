% version 3 helper function
function line_of_sight = HW4_get_line_of_sight_v4(maze, player)

    line_of_sight = false(maze.h, maze.w);
    p = player;

    % Get the start row and column
    p_r = p.position(1);
    p_c = p.position(2);
    
    % Add current position to line of sight
    line_of_sight(p_r,p_c) = true;

    % Set r and c and look left
    r = p_r;
    c = p_c;
    while maze.walls(r, c) == 0
        c = c - 1;
        line_of_sight(r-1:r+1,c) = true;
        if ~p.has_torch && abs(p_c - c) >= 1
            break
        end
    end

    % Reset c and look right
    c = p_c;
    while maze.walls(r, c) == 0
        c = c + 1;
        line_of_sight(r-1:r+1,c) = true;
        if ~p.has_torch && abs(p_c - c) >= 1
            break
        end
    end

    % Reset c and look up
    c = p_c;
    while maze.walls(r, c) == 0
        r = r - 1;
        line_of_sight(r,c-1:c+1) = true;
        if ~p.has_torch && abs(p_r - r) >= 1
            break
        end
    end

    % Reset r and look down
    r = p_r;
    while maze.walls(r, c) == 0
        r = r + 1;
        line_of_sight(r,c-1:c+1) = true;
        if ~p.has_torch && abs(p_r - r) >= 1
            break
        end
    end

end