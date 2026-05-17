% Function to display the maze
function HW4_display_maze_v4(maze,player)

    clc

    p_r = player.position(1);
    p_c = player.position(2);
    sight = player.sight;
    
    [rows, cols] = size(maze.walls);
    for i = 1:rows
        for j = 1:cols
            if i == p_r && j == p_c 
                fprintf(maze.icons.player);
            elseif maze.walls(i,j) == 1 && sight(i,j)
                fprintf(maze.icons.wall);
            elseif maze.exit(1) == i && maze.exit(2) == j && sight(i,j)
                fprintf(maze.icons.exit);
            elseif maze.key(1) == i && maze.key(2) == j && ...
                    ~player.has_key && sight(i,j)
                fprintf(maze.icons.key);
            elseif maze.torch(1) == i && maze.torch(2) == j && ...
                    ~player.has_key && ~player.has_torch && sight(i,j)
                fprintf(maze.icons.torch);
            elseif maze.sword(1) == i && maze.sword(2) == j && ...
                    ~player.has_key && ~player.has_torch && ~player.has_sword && sight(i,j)
                fprintf(maze.icons.sword);
            else
                fprintf(maze.icons.open);
            end
        end
        fprintf('\n');
    end
end