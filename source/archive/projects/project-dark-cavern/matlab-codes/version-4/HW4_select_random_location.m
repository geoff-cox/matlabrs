function location = HW4_select_random_location(maze, object_locations)
    
    reserved = maze.walls;
    for r = 1:height(object_locations)
        reserved(object_locations(r,1), object_locations(r,2));
    end

    location = [randi([1 height(reserved)]) randi([1 width(reserved)])];
    
    while reserved(location(1), location(2))
        location = [randi([1 height(reserved)]) randi([1 width(reserved)])];
    end

end