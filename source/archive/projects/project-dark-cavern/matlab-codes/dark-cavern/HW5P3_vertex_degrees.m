function degrees = HW5P3_vertex_degrees(G)
    % The row sum of the adjacency matrix gives the degrees of each vertex
    degrees = sum(G.adj_mat,2);  
end