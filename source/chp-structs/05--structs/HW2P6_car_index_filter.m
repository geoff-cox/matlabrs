function index_list = HW2P6_car_index_filter(data, feature, value)

    index_list = [];
    
    if ~isfield(data, feature)
        return
    end

    values = data.(feature);
    n = length(values);
    
    index_list = false(n,1);

    if isa(value, 'char') 
    
        char_len = length(value);
        for k = 1:n
            if values(k,1:char_len) == value
                index_list(k) = true;
            end
        end

    elseif isa(value, 'double')

        for k = 1:n
            if values(k) == value
                index_list(k) = true;
            end
        end

    end

end