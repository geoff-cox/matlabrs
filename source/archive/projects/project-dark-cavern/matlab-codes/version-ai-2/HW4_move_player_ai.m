function direction = HW4_move_player_ai(maze, direction)
    p_pos = maze.player.position;
    step = struct('s',[1,0],'w',[-1,0],'a',[0,-1],'d',[0,1]);
    right_dir = struct('s','a','w','d','a','w','d','s');
    left_turn = struct('s','d','w','a','a','s','d','w');
    dir = right_dir.(direction);
    while true
        p_pos = p_pos + step.(dir);
        if maze.data(p_pos(1),p_pos(2)) == 0
            direction = dir;
            break
        else
            % reset position and turn player to the left
            p_pos = maze.player.position;
            dir = left_turn.(dir);
        end
    end
end
