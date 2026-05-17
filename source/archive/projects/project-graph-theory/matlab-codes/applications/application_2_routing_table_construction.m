% Application: Routing Table Construction
%
% Simulate a computer network where routers are nodes and link latencies 
% are edge weights. Compute and display routing tables for all routers.
%
% Define a network graph
edges = [
    1 2 1;
    1 3 4;
    2 3 2;
    2 4 6;
    3 4 3;
    4 1 7
    ];
G = HW6Px_construct_directed_graph(1:4, edges, 'Network Graph');

% Compute all-pairs shortest paths
[dist, next] = HW6Px_floyd_warshall(G);

% Display routing tables for all nodes
for i = 1:G.n
    fprintf('Routing Table for Router %d:\n', i);
    for j = 1:G.n
        if i ~= j
            path = HW6Px_reconstruct_path(next, i, j);
            fprintf('  To %d: Path = %s, Distance = %.2f\n', ...
                j, mat2str(path), dist(i, j));
        end
    end
    fprintf('\n');
end


% Expected Output
% For the example network:
% 
% Nodes: 1, 2, 3, 4
% Edges with weights (latencies):
% 1 → 2 (1), 1 → 3 (4), 2 → 3 (2), 2 → 4 (6), 3 → 4 (3), 4 → 1 (7)

% Routing Table for Router 1:
%   To 2: Path = [1 2], Distance = 1.00
%   To 3: Path = [1 2 3], Distance = 3.00
%   To 4: Path = [1 2 3 4], Distance = 6.00
% 
% Routing Table for Router 2:
%   To 1: Path = [2 3 4 1], Distance = 12.00
%   To 3: Path = [2 3], Distance = 2.00
%   To 4: Path = [2 3 4], Distance = 5.00
% 
% Routing Table for Router 3:
%   To 1: Path = [3 4 1], Distance = 10.00
%   To 2: Path = [3 4 1 2], Distance = 11.00
%   To 4: Path = [3 4], Distance = 3.00
% 
% Routing Table for Router 4:
%   To 1: Path = [4 1], Distance = 7.00
%   To 2: Path = [4 1 2], Distance = 8.00
%   To 3: Path = [4 1 2 3], Distance = 10.00
