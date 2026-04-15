% Application: Disaster Response
% Model cities and roads as a graph:
% 
% Vertices represent cities.
% Edges represent roads with weights corresponding to their condition 
% after a disaster (higher weights mean worse conditions).
% Use the Minimum Spanning Tree (MST) to plan the best routes for emergency 
% aid, ensuring all cities are connected with minimum total effort.
%
% Extensions:
% * Allow students to dynamically modify edges 
%   Examples: simulate blocked roads or new factories.
% * Compute alternate paths in case of failures 
%   Examples: additional warehouses or city road detours.
% * Add cost analysis 
%   Examples: transportation cost in supply chain or aid delivery time 
%   in disaster response.

% Define the disaster response graph
% Format: [from_node, to_node, condition (higher = worse)]
edges = [
    1 2 10; 
    1 3 15; 
    2 3 5; 
    2 4 7; 
    3 5 8; 
    4 5 6; 
    4 6 10; 
    5 6 4
    ];
G = HW5P11_construct_graph(1:6, edges, 'Disaster Response Network');

% Labels for vertices
labels = {'City A', 'City B', 'City C', 'City D', 'City E', 'City F'};

% Compute the Minimum Spanning Tree
mst = HW6Px_minimum_spanning_tree(G);

% Display results
fprintf('Minimum Spanning Tree for disaster response:\n');
for i = 1:size(mst.edges, 1)
    fprintf('  %s -> %s: Condition = %d\n', ...
        labels{mst.edges(i, 1)}, labels{mst.edges(i, 2)}, mst.edges(i, 3));
end

% Example Output: For the given graph:
% 
% MST:
% City A → City B (10)
% City B → City C (5)
% City B → City D (7)
% City D → City E (6)
% City E → City F (4)
% Total Effort: 32

% Visualize the MST
visualize_disaster_response(G, mst, labels);

function visualize_disaster_response(G, mst, labels)
    figure;
    hold on;
    gplot(G.adj_mat, G.vertices, '-o');
    
    % Highlight the MST
    for i = 1:size(mst.edges, 1)
        u = mst.edges(i, 1);
        v = mst.edges(i, 2);
        plot([G.vertices(u, 1), G.vertices(v, 1)], ...
             [G.vertices(u, 2), G.vertices(v, 2)], 'g-', 'LineWidth', 2);
    end
    
    % Label nodes
    for i = 1:G.n
        text(G.vertices(i, 1), G.vertices(i, 2), labels{i}, ...
             'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    end
    
    title('Disaster Response Network');
    hold off;
end
