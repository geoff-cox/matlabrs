% Application: Water Distribution Network Optimization
% Model a water distribution network as a graph:
% 
% Nodes represent reservoirs, treatment plants, and consumers.
% Edges represent pipelines with capacities (maximum flow rate).

% Extensions and Challenges
% * Allow students to modify the capacities dynamically.
% * Add scenarios where certain pipelines (edges) are unavailable, and 
% analyze the impact on the flow.
% * Introduce optimization scenarios, e.g., minimizing the cost of 
% upgrading pipeline capacities.

% Define the water distribution network
% Format: [start_node, end_node, capacity]
edges = [1 2 10; 1 3 5; 2 3 15; 2 4 10; 3 4 10; 3 5 5; 4 5 10];
G = HW6Px_construct_directed_graph(1:5, edges, 'Water Distribution Network');

% Compute maximum flow
[max_flow, flow_matrix] = HW6Px_max_flow(G, 1, 5);

% Display the results
fprintf('Maximum flow from source (1) to sink (5): %.2f\n', max_flow);
disp('Flow along each edge:');
disp(flow_matrix);

% Visualize the network and the flow
visualize_directed_graph_with_flow(G, flow_matrix);

% For the example network:
% 
% Nodes: 1, 2, 3, 4, 5
% Capacities:
% 1 → 2 (10), 1 → 3 (5), 2 → 3 (15), 2 → 4 (10), 3 → 4 (10), 3 → 5 (5), 4 → 5 (10)

% Maximum flow from source (1) to sink (5): 15.00
% Flow along each edge:
%      0    10     5     0     0
%      0     0     5    10     0
%      0     0     0     5     5
%      0     0     0     0    10
%      0     0     0     0     0

function visualize_directed_graph_with_flow(G, flow_matrix)
    figure;
    hold on;
    gplot(flow_matrix, G.vertices, '-o');
    for i = 1:G.m
        u = G.edges(i, 1);
        v = G.edges(i, 2);
        text(mean([G.vertices(u, 1), G.vertices(v, 1)]), ...
             mean([G.vertices(u, 2), G.vertices(v, 2)]), ...
             sprintf('%.1f', flow_matrix(u, v)), 'FontSize', 10, 'Color', 'red');
    end
    title(sprintf('Flow in %s', G.name));
    hold off;
end
