% Implement the Edmonds-Karp Algorithm, a BFS-based implementation of 
% the Ford-Fulkerson method, for computing the maximum flow in a network.

function [max_flow, flow_matrix] = HW6Px_max_flow(G, source, sink)
    % Initialize the flow and residual capacity matrices
    flow_matrix = zeros(G.n, G.n);
    residual_capacity = G.adj_mat; % Use adjacency matrix as capacity

    max_flow = 0;

    while true
        % Find an augmenting path using BFS
        [parent, path_flow] = HW6Px_find_augmenting_path(residual_capacity, source, sink);
        
        if path_flow == 0
            break; % No augmenting path found, algorithm terminates
        end

        % Update residual capacities and flow matrix along the path
        v = sink;
        while v ~= source
            u = parent(v);
            flow_matrix(u, v) = flow_matrix(u, v) + path_flow;
            flow_matrix(v, u) = flow_matrix(v, u) - path_flow; % Reverse flow
            residual_capacity(u, v) = residual_capacity(u, v) - path_flow;
            residual_capacity(v, u) = residual_capacity(v, u) + path_flow;
            v = u;
        end

        % Update the total flow
        max_flow = max_flow + path_flow;
    end
end

function [parent, path_flow] = HW6Px_find_augmenting_path(residual_capacity, source, sink)
    % Perform BFS to find an augmenting path
    parent = -1 * ones(1, size(residual_capacity, 1));
    visited = false(1, size(residual_capacity, 1));
    queue = [source];
    visited(source) = true;

    while ~isempty(queue)
        u = queue(1);
        queue(1) = []; % Dequeue

        for v = 1:size(residual_capacity, 1)
            if ~visited(v) && residual_capacity(u, v) > 0
                parent(v) = u;
                visited(v) = true;

                if v == sink
                    % Found an augmenting path, compute the flow
                    path_flow = inf;
                    while v ~= source
                        u = parent(v);
                        path_flow = min(path_flow, residual_capacity(u, v));
                        v = u;
                    end
                    return;
                end

                queue(end + 1) = v; % Enqueue
            end
        end
    end

    path_flow = 0; % No augmenting path found
end
