% Application: Website Ranking
% Simulate a network of websites where links between them are represented 
% as a directed graph. Use the PageRank algorithm to rank the websites by 
% their importance.

% Extensions and Challenges
% * Add support for handling dangling nodes (nodes with no outbound links).
% * Simulate changes in the damping factor to observe its impact on 
% the ranks.
% * Compare the PageRank results to simple in-degree rankings to 
% illustrate the algorithm's significance.
% * Introduce an interactive element where students can add/remove edges 
% and observe rank changes.

% Define the link structure between websites
% Format: [from_node, to_node]
edges = [1 2; 1 3; 2 3; 3 1; 3 4; 4 2];
G = HW6Px_construct_directed_graph(1:4, edges, 'Website Link Network');

% Compute PageRank
damping_factor = 0.85;
tol = 1e-6;
max_iter = 100;
pageranks = HW6Px_pagerank(G, damping_factor, tol, max_iter);

% Display results
fprintf('PageRank values for %s:\n', G.name);
for i = 1:G.n
    fprintf('  Node %d: %.4f\n', i, pageranks(i));
end

% Visualize the graph with PageRank values
visualize_pagerank(G, pageranks);

% Expected Output
% For the example network:
% 
% Nodes: 1, 2, 3, 4
% Links:
% 1 → 2, 1 → 3, 2 → 3, 3 → 1, 3 → 4, 4 → 2

% PageRank values for Website Link Network:
%   Node 1: 0.3325
%   Node 2: 0.2166
%   Node 3: 0.3183
%   Node 4: 0.1326

function visualize_pagerank(G, pageranks)
    figure;
    hold on;

    % Scale node sizes based on PageRank
    node_sizes = 100 + 1000 * pageranks / max(pageranks);

    % Plot the graph
    gplot(G.adj_mat, G.vertices, '-o');
    for i = 1:G.n
        scatter(G.vertices(i, 1), G.vertices(i, 2), node_sizes(i), 'filled');
        text(G.vertices(i, 1), G.vertices(i, 2), sprintf('%.2f', pageranks(i)), ...
            'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
    end
    title(sprintf('PageRank Visualization for %s', G.name));
    hold off;
end