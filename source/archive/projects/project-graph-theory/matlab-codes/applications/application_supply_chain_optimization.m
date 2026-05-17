% Application: Supply Chain Optimization
% In this application, a supply chain is represented as a graph:
% 
% Vertices represent suppliers, factories, and stores.
% Edges represent transportation routes with weights corresponding to 
% transportation costs.
% The objective is to use the shortest path algorithm to find the least 
% costly route for delivering goods from suppliers to stores via factories.

% Define the supply chain graph
% Format: [from_node, to_node, cost]
edges = [1 2 4; 1 3 2; 2 4 5; 3 4 10; 3 5 3; 4 6 8; 5 6 4];
G = HW6Px_construct_directed_graph(1:6, edges, 'Supply Chain Network');

% Labels for vertices
labels = {'Supplier', 'Factory A', 'Factory B', 'Warehouse', 'Factory C', 'Store'};

% Find the shortest path from Supplier (1) to Store (6)
[start_node, end_node] = deal(1, 6);
[path, total_cost] = HW6Px_dijkstra(G, start_node, end_node);

% Display results
fprintf('Optimal supply chain path from %s to %s:\n', labels{start_node}, labels{end_node});
disp(labels(path));
fprintf('Total delivery cost: %.2f\n', total_cost);

% Visualize the graph with the optimal path highlighted
visualize_supply_chain(G, path, labels);

% Example Output: For the given graph:
% 
% Nodes: Supplier → Factory A → Warehouse → Store
% Total Delivery Cost: 17

function visualize_supply_chain(G, path, labels)
    figure;
    hold on;
    gplot(G.adj_mat, G.vertices, '-o');
    
    % Highlight the optimal path
    for i = 1:length(path)-1
        u = path(i);
        v = path(i+1);
        plot([G.vertices(u, 1), G.vertices(v, 1)], ...
             [G.vertices(u, 2), G.vertices(v, 2)], 'r-', 'LineWidth', 2);
    end
    
    % Label nodes
    for i = 1:G.n
        text(G.vertices(i, 1), G.vertices(i, 2), labels{i}, ...
             'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    end
    
    title('Supply Chain Optimization');
    hold off;
end
