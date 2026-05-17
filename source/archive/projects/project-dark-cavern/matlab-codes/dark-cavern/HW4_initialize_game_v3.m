function [maze, player] = HW4_initialize_game_v3(height, width)
    
    reserved_spaces = [2 2];
    
    % Maze Structure
    maze.walls = generate_maze(height, width);
    maze.h = height;
    maze.w = width;
    maze.icons.wall = '▓';
    maze.icons.exit = '⛝';
    maze.icons.open = '⛆';
    maze.icons.player = '⛄';
    maze.icons.key = '⚿';
    maze.icons.torch = '✨';
    maze.icons.dark = '█';  % █
    
    maze.exit = HW4_select_random_location(maze, reserved_spaces);
    reserved_spaces = [reserved_spaces; maze.exit];
    maze.key = HW4_select_random_location(maze, reserved_spaces);
    reserved_spaces = [reserved_spaces; maze.key];
    maze.torch = HW4_select_random_location(maze, reserved_spaces);

    % Player structure
    player.position = [2, 2];
    player.moves = 0;
    player.direction = 's';
    player.has_key = false;
    player.has_torch = false;
    player = HW4_line_of_sight_v3(maze, player);
    
end