function result = HW5P5_has_cycle(G)
    
    A = G.adj_mat;
    result = true;

    if ~HW5P4_is_simple(G)
        return
    end

    r = 1;
    while r <= height(A)
        if sum(A(r,:)) <= 1
            A(r,:) = [];
            A(:,r) = [];
            r = 1;
        else
            r = r + 1;
        end
    end

    if r == 1
        result = false;
    end
    
end
