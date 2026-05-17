function components = HW6P6_get_components(G)
    % A: Adjacency matrix of the graph
    A = G.adj_mat;
    % V: Vertex array
    V = G.vertices;

    components = cell(1, G.n);
    
    n = size(A, 1);
    groups = zeros(1, n);
    group = 1;

    for i = 1:n

        if groups(i) == 0
            queue = i;
            groups(i) = group;
            
            while ~isempty(queue)

                is_neighbor = A(queue(1),:) > 0;
                is_not_grouped = groups == 0;
                non_grouped_neighbors = V(is_neighbor & is_not_grouped);
                queue = [queue non_grouped_neighbors];
                groups(is_neighbor) = group;
                queue(1) = [];
                
            end

            vertices = V(groups == group);
            components{group} = vertices;
            group = group + 1;

        end

    end

    components(group:end) = [];

end