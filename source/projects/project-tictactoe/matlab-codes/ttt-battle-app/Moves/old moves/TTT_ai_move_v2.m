function move_to = TTT_ai_move_v2(game_state,~)
    % check for winning moves
    player_status = TTT_detect_winning_move_Key(game_state);
    if player_status(1) ~= 0         % make a winning move
        move_to = player_status(1);
    elseif player_status(2) ~= 0     % block a winning move
        move_to = player_status(2);
    else
        move_to = TTT_ai_move_1_Key(game_state);
    end 
end

function move_to = TTT_ai_move_1_Key(game_state)
    open_spaces = TTT_get_open_spaces_Key(game_state);
    num_open_spaces = length(open_spaces);
    randomIndex = randi(num_open_spaces);
    move_to = open_spaces(randomIndex);
end
function locations = TTT_get_open_spaces_Key(game_state)
    n = numel(game_state);
    locations = zeros(1,n);
    j = 1;
    for k = 1:n
        if game_state(k) == 0
            locations(j) = k;
            j = j+1;
        end
    end
    locations(j:end) = [];
end
function player_status = TTT_detect_winning_move_Key(game_state)
    player_status = zeros(1,2);
    tempBoard = game_state;
    spaces = TTT_get_open_spaces_Key(game_state);
    player = [1 -1];
    for p = 1:2
        k = 1;
        done = 0;
        while k <= numel(spaces) && ~done
            tempBoard(spaces(k)) = player(p);
            if TTT_winner_check_Key(tempBoard) == player(p)
                player_status(p) = spaces(k);
                done = 1;
            end
            tempBoard = game_state;
            k = k + 1;
        end
    end
end
function winner = TTT_winner_check_Key(game_state)
    path_sums = P32_matrix_sums_Key(game_state);
    winner = 0;
    k = 1;
    while winner == 0 && k <= numel(path_sums)
        if path_sums(k) == 3
            winner = 1;
        elseif path_sums(k) == -3
            winner = -1;
        end
        k = k + 1;
    end
end
function values = P32_matrix_sums_Key(A)
    row_sums = sum(A,2);
    col_sums = sum(A)';
    dia_sums = P31_diagonal_sums_Key(A);
    values = [row_sums;col_sums;dia_sums];
end
function diag_sums = P31_diagonal_sums_Key(A)
    [m,n]=size(A);

    if m < n  % get the min of m and n
        max_i = m;
    else
        max_i = n;
    end

    down_diagonal_sum = 0; % initialize the sums
    up_diagonal_sum = 0;

    for i = 1:max_i
        down_diagonal_sum = down_diagonal_sum + A(i,i);
        up_diagonal_sum = up_diagonal_sum + A(m-i+1,i);
    end

    diag_sums = [down_diagonal_sum;up_diagonal_sum];
end