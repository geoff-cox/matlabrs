% =========================================================================
% This program detects if either player has an immediate winning move.
%   1  | X  
%   -1 | O 
%   0  | empty   
% INPUT:
%   game_state (3 x 3) current state of the TTT game board
% OUTPUT:
%   player_status (1 x 2) locations of winning moves for both players
% =========================================================================
%% Funutoin
function player_status = TTT_detect_winning_move_Basener(game_state)
    bar = TTT42_get_open_spaces_Basener(game_state);
    [h,w] = size(bar);
    player_status = [0,0];
    if w == 1
        player_status(1) = bar(1);
    elseif w == 0 

    else
        % FOR X ie 1
        found = 1;
        for i = 1:w
            test_state = game_state;
            test_state(bar(i)) = 1;
            if TTT41_winner_check_Basener(test_state) == 1 && found
               player_status(1) = bar(i);
               found = 0;
            end
        end
        % FOR O ie -1
        found = 1;
        for i = 1:w
            test_state = game_state;
            test_state(bar(i)) = -1;
            if TTT41_winner_check_Basener(test_state) == -1 && found
               player_status(2) = bar(i);
               found = 0;
            end
        end
    end
end

%% Old HW
function locations = TTT42_get_open_spaces_Basener(game_state)
    locations = [];
    n = 1;
    for i = 1:9
        if game_state(i) == 0
            locations(n) = i;
            n = n+1;
        end
    end
end
function winner = TTT41_winner_check_Basener(game_state)
    bar = P32_matrix_sums_Basener(game_state);
    [h,w] = size(bar);
    winner = 0;
    for i = 1:h
        if bar(i) == 3 
            winner = 1;
        end
        if bar(i) == -3 
            winner = -1;
        end
    end
end
function mat_sum = P32_matrix_sums_Basener(mat)
    [h,w] = size(mat);
    mat_sum = zeros(h+w+2,1);
    % add rows
    for i = 1:h
        mat_sum(i) = mat_sum(i) + sum(mat(i,1:end));
    end
    % add columns
    for j = 1:w
        mat_sum(h+j) = mat_sum(h+j) + sum(mat(1:end,j));
    end
    %diagles 
    dig = P31_diagonal_sums_Basener(mat);
    mat_sum(h+w+1) = dig(1);
    mat_sum(h+w+2) = dig(2);
end
function diag_sum = P31_diagonal_sums_Basener(mat)
    diag_sum = [0;0];
    [h,w] = size(mat);
    % first diagnle
    stop = 0;
    i = 1;
    j = 1;
    while stop == 0
        diag_sum(1) = diag_sum(1) + mat(i,j);
        if i == h || j == w
            stop = 1;
        end
        i = i+1;
        j = j+1;
    end
    % second diagnle
    stop = 0;
    i = h;
    j = 1;
    while stop == 0
        diag_sum(2) = diag_sum(2) + mat(i,j);
        if i == 1 || j == w
            stop = 1;
        end
        i = i-1;
        j = j+1;
    end
end
%% HR
% =========================================================================
% HR: Past HW
%
% =========================================================================