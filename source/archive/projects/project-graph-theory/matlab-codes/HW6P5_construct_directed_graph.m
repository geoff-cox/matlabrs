function G = HW6P5_construct_directed_graph(vertices, edges, graph_name)

    % If no weights are given, assume they are 1
    if width(edges) < 3
        edges = [edges ones(height(edges), 1)];
    end

    G = struct( ...
        'name', graph_name, ...
        'vertices', vertices, ...
        'n', length(vertices), ...
        'edges', edges, ...
        'm', height(edges) ...
        );

    G.adj_mat       = HW6P1_directed_adjacency_matrix(G);
    G.cost_mat      = HW6P2_cost_matrix(G);
    G.out_degrees   = HW6P3_out_degrees(G);
    G.in_degrees    = HW6P4_in_degrees(G);

end