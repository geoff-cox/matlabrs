function scores = personalized_pageranktt(adj_matrix, personalization_nodes, alpha, tol)
    % Personalized PageRank Algorithm
    % Inputs:
    %   adj_matrix: Adjacency matrix of the graph
    %   personalization_nodes: Indices of personalized nodes
    %   alpha: Damping factor (default 0.85)
    %   tol: Convergence tolerance (default 1e-6)
    % Output:
    %   scores: PageRank scores for all nodes
    
    % Parameters
    if nargin < 3, alpha = 0.85; end
    if nargin < 4, tol = 1e-6; end

    % Number of nodes
    n = size(adj_matrix, 1);

    % Personalization vector
    r = zeros(n, 1);
    r(personalization_nodes) = 1 / length(personalization_nodes);

    % Transition matrix
    out_degrees = sum(adj_matrix, 2);
    P = adj_matrix ./ out_degrees;

    % Initialize scores
    scores = ones(n, 1) / n;

    % Iterative computation
    diff = inf;
    while diff > tol
        new_scores = alpha * (P' * scores) + (1 - alpha) * r;
        diff = norm(new_scores - scores, 1);
        scores = new_scores;
    end
end
