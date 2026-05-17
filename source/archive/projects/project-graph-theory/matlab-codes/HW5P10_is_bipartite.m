function result = HW5P10_is_bipartite(G)
    % Assume bipartite
    result = true;
    if G.n == 0
        return
    end
    % 0: uncolored, 1: color 1, -1: color 2
    color = zeros(1, G.n);  
    queue = 1;
    color(1) = 1;
    while ~isempty(queue)
        next = queue(1);
        queue(1) = [];
        neighbors = HW5P5_get_neighbors(next, G);
        for neighbor = neighbors
            if color(neighbor) == 0
                color(neighbor) = -color(next);
                queue(end+1) = neighbor;
            elseif color(neighbor) == color(next)
                result = false;
                return;
            end
        end
    end
    
end
