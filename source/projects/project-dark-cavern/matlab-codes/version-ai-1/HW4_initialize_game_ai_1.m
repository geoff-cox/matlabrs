function [maze, player] = HW4_initialize_game_ai_1(height, width)
    
    % Maze Structure
    maze.walls = generate_maze(height, width);
    maze.h = height;
    maze.w = width;
    maze.icons.exit = '⛝';
    maze.icons.wall = '▓';
    maze.icons.open = '⛆';
    maze.icons.player = '⛄';
    maze.exit = HW4_select_random_location(maze, [2 2]);

    maze.rewards = struct('open',-1,'wall',-100);
    
    % Player structure
    player.position = [2, 2];
    player.moves = 0;
    player.direction = 's';
    player.reward_data = zeros(height,width);

end