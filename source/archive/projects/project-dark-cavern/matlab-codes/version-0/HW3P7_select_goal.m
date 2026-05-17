function goal = HW3P7_select_goal(maze, start)
    
    rand_row = randi([2 9]);
    rand_col = randi([2 9]);
    while isequal([rand_row, rand_col], start) || maze(rand_row, rand_col) == 1
        rand_row = randi([2 9]);
        rand_col = randi([2 9]);
    end
    goal = [rand_row, rand_col];
end