function A = HW6P1_directed_adjacency_matrix(G)
    % Initialize adjacency matrix
    A = zeros(G.n, G.n);
    E = G.edges;

    for i = 1:height(E)
        A(E(i,1), E(i,2)) = 1;
    end
end