function visualize_graph(G)
    
    assert(isstruct(G),'The input must be a structure.')
    assert(isfield(G, 'edges'),'The input must have an mx2 edges field.')

    if ~isfield(G, 'adj_mat')
        G.adj_mat = adjacency_matrix(G);
    end

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

function A = adjacency_matrix(G)
    
    % Ensure we have what we need
    assert(isfield(G,'edges'), 'The graph must have an edges field');

    if ~isfield(G, 'vertices')
        G.vertices = 1:max(max(G.edges));
    end

    if ~isfield(G,'n')
        G.n = length(G.vertices);
    end

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