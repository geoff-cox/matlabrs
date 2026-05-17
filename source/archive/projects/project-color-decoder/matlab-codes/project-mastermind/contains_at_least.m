function result = contains_at_least(M,amount,num)
    num_count = 0;
    [nrows,ncols] = size(M);
    for k = 1:ncols
        for j = 1:nrows
            if M(j,k) == num
                num_count = num_count + 1;
            end
        end
    end
    if num_count >= amount
        result = true;
    else
        result = false;
    end
end