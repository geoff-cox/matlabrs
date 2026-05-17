function A = HW6P2_cost_matrix(G)
    % Initialize cost matrix
    A = zeros(G.n, G.n);
    E = G.edges;

    for i = 1:height(E)
        A(E(i,1), E(i,2)) = E(i,3);
    end
end