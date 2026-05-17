function [dist, next] = HW6Px_floyd_warshall(G)
    % Initialize the distance matrix with edge weights
    dist = inf(G.n, G.n);
    next = NaN(G.n, G.n); % For reconstructing paths
    
    % Set distances for direct edges
    for i = 1:G.m
        u = G.edges(i, 1);
        v = G.edges(i, 2);
        w = G.edges(i, 3); % Weight of the edge
        dist(u, v) = w;
        next(u, v) = v;
    end
    
    % Set distance for self-loops to 0
    for i = 1:G.n
        dist(i, i) = 0;
        next(i, i) = i;
    end
    
    % Floyd-Warshall Algorithm
    for k = 1:G.n
        for i = 1:G.n
            for j = 1:G.n
                if dist(i, k) + dist(k, j) < dist(i, j)
                    dist(i, j) = dist(i, k) + dist(k, j);
                    next(i, j) = next(i, k);
                end
            end
        end
    end
end
