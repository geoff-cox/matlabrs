function [maze, player] = HW4_initialize_game_v1(height, width)
    
    % Player structure
    player.position = [2, 2];
    player.moves = 0;
    player.direction = 's';

    reserved_spaces = [2 2];
    
    % Maze Structure
    maze.walls = generate_maze(height, width);
    maze.h = height;
    maze.w = width;
    maze.icons.wall = '▓';
    maze.icons.exit = '⛝';
    maze.icons.open = '⛆';
    maze.icons.player = '⛄';
    maze.exit = HW4_select_random_location(maze, reserved_spaces);
    
end