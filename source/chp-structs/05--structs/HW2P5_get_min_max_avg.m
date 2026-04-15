function list_info = HW2P5_get_min_max_avg(list)

    n = length(list);
    m = inf;
    M = -inf;
    a = 0;
    n_non_nan = 0;         % number of non-NaN values
    for k = 1:n
        if list(k) < m
            m = list(k);
        end
        if list(k) > M
            M = list(k);
        end
        if ~isnan(list(k))
            a = a + list(k);
            n_non_nan = n_non_nan + 1;
        end
    end

    list_info.min = m;
    list_info.max = M;
    list_info.avg = a/n_non_nan;

end