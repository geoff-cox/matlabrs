function result = HW5P7_is_connected(G)
    
    if G.n == 0
        result = true;
        return
    end

    visited = false(1, G.n);
    queue = 1;
    in_queue = false(1, G.n);
    in_queue(queue) = true;
    while ~isempty(queue)
        next_in_line = queue(1);
        visited(next_in_line) = true;
        queue(1) = [];
        neighbors = HW5P5_get_neighbors(next_in_line, G);

        % logical index of neighbors that have not been visited and have
        % not been in the queue.
        not_visited = ~visited(neighbors);
        not_in_queue = ~in_queue(neighbors);

        % get only neighbors that have not been visited nor in the queue.
        new_in_queue = neighbors( not_visited & not_in_queue );

        % mark new queue neighbors as been in the queue and add them to 
        % the queue  
        in_queue(new_in_queue) = true;
        queue = [queue new_in_queue];
    end
    
    % Check if all vertices are visited
    result = all(visited);
end