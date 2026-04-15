% =========================================================================
% This program detects if either player has an immediate winning move.
%
% INPUT:
%   game_state (3 x 3) current state of the TTT game board
% OUTPUT:
%   player_status (1 x 2) locations of winning moves for both players
% =========================================================================
function player_status = TTT_detect_winning_move_Calhoun(game_state)
    player_status = [0,0];
    winner = TTT41_winner_check_Calhoun(game_state);
    L = numel(game_state);
    new_game_state1 = game_state;
    new_game_state2 = game_state;
%     while winner == 0
        for i = 1:L
            if game_state(i) == 0
                new_game_state1(i) = 1;
                winner1 = TTT41_winner_check_Calhoun(new_game_state1);
                new_game_state1 = game_state;
                    
                new_game_state2(i) = -1;
                winner2 = TTT41_winner_check_Calhoun(new_game_state2);
                new_game_state2 = game_state;
                    
                if winner1 == 1 && player_status(1) == 0
                    player_status(1) = i;
%                     winner = 1;
                end
                if winner2 == -1 && player_status(2) == 0
                    player_status(2) = i;
%                     winner = -1;
                end
                if player_status(1) > 0 && player_status(2) > 0
                    return
                end
%                 else
%                     winner = 0;
%                     new_game_state1 = game_state;
%                     new_game_state2 = game_state;
%                 end
            end
        end
%     end
end

function locations = TTT42_get_open_spaces_Calhoun(game_state)
    locations = P22_locate_zeros_Calhoun(game_state);
end
function locations = P22_locate_zeros_Calhoun(nums)
    L = numel(nums);
    x = 1;
    y = 1;
    locations = [];
    while x <= L
        if nums(x) == 0
            locations(y) = x;
            y = y + 1;
        end
        x = x + 1;
    end
    locations ([x:end]) = [];
end
function winner = TTT41_winner_check_Calhoun(game_state)
    values = P32_matrix_sums_Calhoun(game_state);
    L = numel(values);
    winner = 0;
%     i = 1;
%     while winner == 0 && i < L
    for i = 1:L
        if values(i) == 3
            winner = 1;
            return
        elseif values(i) == -3
            winner = -1;
            return
        else
            winner = 0;
        end
%         i = i + 1;
    end
end
function values = P32_matrix_sums_Calhoun(A)
%     [m,n] = size(A);
    sum_m = 0;
    sum_n = 0;
    diag_sums = P31_diagonal_sums_Calhoun(A);
    sum_m = sum(A,2);
    sum_n = sum(A);
%     Diag_Sum = 0;
%     Anti_Diag_Sum = 0;
%     x = 1;
%     y = 1;
%     z = m;
%     for i = 1:m
%         sum_m(i) = sum(A(i,:));
%     end
%     for i = 1:n
%         sum_n(i) = sum(A(:,i));
%     end
%     if m >= n
%         b = n;
%     elseif n >= m
%         b = m;
%     end    
%     for i = 1:b
%         val1 = A(i,x);
%         Diag_Sum = Diag_Sum + val1;
%         x = x + 1;
%     end    
%     for j = 1:b
%         val2 = A(z,y);
%         Anti_Diag_Sum = Anti_Diag_Sum + val2;
%         z = z - 1;
%         y = y + 1;
%     end
    values = [sum_m; sum_n'; diag_sums];
end
function diag_sums = P31_diagonal_sums_Calhoun(A)
    [m,n] = size(A);
    Diag_Sum = 0;
    Anti_Diag_Sum = 0;
    x = 1;
    y = 1;
    z = m;
    
    if m >= n
        b = n;
    elseif n >= m
        b = m;
    end
    
    for i = 1:b
        val1 = A(i,x);
        Diag_Sum = Diag_Sum + val1;
        x = x + 1;
    end
    
    for j = 1:b
        val2 = A(z,y);
        Anti_Diag_Sum = Anti_Diag_Sum + val2;
        z = z - 1;
        y = y + 1;
    end  
    diag_sums = [Diag_Sum ; Anti_Diag_Sum];
end

%
% If you called any programs from a previous HW assignment in this function,
% copy and paste them here.  Otherwise, delete this comment.
%
% =========================================================================
% HR:
% =========================================================================