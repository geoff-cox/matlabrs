function is_dag = HW6Px_is_DAG(G)
    visited = zeros(1, G.n);
    recursion_stack = zeros(1, G.n);
    
    function has_cycle = dfs(v)
        if recursion_stack(v)
            has_cycle = true; % Cycle detected
            return;
        end
        if visited(v)
            has_cycle = false;
            return;
        end
        visited(v) = 1;
        recursion_stack(v) = 1;
        
        for w = find(G.adj_mat(v, :))
            if dfs(w)
                has_cycle = true;
                return;
            end
        end
        recursion_stack(v) = 0; % Backtrack
        has_cycle = false;
    end

    % Check all vertices
    for i = 1:G.n
        if ~visited(i) && dfs(i)
            is_dag = false;
            return;
        end
    end
    is_dag = true;
end