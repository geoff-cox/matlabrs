% Personalized PageRank function
function scores = personalized_pagerank(G, start_nodes, alpha, tol)
    % Initialize scores
    n = size(G.Nodes, 1);
    scores = ones(n, 1) / n;
    r = zeros(n, 1);
    r(start_nodes) = 1 / length(start_nodes); % Personalization vector

    % Transition matrix
    adj_mat = adjacency(G);
    P = adj_mat ./ sum(adj_mat, 2, 'omitnan');

    % PageRank iteration
    diff = inf;
    while diff > tol
        new_scores = alpha * (P' * scores) + (1 - alpha) * r;
        diff = norm(new_scores - scores, 1);
        scores = new_scores;
    end
end