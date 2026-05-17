function degrees = HW6P4_in_degrees(G)
    % The row sum of the adjacency matrix gives the degrees of each vertex
    degrees = sum(G.adj_mat);
end