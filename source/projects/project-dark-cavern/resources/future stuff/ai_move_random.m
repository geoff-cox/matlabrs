function player = ai_move_random(maze, player)
    
    new_r = player.position(1);
    new_c = player.position(2);
    possible_directions = [];

    if player.sight(new_r+1,new_c) && ...
            ~maze.data(new_r+1,new_c) && ~player.visited(new_r+1,new_c)
        possible_directions = [possible_directions;  1  0];
    end
    if player.sight(new_r-1,new_c) && ...
            ~maze.data(new_r-1,new_c) && ~player.visited(new_r-1,new_c)
        possible_directions = [possible_directions; -1  0];
    end
    if player.sight(new_r,new_c+1) && ...
            ~maze.data(new_r,new_c+1) && ~player.visited(new_r,new_c+1)
        possible_directions = [possible_directions;  0  1];
    end
    if player.sight(new_r,new_c-1) && ...
            ~maze.data(new_r,new_c-1) && ~player.visited(new_r,new_c-1)
        possible_directions = [possible_directions;  0 -1];
    end

    player.position = player.position + ...
        possible_directions(randi(height(possible_directions)),:);

    player.moves = player.moves + 1;
    new_sight = get_line_of_sight(maze,player);
    player.sight = player.sight + (~player.sight & new_sight);
    player.visited(player.position(1),player.position(2)) = true;

end
