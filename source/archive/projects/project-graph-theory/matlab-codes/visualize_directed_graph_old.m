function visualize_directed_graph(G)
    
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

        if isempty(G.edges)
            G.e_labels = [];
        elseif width(G.edges) < 3
            G.e_labels = "e_{" + string(num2str((1:height(G.edges))') + "}");
        else
            G.e_labels = string(num2str(G.edges(:,3)));
        end

    end

    if ~isfield(G, 'name')
        G.name = 'G';
    end
    
    visual_g = digraph;
    visual_g = addnode(visual_g, G.n);
    visual_g.Nodes.Name = G.v_labels;

    for e_id = 1:height(G.edges)
        visual_g = addedge(visual_g, G.edges(e_id,1), G.edges(e_id,2));
    end

    figure
    p = plot(visual_g, 'Layout', 'force');
    
    set(p, 'NodeLabel', {});
    set(p, 'EdgeLabel', G.e_labels);
    set(p, 'MarkerSize', 24);
    set(p, 'LineWidth', 2);
    set(p, 'NodeFontSize', 12);
    set(p, 'EdgeFontSize', 12);
    set(p, 'NodeColor', [0.2, 0.8, 0.6]);
    set(p, 'EdgeColor', [0.6, 0.6, 0.9]);
    set(p, 'ArrowSize', 10);
    set(p, 'ArrowPosition', 0.9);
    for i = 1:length(G.v_labels)
        text(p.XData(i),p.YData(i),G.v_labels(i), ...
            'FontSize',14, ...
            'HorizontalAlignment','center', ...
            'VerticalAlignment','middle')
    end

    % Add a title and force the aspect ratio to be 1:1
    title(['Directed Graph Visualization (' G.name ')']);
    axis square;

end