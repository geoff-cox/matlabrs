function result = HW5P4_is_simple(G)
    % A graph is not simple if it has a
    %   1. loop (diagonal entry not 0), and
    %   2. parallel edges (one entry is greater than 1)
    result = true;
    if sum(diag(G.adj_mat)) > 0
        result = false;             % Condition 1 violated
    else
        for e = [G.adj_mat(:)]'
            if e > 1
                result = false;     % Condition 2 violated
                return
            end
        end
    end
end
