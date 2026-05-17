%HR: None
function[selection] = HW5P2_my_ai_move_Ramirez(game_state)

n = length(game_state.empty_space);
occupd_spaces = [];


for i = 1:n
    if game_state.empty_space(i) == 0
        occupd_spaces = [occupd_spaces i];
    end
end

god_matrix = [1 4 7; ...
    2 5 8; ...
    3 6 9; ...
    1 2 3; ...
    4 5 6; ...
    7 8 9; ...
    1 5 9; ...
    3 5 7];

%center space dominance + defense, first or second move
if sum(game_state.empty_space) == n
    selection = 5;
    return
elseif sum(game_state.empty_space) == n-1 && game_state.empty_space(5) == 0
    selection = 9;
    return
elseif sum(game_state.empty_space) == n-1
    selection = 5;
    return
end

%3rd and greater moves
for i = 1:height(god_matrix)
    for j = 1:3
        if god_matrix(i, j) == occupd_spaces(end)








            check = 0;
            m = length(occupd_spaces);

            if sum(game_state.empty_space) == 0
                selection = [];
                return
            end



            sum_list = HW3P10_row_col_diag_sums(game_state.data);

            r = height(sum_list);


            %finding winning moves
            for i = 1:r
                if sum_list(i) == 2
                    x_wng_ops = [x_wng_ops sum_list(i)];
                elseif sum_list(i) == -2
                    o_wng_ops = [o_wng_ops sum_list(i)];
                else
                    break
                end
            end
        end
    end
end
end


function values = HW3P10_row_col_diag_sums(board)

values(1:3) = sum(board, 2);
values(4:6) = sum(board)';
values(7)   = sum(board([1 5 9]));
values(8)   = sum(board([3 5 7]));

values = values';
end


