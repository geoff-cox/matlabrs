% MATLAB Tutorial: Dijkstra's Algorithm - Idea and Example
clc; clear; close all;

fprintf('--- Algorithm: Key Idea ---\n\n');

fprintf('Step 1: Initialize all primary variables\n');
fprintf('    > components \n');
fprintf('    > groups \n');
fprintf('Step 2: For each vertex, v, that is not in a group. \n');
fprintf('    > Add it to the next available group. \n');
fprintf('    > Traverse the graph through neighbors v. \n');

nodes = {'A'; 'B'; 'C'; 'D'; 'E'; 'F'; 'G'; 'H';'I'}; % Node labels
V = 1:9;
E = [
    1 3 4;
    2 5 3;
    9 5 3;
    2 9 9;
    2 4 9;
    3 8 2;
    1 8 2;
    2 6 4;
    ];


% nodes = {'A'; 'B'; 'C'; 'D'; 'E'; 'F'}; % Node labels
% V = 1:6;
% E = [ 1 2 1; 
%       1 3 7; 
%       1 4 6; 
%       2 3 2; 
%       3 4 8; 
%       3 5 3; 
%       4 5 4; 
%       4 6 6; 
%       5 6 4 ];

G = HW6P5_construct_directed_graph(V, E, 'Minimum Cost Algorithm');

G.v_labels = nodes;
visualize_directed_graph(G)

fprintf('Graph cost matrix:\n\n');
disp(G.cost_mat);

source = 1;
fprintf('--- Algorithm: Execution ---\n');

% Initialize Adjacency matrix and Vertex array
A = G.adj_mat;
V = G.vertices;

components = cell(G.n,1);
        
n = size(A, 1);
groups = zeros(1, n);
group = 1;

for i = 1:n

    fprintf('\nNode %s loop \n\n', nodes{i});
    
    if isempty(components{1})
        fprintf('    components = { [] ');
    else
        fprintf('    components = { %s', mat2str(components{1}));
    end

    for j = 2:length(components)
        if isempty(components{j})
            fprintf(', [] ');
        else
            fprintf(', %s', mat2str(components{j}));
        end
    end
    fprintf(' } \n');
    fprintf('    groups: %s\n', mat2str(groups));
    
    fprintf('    Is Node %s in a group? ', nodes{i});

    if groups(i) == 0

        fprintf('No, process it. \n');
        queue = i;
        groups(i) = group;
        visited = false(1, G.n);

        if isempty(queue)
            fprintf('        queue: %s\n', mat2str(queue));
            fprintf('        groups: %s\n', mat2str(groups));
            fprintf('        queue is empty. \n');
        end
        
        while ~isempty(queue)
            
            fprintf('\n        queue: %s\n', mat2str(queue));
            fprintf('        groups: %s\n', mat2str(groups));

            fprintf('        queue is not empty. \n');
            
            is_neighbor = A(queue(1),:) > 0;
            visited(queue(1)) = true;
            neighbors = V(is_neighbor);
            non_visited_neighbors = neighbors(~visited(neighbors));

            if ~any(non_visited_neighbors)
                fprintf('        Visited Neighbors: NONE \n');
            else
                fprintf('        Visited Neighbors: %s \n', join(string(nodes(non_visited_neighbors)),", "));
            end

            queue = [queue non_visited_neighbors];
            groups(is_neighbor) = group;
            queue(1) = [];
            
        end

        vertices = V(groups == group);
        components{group} = vertices;
        group = group + 1;

    else
        fprintf(' Yes, skip it. \n');
    end

end

components(group:end) = [];

fprintf('\n\n--- Algorithm Completed ---\n\n');

fprintf('Remove extra allocated components:\n\n');
if isempty(components{1})
    fprintf('    components = { [] ');
else
    fprintf('    components = { %s', mat2str(components{1}));
end
for j = 2:length(components)
    if isempty(components{j})
        fprintf(', [] ');
    else
        fprintf(', %s', mat2str(components{j}));
    end
end
fprintf(' } \n\n');
