function G = construct_graph(vertex_info, edge_info, graph_name)

    edges = [edge_info.src edge_info.dst];

    if ~isfield(vertex_info, 'label')
        vertex_info.label = string(num2str((1:max(max(edges)))'));
    end
    
    vertices = 1:length(vertex_info.label);
    
    if ~isfield(edge_info, 'label')
        edge_info.label = "e_{" + string(num2str((1:height(edges))') + "}");
    end

    if ~isfield(edge_info, 'wt')
        edge_info.wt = ones(height(edges),1);
    end

    G = struct( ...
        'name', graph_name, ...
        'vertices', vertices', ...
        'v_labels', vertex_info.label, ...
        'v_data', vertex_info.data, ...
        'n', length(vertices), ...
        'edges', edges, ...
        'e_labels', edge_info.label, ...
        'e_wts', edge_info.wt, ...
        'm', height(edges) ...
        );

    G.adj_mat   = HW5P1_adjacency_matrix(G);
    G.inc_mat   = HW5P2_incidence_matrix(G);
    G.degrees   = HW5P3_vertex_degrees(G);
    G.simple    = HW5P4_is_simple(G);
    G.has_cycle = HW5P5_has_cycle(G);
    G.connected = HW5P7_is_connected(G);
    G.eulerian  = HW5P8_is_eulerian(G);
    G.tree      = HW5P9_is_tree(G);
    G.bipartite = HW5P10_is_bipartite(G);
    
end

function A = HW5P1_adjacency_matrix(G)
    % Initialize adjacency matrix
    A = zeros(G.n, G.n);
    E = G.edges;

    % non-directed graphs are symmetric so we only need one for-loop
    for i = 1:height(E)
        % Check for a loop edge
        if E(i,1) == E(i,2)
            A(E(i,1), E(i,2)) = A(E(i,2), E(i,1)) + 1;
        else
            A(E(i,1), E(i,2)) = A(E(i,1), E(i,2)) + 1;
            A(E(i,2), E(i,1)) = A(E(i,2), E(i,1)) + 1;
        end
    end
end

function I = HW5P2_incidence_matrix(G)
    % Initialize incidence matrix
    I = zeros(G.n, G.m);
    E = G.edges;

    for e_id = 1:G.m
        I(E(e_id,:), e_id) = I(E(e_id,:), e_id) + 1;
    end
end

function degrees = HW5P3_vertex_degrees(G)
    % The row sum of the adjacency matrix gives the degrees of each vertex
    degrees = sum(G.adj_mat,2);  
end

function result = HW5P4_is_simple(G)
    % A graph is not simple if it has a
    %   1. loop (diagonal entry not 0), and
    %   2. parallel edges (one entry is greater than 1)
    result = true;
    if sum(diag(G.adj_mat)) > 0
        result = false;             % Condition 1 violated
    else
        for e = [G.adj_mat(:)]'
            if e > 1
                result = false;     % Condition 2 violated
                return
            end
        end
    end
end

function result = HW5P5_has_cycle(G)
    
    A = G.adj_mat;
    result = true;

    if ~HW5P4_is_simple(G)
        return
    end

    r = 1;
    while r <= height(A)
        if sum(A(r,:)) <= 1
            A(r,:) = [];
            A(:,r) = [];
            r = 1;
        else
            r = r + 1;
        end
    end

    if r == 1
        result = false;
    end
    
end

function neighbors = HW5P6_get_neighbors(vertex, G)
    vertices = 1:height(G.adj_mat);
    neighbors = vertices(G.adj_mat(vertex,:) > 0);
end

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

function result = HW5P8_is_eulerian(G)
    % Not eulerian if a single odd degree is found
    result = all(mod(G.degrees, 2) == 0);
end

function result = HW5P9_is_tree(G)
    result = HW5P7_is_connected(G) && ~HW5P5_has_cycle(G);
end

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
        neighbors = HW5P6_get_neighbors(next, G);
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




























