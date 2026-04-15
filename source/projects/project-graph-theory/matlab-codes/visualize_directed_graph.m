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

    if ~isfield(G, 'name')
        G.name = 'G';
    end

    m = height(G.edges);

    if ~isfield(G, 'e_labels')

        if m == 0
            G.e_labels = [];
        elseif width(G.edges) < 3
            G.edges(:,3) = ones(m,1);
            G.e_labels = "e_{" + string(num2str((1:height(G.edges))') + "}");
        else
            G.e_labels = string(num2str(G.edges(:,3)));
        end

    end

    e_table = table( ...
        G.edges(:,1:2), ...
        G.edges(:,3), ...
        G.e_labels, ...
        'VariableNames',{'EndNodes' 'cost' 'label'} ...
        );

    v_table = table( ...
        G.v_labels, ...
        'VariableNames',{'label'});
    
    visual_g = digraph(e_table, v_table);
    % visual_g = addnode(visual_g, G.n);
    % visual_g.Nodes.Name = G.v_labels;

    

    % for e_id = 1:height(G.edges)
    %     visual_g = addedge(visual_g, G.edges(e_id,1), G.edges(e_id,2));
    % end

    figure
    p = plot(visual_g, 'Layout', 'force');
    
    set(p, 'NodeLabel', {});
    set(p, 'EdgeLabel', visual_g.Edges.label);
    set(p, 'MarkerSize', 24);
    set(p, 'LineWidth', 2);
    set(p, 'NodeFontSize', 12);
    set(p, 'EdgeFontSize', 12);
    set(p, 'NodeColor', [0.2, 0.8, 0.6]);
    set(p, 'EdgeColor', [0.0, 0.0, 0.99]);
    set(p, 'ArrowSize', 10);
    set(p, 'ArrowPosition', 0.85);
    for i = 1:length(visual_g.Nodes.label)
        text(p.XData(i),p.YData(i),visual_g.Nodes.label(i), ...
            'FontSize',14, ...
            'HorizontalAlignment','center', ...
            'VerticalAlignment','middle')
    end

    % Add a title and force the aspect ratio to be 1:1
    title(['Directed Graph Visualization (' G.name ')']);
    axis square;

end