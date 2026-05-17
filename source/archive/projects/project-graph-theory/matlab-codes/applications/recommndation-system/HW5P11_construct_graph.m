function G = HW5P11_construct_graph(vertices, edges, graph_name)

    G = struct( ...
        'name', graph_name, ...
        'vertices', vertices, ...
        'n', length(vertices), ...
        'edges', edges, ...
        'm', height(edges) ...
        );

    G.adj_mat   = HW5P1_adjacency_matrix(G);
    G.inc_mat   = HW5P2_incidence_matrix(G);
    G.degrees   = HW5P3_vertex_degrees(G);
    G.simple    = HW5P4_is_simple(G);
    G.has_cycle = HW5P6_has_cycle(G);
    G.connected = HW5P7_is_connected(G);
    G.eulerian  = HW5P8_is_eulerian(G);
    G.tree      = HW5P9_is_tree(G);
    G.bipartite = HW5P10_is_bipartite(G);

    visualize_graph(G)
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
        I(E(e_id,1:2), e_id) = I(E(e_id,1:2), e_id) + 1;
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

function neighbors = HW5P5_get_neighbors(vertex, G)
    vertices = 1:height(G.adj_mat);
    neighbors = vertices(G.adj_mat(vertex,:) > 0);
end

function result = HW5P6_has_cycle(G)

    A = G.adj_mat;
    result = true;

    i = 1;
    while i <= height(A)
        if A(i,i) > 0
            return
        end
        if sum(A(i,:)) <= 1
            A(i,:) = [];
            A(:,i) = [];
            i = 1;
        else
            i = i + 1;
        end
    end

    if isempty(A)
        result = false;
    end
    
end

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

function result = HW5P8_is_eulerian(G)
    % Not eulerian if a single odd degree is found
    result = all(mod(G.degrees, 2) == 0);
end

function result = HW5P9_is_tree(G)
    result = HW5P7_is_connected(G) && ~HW5P6_has_cycle(G);
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

function visualize_graph(G)
    
    assert(isstruct(G),'The input must be a structure.')
    assert(isfield(G, 'edges'),'The input must have an mx2 edges field.')

    if ~isfield(G, 'v_labels')

        if isempty(G.vertices)
            % Add a title and force the aspect ratio to be 1:1
            title(['Graph Vizualization (' G.name ': NO VERTICES)']);
            axis square;
            return
        else
            G.v_labels = string(num2str(G.vertices'));
        end

    end

    if ~isfield(G, 'e_labels')
        G.e_labels = "e_{" + string(num2str((1:height(G.edges))') + "}");
    end

    if ~isfield(G, 'name')
        G.name = 'G';
    end
    
    visual_g = graph;
    visual_g = addnode(visual_g, G.n);
    visual_g.Nodes.Name = G.v_labels;

    for e_id = 1:height(G.edges)
        visual_g = addedge(visual_g, G.edges(e_id,1), G.edges(e_id,2));
    end

    figure
    p = plot(visual_g, 'Layout', 'force');

    [~,I] = sortrows(sort(G.edges,2));
    
    set(p, 'NodeLabel', {});
    set(p, 'EdgeLabel', G.e_labels(I));
    set(p, 'MarkerSize', 28);
    set(p, 'LineWidth', 2);
    set(p, 'NodeFontSize', 14);
    set(p, 'EdgeFontSize', 14);
    set(p, 'NodeColor', [0.2, 0.8, 0.6]);
    set(p, 'EdgeColor', [0.6, 0.6, 0.9]);
    for i = 1:length(G.v_labels)
        text(p.XData(i),p.YData(i),G.v_labels(i), ...
            'FontSize',14, ...
            'HorizontalAlignment','center', ...
            'VerticalAlignment','middle')
    end

    % Add a title and force the aspect ratio to be 1:1
    title(['Graph Vizualization (' G.name ')']);
    axis square;

end
