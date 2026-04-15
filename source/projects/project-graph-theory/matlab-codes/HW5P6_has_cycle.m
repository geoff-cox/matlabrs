function result = HW5P6_has_cycle(G)

    A = G.adj_mat;
    result = true;

    i = 1;
    while i <= height(A)
        if A(i,i) > 0
            return
        end
        if sum(A(i,:)) <= 1
            A(i,:) = [];
            A(:,i) = [];
            i = 1;
        else
            i = i + 1;
        end
    end

    if isempty(A)
        result = false;
    end
    
end