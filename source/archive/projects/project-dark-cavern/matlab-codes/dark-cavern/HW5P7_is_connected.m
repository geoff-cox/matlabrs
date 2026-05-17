function result = HW5P7_is_connected(G)
    
    if G.n == 0
        result = true;
        return
    end
    visited = false(1, G.n);
    queue = 1;
    while ~isempty(queue)
        next = queue(1);
        visited(next) = true;
        queue(1) = [];
        neighbors = HW5P6_get_neighbors(next, G);
        for neighbor = neighbors
            if ~visited(neighbor)
                queue(end+1) = neighbor;
            end
        end
    end
    % Check if all vertices are visited
    result = sum(~visited) == 0;
end