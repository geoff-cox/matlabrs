function I = HW5P2_incidence_matrix(G)
    % Initialize incidence matrix
    I = zeros(G.n, G.m);
    E = G.edges;

    for e_id = 1:G.m
        I(E(e_id,:), e_id) = I(E(e_id,:), e_id) + 1;
    end
end
