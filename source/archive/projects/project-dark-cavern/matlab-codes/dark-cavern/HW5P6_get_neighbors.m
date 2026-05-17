function neighbors = HW5P6_get_neighbors(vertex, G)
    vertices = 1:height(G.adj_mat);
    neighbors = vertices(G.adj_mat(vertex,:) > 0);
end
