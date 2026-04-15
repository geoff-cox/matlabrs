% Function to display the maze
function HW3P8_display_maze(maze, player)
    clc
    
    [rows, cols] = size(maze.data);
    for i = 1:rows
        for j = 1:cols
            if i == player.position(1) && j == player.position(2)
                fprintf(':)');  % '@' for player
            elseif maze.data(i, j) == 1
                fprintf('##');  % '#' for walls
            else
                fprintf('  ');  % ' ' (emptyspace) for open paths
            end
        end
        fprintf('\n');
    end
end