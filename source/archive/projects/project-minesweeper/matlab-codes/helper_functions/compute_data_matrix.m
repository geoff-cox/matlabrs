function state = compute_data_matrix(state)

    % Write this function
    n = state.n;
    data_buffer = zeros(n+2);
    data_buffer(2:end-1,2:end-1) = state.data;
    for r = 2:n+1
        for c = 2:n+1
            if data_buffer(r,c) ~= -1
                group = data_buffer(r-1:r+1,c-1:c+1);
                for k = 1:9
                    if group(k) == -1
                        data_buffer(r,c) = data_buffer(r,c) + 1;
                    end
                end
            end
        end
    end
    state.data = data_buffer(2:end-1,2:end-1);

end