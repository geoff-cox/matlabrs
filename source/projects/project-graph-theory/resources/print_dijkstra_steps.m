% MATLAB Tutorial: Dijkstra's Algorithm - Idea and Example
clc; clear; close all;

% fprintf('--- Algorithm: Key Idea ---\n\n');
% fprintf('- Start with the source node and assign it a tentative cost of 0.\n');
% fprintf('- Assign all other vertices a tentative cost of infinity.\n');
% fprintf('- Iteratively select the non-permanent node with the smallest cost,\n');
% fprintf('  update costs to its neighbors, and mark it as permanent.\n');
% fprintf('- Repeat until all vertices are permanent.\n\n');

nodes = {'A'; 'B'; 'C'; 'D'; 'E'; 'F'}; % Node labels

V = 1:5;
E = [
    1 2 4;
    2 4 3;
    4 3 6;
    2 5 3;
    5 1 1;
    ];

V = 1:6;
E = [ 1 2 1; 
      1 3 7; 
      1 4 6; 
      2 3 2; 
      3 4 8; 
      3 5 3; 
      4 5 4; 
      4 6 6; 
      5 6 4 ];

nodes = {'A'; 'B'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H';'I'}; % Node labels
nodes = {'A'; 'B'; 'C'; 'D'; 'E'}; % Node labels
V = 1:5;
E = [
    1 3 5;
    % 2 5 3;
    % 9 5 3;
    % 2 9 9;
    2 5 9;
    3 1 3;
    1 2 2;
    3 2 10;
    % 2 6 4;
    ];

G = HW6P5_construct_directed_graph(V, E, 'Minimum Cost Algorithm');

G.v_labels = nodes;
visualize_directed_graph(G)

fprintf('Graph cost matrix:\n\n');
disp(G.cost_mat);

source = 3;
fprintf('--- Algorithm: Execution ---\n\n');

% [L, paths] = HW6P7_min_cost_paths(G, source);

tab = '    ';

% Initialize optimal costs and permanent flags
perm_cost = inf(1, G.n);
is_perm = false(1, G.n);
temp_cost = perm_cost;
temp_cost(source) = 0;   % Cost of source vertex

% Initialize paths
paths = cell(1, G.n);
paths{source} = source;

if G.m == 0
    return
end

fprintf('Source Vertex: %s\n\n', nodes{source});

% Main loop: Repeat until all vertices are permanent
while ~all(is_perm)
    
    fprintf('Temporary Costs: %s\n', mat2str(temp_cost));
    fprintf('Permanent Vertices: %s\n', mat2str(is_perm));
    fprintf('Permanent Costs: %s\n', mat2str(perm_cost));
    
    % Let v = non-permanent vertex with the optimal cost
    non_perm_vertices = G.vertices(~is_perm);
    [min_cost, min_idx] = min(temp_cost(~is_perm));
    v = non_perm_vertices(min_idx);
    is_perm(v) = true;
    perm_cost(v) = min_cost;

    print_paths(paths)

    
    fprintf('\n')
    fprintf('non-permanent vertex w/ min-cost: %s\n', nodes{v});
    
    % Find neighbors of the selected vertex
    is_neighbor = G.adj_mat(v, :) > 0;
    is_non_perm_neighbor = is_neighbor & ~is_perm;

    fprintf('%snon-permanent neighbors of %s: ', tab, nodes{v});
    if ~any(is_non_perm_neighbor)
        fprintf('NONE \n');
    else
        fprintf('%s \n', join(string(nodes(is_non_perm_neighbor)),", "));
    end
    
    % Update cost for non-permanent neighbors
    for n = G.vertices(is_non_perm_neighbor)
        % Find cost to this neighbor
        v_to_n_cost = perm_cost(v) + G.cost_mat(v, n);
        fprintf('%scost to move from %s -> %s = %g (currently = %g)', tab, nodes{v}, nodes{n}, v_to_n_cost, temp_cost(n));
        % Update temporary cost if this cost is cheaper
        if v_to_n_cost < temp_cost(n)
            fprintf(' update!\n');
            temp_cost(n) = v_to_n_cost;
            paths{n} = [paths{v}, n];
        else
            fprintf(' don''t update!\n');
        end
        fprintf('%s', tab);
        print_paths(paths)
    end
    
    fprintf('\nREPEAT\n\n');

end

fprintf('\nALL VERTICES are Permanent - DONE\n\n');
fprintf('--- Algorithm Completed ---\n\n');
fprintf('Shortest Costs from Vertex %s:\n\n', nodes{source});
VERTICES = string(nodes(G.vertices'));
MIN_COST_FROM_C = perm_cost';
PATH_FROM_C = [];
for k = 1:length(paths)
    if isempty(paths{k})
        PATH_FROM_C = [PATH_FROM_C; "None"];
    else
        PATH_FROM_C = [PATH_FROM_C; string(join(nodes(paths{k}),' -> '))];
    end
end
disp(table(VERTICES, MIN_COST_FROM_C, PATH_FROM_C))
perm_cost
paths

function print_paths(paths)

    fprintf('paths: { ')
    for k=1:length(paths)
        if isscalar(paths{k})
            fprintf('[%s], ', mat2str(paths{k}))
        else
            fprintf('%s, ', mat2str(paths{k}))
        end
    end
    fprintf('}\n')

end