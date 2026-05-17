function topo_order = HW6Px_topological_sort(G)
    % Ensure the graph is a DAG
    if ~HW6Px_is_DAG(G)
        error('Graph is not a DAG, topological sort is undefined.');
    end
    
    % Initialize in-degree array
    in_degree = HW6Px_in_degrees(G);
    zero_in_degree = G.vertices(in_degree == 0); % Nodes with no incoming edges
    topo_order = [];
    
    % Kahn's Algorithm
    while ~isempty(zero_in_degree)
        % Save 1st zero in-deg node, delete it & add it to the topo order
        v = zero_in_degree(1);
        zero_in_degree(1) = [];
        topo_order = [topo_order, v];
        
        % Reduce the in-degree of each of its neighbors
        neighbors = G.vertices(G.adj_mat(v, :) > 0);
        in_degree(neighbors) = in_degree(neighbors) - 1;
        zero_deg_neighbors = neighbors(in_degree(neighbors) == 0);
        zero_in_degree = [zero_in_degree zero_deg_neighbors];
    end
    
    % Check if all nodes are in topo_order
    if length(topo_order) ~= G.n
        error('Graph contains a cycle, topological sort failed.');
    end
end