% The PageRank algorithm calculates the importance of nodes in a directed 
% graph based on their link structure. Below is a simplified 
% implementation using an iterative approach.

function ranks = HW6Px_pagerank(G, damping_factor, tol, max_iter)
    % Input:
    %   G - Graph structure with adjacency matrix (G.adj_mat)
    %   damping_factor - Probability to follow a link (default: 0.85)
    %   tol - Convergence tolerance (default: 1e-6)
    %   max_iter - Maximum number of iterations (default: 100)
    %
    % Output:
    %   ranks - Vector of PageRank values for each node

    if nargin < 2, damping_factor = 0.85; end
    if nargin < 3, tol = 1e-6; end
    if nargin < 4, max_iter = 100; end

    n = G.n;
    adj_mat = G.adj_mat;

    % Normalize adjacency matrix to create a stochastic matrix
    out_degrees = sum(adj_mat, 2);
    stochastic_mat = adj_mat ./ out_degrees;
    stochastic_mat(isnan(stochastic_mat)) = 0; % Handle dangling nodes

    % Transition matrix with damping
    P = damping_factor * stochastic_mat + (1 - damping_factor) / n * ones(n);

    % Initialize ranks
    ranks = ones(n, 1) / n;

    % Iterative calculation
    for iter = 1:max_iter
        new_ranks = P' * ranks;
        if norm(new_ranks - ranks, 2) < tol
            break;
        end
        ranks = new_ranks;
    end
end

