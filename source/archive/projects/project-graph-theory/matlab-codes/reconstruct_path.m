function path = HW6Px_reconstruct_path(next, start, end_node)
    if isnan(next(start, end_node))
        path = []; % No path exists
        return;
    end
    
    path = start;
    while start ~= end_node
        start = next(start, end_node);
        path = [path, start];
    end
end
