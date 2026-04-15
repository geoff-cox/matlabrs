function selection = HW5P2_my_ai_move_Dougherty(state)

h = [1 4 7 ; 2 5 8 ; 3 6 9];
position = HW3P10_row_col_diag_sums_DOUGHERTY(state.data);
position_length = length(position);
[n m] = size(state.data);

x_pos = 0;
o_pos = 0;

if state.player == 1
    w = 1;
else
    w = -1;
end


for i = 1 : position_length
    if position(i) == 2
        x_pos = 1;
        o_pos = -1;
        break
    end
end
for i = 1 : position_length
    if position(i) == -2
        x_pos = -1;
        o_pos = 1;
        break
    end
end


if w == 1
    if x_pos == 1
        for k = 1 : m
            for j = 1 : n
                if state.data(j , k) == 0
                    for v = 1 : position_length
                        state.data(j , k) = 1;
                        new_position = HW3P10_row_col_diag_sums_DOUGHERTY(state.data);
                        if new_position(v) == 3
                            selection = h(j , k)
                            state.data(j , k) = 0;
                            w = 0;
                            x_pos = 0;
                            break
                        end
                        state.data(j , k) = 0
                    end
                end
                if w == 0
                    break
                end
            end
            if w == 0
                break
            end
        end
    elseif x_pos == -1
        for k = 1 : m
            for j = 1 : n
                if state.data(j , k) == 0
                    for v = 1 : position_length
                        state.data(j , k) = -1;
                        new_position = HW3P10_row_col_diag_sums_DOUGHERTY(state.data);
                        if new_position(v) == -3
                            selection = h(j , k);
                            state.data(j , k) = 0;
                            w = 0;
                            x_pos = 0;
                            break
                        end
                        state.data(j , k) = 0;
                    end
                end
                if w == 0
                    break
                end
            end
            if w == 0
                break
            end                
        end
    elseif state.data(2 , 2) == 0
        selection = 5;
    elseif state.data(1 , 3) == 0
        selection = 7;
    elseif state.data(1 , 1) == 0
        selection = 1;
    else
        selection = HW4P9_dumb_ai_move_DOUGHERTY(state.data);
    end
elseif w == -1
    if o_pos == 1
        for k = 1 : m
            for j = 1 : n
                if state.data(j , k) == 0
                    for v = 1 : position_length
                        state.data(j , k) = -1;
                        new_position = HW3P10_row_col_diag_sums_DOUGHERTY(state.data);
                        if new_position(v) == -3
                            selection = h(j , k);
                            state.data(j , k) = 0;
                            w = 0;
                            o_pos = 0;
                            break
                        end
                        state.data(j , k) = 0;
                    end
                end
                if w == 0
                    break
                end
            end
            if w == 0
                break
            end
        end
    elseif o_pos == -1
        for k = 1 : m
            for j = 1 : n
                if state.data(j , k) == 0
                    for v = 1 : position_length
                        state.data(j , k) = 1;
                        new_position = HW3P10_row_col_diag_sums_DOUGHERTY(state.data);
                        if new_position(v) == 3
                            selection = h(j , k);
                            state.data(j , k) = 0;
                            w = 0;
                            o_pos = 0;
                            break
                        end
                        state.data(j , k) = 0;
                    end
                end
                if w == 0
                    break
                end
            end
            if w == 0
                break
            end
        end
    elseif state.data(2 , 2) == 0
        selection = 5;
    elseif state.data(1 , 3) == 0
        selection = 7;
    elseif state.data(1 , 1) == 0
        selection = 1;
    else
        selection = HW4P9_dumb_ai_move_DOUGHERTY(state.data);
    end
end

end

function sum_list = HW3P10_row_col_diag_sums_DOUGHERTY(A)
[m , n] = size(A);
sum_list = [];

for k = 1 : m
    Sum = 0;
    for j = 1 : n
        Sum = Sum + A(k , j);
    end
    sum_list = [sum_list ; Sum];
end

for k = 1 : n
    Sum = 0;
    for j = 1 : m
        Sum = Sum + A(j , k);
    end
    sum_list = [sum_list ; Sum];
end

if m < n
    Sum = 0;
    for k = 1 : m
        Sum = Sum + A(k , k);
    end
    sum_list = [sum_list ; Sum];
else
    Sum = 0;
    for k = 1 : n
        Sum = Sum + A(k , k);
    end
    sum_list = [sum_list ; Sum];
end


Sum = 0;
q = 1;
if m < n

    while m >= 1
        Sum = Sum +  A(m , q);
        q = q + 1;
        m = m - 1;
    end
else

    while n >= 1
        Sum = Sum + A(m , q);
        q = q + 1;
        m = m - 1;
        n = n - 1;
    end
end

sum_list = [sum_list ; Sum];

end

function selection = HW4P9_dumb_ai_move_DOUGHERTY(state)

state_absolute = abs(state);
total = sum(sum(state_absolute));

if total == 9
    selection = [];
end


while total < 9

    x = randi(9);
    if state(x) == 0
        selection = x;
        total = total + 1;
        break
    end
end
end
                    

    
