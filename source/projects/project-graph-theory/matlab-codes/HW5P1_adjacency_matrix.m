function A = HW5P1_adjacency_matrix(G)
    % Initialize adjacency matrix
    A = zeros(G.n, G.n);
    E = G.edges;

    % non-directed graphs are symmetric so we only need one for-loop
    for i = 1:height(E)
        % Check for a loop edge
        if E(i,1) == E(i,2)
            A(E(i,1), E(i,2)) = A(E(i,2), E(i,1)) + 1;
        else
            A(E(i,1), E(i,2)) = A(E(i,1), E(i,2)) + 1;
            A(E(i,2), E(i,1)) = A(E(i,2), E(i,1)) + 1;
        end
    end
end