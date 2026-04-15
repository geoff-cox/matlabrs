function [V_info, E_info] = maze_to_graph(maze)
    % Convert maze to graph representation
    [rows, cols] = size(maze);
    n = nnz(maze == 0);
    m = n - 1;
    vertices = (1:n)';
    edges = zeros(m,2);
    v_labels = strings(n,1);
    v_data = zeros(n,2);
    v_id = 1;
    
    for r = 2:rows-1
        for c = 2:cols-1
            if maze(r,c) == 0
                v_labels(v_id) = r + "," + c;
                v_data(v_id,:) = [r,c];
                v_id = v_id + 1;
            end
        end
    end
    v_data_copy = v_data;
    vertices_copy = vertices;
    e_id = 1;

    while height(v_data_copy) > 0
        v_top = v_data_copy(1,:);
        v_id = vertices_copy(1);
        
        v_near_v_top = sum(abs(v_data_copy - v_top),2) == 1;
        neighbors = vertices_copy(v_near_v_top);
        L = length(neighbors);
        edges(e_id:e_id + L - 1,:) = [ones(L,1)*v_id neighbors];
        v_data_copy(1,:) = [];
        vertices_copy(1) = [];
        e_id = e_id + L;
    end

    V_info = struct('label', v_labels, 'data', v_data);
    E_info = struct('src', edges(:,1), 'dst', edges(:,2), 'wt', ones(m,1));

end
