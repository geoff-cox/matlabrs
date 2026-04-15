% HW5 Script - Graph Theory
clear; close all; clc;

graph_num = '05';

V_info = readtable( ...
    ['sample_graphs/graph_' graph_num '_vertices.csv'], ...
    'TextType','string');
E_info = readtable( ...
    ['sample_graphs/graph_' graph_num '_edges.csv'], ...
    'TextType','string');
vertices = (1:height(V_info.label))';
edges = [E_info.src E_info.dst];

G = HW5P11_construct_graph(vertices, edges, 'G');
visualize_graph(G);
disp(G)

% function A = HW5P1_adjacency_matrix(G)
%     % Initialize adjacency matrix
%     A = zeros(G.n, G.n);
%     E = G.edges;
% 
%     % non-directed graphs are symmetric so we only need one for-loop
%     for i = 1:height(E)
%         % Check for a loop edge
%         if E(i,1) == E(i,2)
%             A(E(i,1), E(i,2)) = A(E(i,2), E(i,1)) + 1;
%         else
%             A(E(i,1), E(i,2)) = A(E(i,1), E(i,2)) + 1;
%             A(E(i,2), E(i,1)) = A(E(i,2), E(i,1)) + 1;
%         end
%     end
% end
% 
% function I = HW5P2_incidence_matrix(G)
%     % Initialize incidence matrix
%     I = zeros(G.n, G.m);
%     E = G.edges;
% 
%     for e_id = 1:G.m
%         I(E(e_id,:), e_id) = I(E(e_id,:), e_id) + 1;
%     end
% end
% 
% function degrees = HW5P3_vertex_degrees(G)
%     % The row sum of the adjacency matrix gives the degrees of each vertex
%     degrees = sum(G.adj_mat,2);  
% end
% 
% function result = HW5P4_is_eulerian(G)
%     % Not eulerian if a single odd degree is found
%     result = all(mod(G.degrees, 2) == 0);
% end
% 
% function result = HW5P5_is_simple(G)
%     % A graph is not simple if it has a
%     %   1. loop (diagonal entry not 0), and
%     %   2. parallel edges (one entry is greater than 1)
%     result = true;
%     if sum(diag(G.adj_mat)) > 0
%         result = false;             % Condition 1 violated
%     else
%         for e = G.adj_mat(:)
%             if e > 1
%                 result = false;     % Condition 2 violated
%                 return
%             end
%         end
%     end
% end
% 
% function result = HW5P6_has_cycle(G)
% 
%     A = G.adj_mat;
%     result = true;
% 
%     if ~HW5P5_is_simple(G)
%         return
%     end
% 
%     r = 1;
%     while r <= height(A)
%         if sum(A(r,:)) <= 1
%             A(r,:) = [];
%             A(:,r) = [];
%             r = 1;
%         else
%             r = r + 1;
%         end
%     end
% 
%     if r == 1
%         result = false;
%     end
% 
% end
% 
% function neighbors = HW5P7_get_neighbors(v_index,A)
%     vertices = 1:height(A);
%     neighbors = vertices(A(v_index,:) > 0);
% end
% 
% function result = HW5P8_is_connected(G)
% 
%     visited = false(1, G.n);
%     queue = 1;
%     while ~isempty(queue)
%         next = queue(1);
%         visited(next) = true;
%         queue(1) = [];
%         neighbors = HW5P7_get_neighbors(next, G.adj_mat);
%         for neighbor = neighbors
%             if ~visited(neighbor)
%                 queue(end+1) = neighbor;
%             end
%         end
%     end
%     % Check if all vertices are visited
%     result = sum(~visited) == 0;
% end
% 
% function result = HW5P9_is_tree(G)
%     result = HW5P8_is_connected(G) && ~HW5P6_has_cycle(G);
% end
% 
% function result = HW5P10_is_bipartite(G)
%     % Assume bipartite
%     result = true;
%     % 0: uncolored, 1: color 1, -1: color 2
%     color = zeros(1, G.n);  
%     queue = 1;
%     color(1) = 1;
%     while ~isempty(queue)
%         next = queue(1);
%         queue(1) = [];
%         neighbors = HW5P7_get_neighbors(next, G.adj_mat);
%         for neighbor = neighbors
%             if color(neighbor) == 0
%                 color(neighbor) = -color(next);
%                 queue(end+1) = neighbor;
%             elseif color(neighbor) == color(next)
%                 result = false;
%                 return;
%             end
%         end
%     end
% 
% end
% 
% function G = HW5P11_construct_graph(vertex_info, edge_info, graph_name)
% 
%     vertices = 1:length(vertex_info.label);
%     edges = [edge_info.src edge_info.dst];
% 
%     G = struct( ...
%         'name', graph_name, ...
%         'vertices', vertices', ...
%         'v_labels', vertex_info.label, ...
%         'v_data', vertex_info.data, ...
%         'n', length(vertices), ...
%         'edges', edges, ...
%         'e_labels', edge_info.label, ...
%         'e_wts', edge_info.wt, ...
%         'm', height(edges) ...
%         );
% 
%     G.adj_mat   = HW5P1_adjacency_matrix(G);
%     G.inc_mat   = HW5P2_incidence_matrix(G);
%     G.degrees   = HW5P3_vertex_degrees(G);
%     G.eulerian  = HW5P4_is_eulerian(G);
%     G.simple    = HW5P5_is_simple(G);
%     G.has_cycle = HW5P6_has_cycle(G);
%     G.connected = HW5P8_is_connected(G);
%     G.tree      = HW5P9_is_tree(G);
%     G.bipartite = HW5P10_is_bipartite(G);
% 
% end
% 
% function visualize_graph(G)
% 
%     assert(isstruct(G),'The input must be a structure.')
%     assert(isfield(G, 'edges'),'The input must have an mx2 edges field.')
%     if ~isfield(G, 'v_labels')
%         G.v_labels = string(num2str((1:max(max(G.edges)))'));
%     end
%     if ~isfield(G, 'e_labels')
%         G.e_labels = "e_" + string(num2str((1:height(G.edges))'));
%     end
%     if ~isfield(G, 'name')
%         G.name = 'G';
%     end
% 
%     graph_plot = graph(G.edges(:,1), G.edges(:,2));
%     p = plot(graph_plot, 'Layout', 'force');
% 
%     [~,I] = sortrows(sort(G.edges,2));
% 
%     set(p, 'NodeLabel', {});
%     set(p, 'EdgeLabel', G.e_labels(I));
%     set(p, 'MarkerSize', 28);
%     set(p, 'LineWidth', 2);
%     set(p, 'NodeFontSize', 14);
%     set(p, 'EdgeFontSize', 14);
%     set(p, 'NodeColor', [0.2, 0.8, 0.6]);
%     set(p, 'EdgeColor', [0.6, 0.6, 0.9]);
%     for i = 1:length(G.v_labels)
%         text(p.XData(i),p.YData(i),G.v_labels(i), ...
%             'FontSize',14, ...
%             'HorizontalAlignment','center', ...
%             'VerticalAlignment','middle')
%     end
% 
%     % Add a title and force the aspect ratio to be 1:1
%     title(['Graph Vizualization (' G.name ')']);
%     axis square;
% 
% end
% 
