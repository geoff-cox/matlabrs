function result = HW5P6_has_cycle_directed(G)
    % Detect if a directed graph has a cycle using DFS
    % Inputs:
    %   G: Graph structure with adjacency matrix G.adj_mat
    % Outputs:
    %   result: true if the graph has a cycle, false otherwise

    % Initialize states: 0 = unvisited, 1 = visiting, 2 = visited
    states = zeros(1, G.n);
    result = false;

    % Helper function for DFS
    function has_cycle = dfs(node)
        if states(node) == 1
            % Node is in the visiting state -> cycle detected
            has_cycle = true;
            return;
        elseif states(node) == 2
            % Node is already fully visited -> no cycle here
            has_cycle = false;
            return;
        end

        % Mark node as visiting
        states(node) = 1;

        % Explore neighbors
        neighbors = find(G.adj_mat(node, :) > 0);
        for neighbor = neighbors
            if dfs(neighbor)
                has_cycle = true;
                return;
            end
        end

        % Mark node as visited
        states(node) = 2;
        has_cycle = false;
    end

    % Perform DFS for each unvisited node
    for i = 1:G.n
        if states(i) == 0
            if dfs(i)
                result = true;
                return;
            end
        end
    end
end
