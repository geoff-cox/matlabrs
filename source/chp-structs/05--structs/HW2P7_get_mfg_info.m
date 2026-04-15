function mfg_info = HW2P7_get_mfg_info(data, selected_mfg)

    index_list = HW2P6_car_index_filter(data, 'Mfg', selected_mfg);
    
    O = data.Origin(index_list,:);
    
    A_info = HW2P5_get_min_max_avg(data.Acceleration(index_list));
    D_info = HW2P5_get_min_max_avg(data.Displacement(index_list));
    H_info = HW2P5_get_min_max_avg(data.Horsepower(index_list));
    M_info = HW2P5_get_min_max_avg(data.MPG(index_list));
    W_info = HW2P5_get_min_max_avg(data.Weight(index_list));

    mfg_info.manufacturer = selected_mfg;
    mfg_info.country = O(1,:);
    mfg_info.number_of_models = length(O);
    mfg_info.acceleration = A_info;
    mfg_info.displacement = D_info;
    mfg_info.horsepower = H_info;
    mfg_info.mpg = M_info;
    mfg_info.weight = W_info;

end