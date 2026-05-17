% Dijkstra's Algorithm: Shortest paths from a source node in a graph
% Inputs:
%   G: Graph structure with the following fields:
%       G.n: Number of nodes
%       G.vertices: List of vertex indices
%       G.edges: Matrix [source, destination, weight]
%       G.adj_mat: Adjacency matrix
%   source: Index of the source node
% Outputs:
%   L: Shortest costs from source to all nodes
%   paths: Cell array of smallest paths to all nodes

function [cost, paths] = HW6P7_min_cost_paths(G, source)
    
    % Initialize optimal costs and permanent flags
    cost = inf(1, G.n);
    is_permanent = false(1, G.n);
    temp_cost = cost;
    temp_cost(source) = 0;   % Cost of source vertex
    
    % Initialize paths
    paths = cell(1, G.n);
    paths{source} = source;

    if G.m == 0
        return
    end
    
    % Main loop: Repeat until all vertices are permanent
    while ~all(is_permanent)
        % Let v = non-permanent vertex with the optimal cost
        non_perm_vertices = G.vertices(~is_permanent);
        [min_cost, min_idx] = min(temp_cost(~is_permanent));
        v = non_perm_vertices(min_idx);
        is_permanent(v) = true;
        cost(v) = min_cost;
        
        % Find neighbors of the selected vertex
        is_neighbor = G.adj_mat(v, :) > 0;
        is_non_perm_neighbor = is_neighbor & ~is_permanent;
        
        % Update cost for non-permanent neighbors
        for n = G.vertices(is_non_perm_neighbor)
            % Find cost to this neighbor
            v_to_n_cost = cost(v) + G.cost_mat(v, n);
            % Update temporary cost if this cost is cheaper
            if v_to_n_cost < temp_cost(n)
                temp_cost(n) = v_to_n_cost;
                paths{n} = [paths{v}, n];
            end
        end
    end
end
