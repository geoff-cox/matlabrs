function HW4_display_maze_v2(maze, player)
    clc
    
    p_row = player.position(1);
    p_col = player.position(2);   
    
    [rows, cols] = size(maze.walls);
    for i = 1:rows
        for j = 1:cols
            if i == p_row && j == p_col 
                fprintf(maze.icons.player);
            elseif maze.walls(i,j) == 1
                fprintf(maze.icons.wall);
            elseif maze.exit(1) == i && maze.exit(2) == j 
                fprintf(maze.icons.exit);
            elseif maze.key(1) == i && maze.key(2) == j && ~player.has_key
                fprintf(maze.icons.key);
            else
                fprintf(maze.icons.open);
            end
        end
        fprintf('\n');
    end
    
end