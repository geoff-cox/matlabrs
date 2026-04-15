% =========================================================================
% Name: Nic Shier
% HR:   None; NAS
% HW 06 Problem 8
% Inputs: 
%   1. game board (3 × 3 matrix that represents the current state of a
%   tic tac toe game)
%   2. player (-1 or 1 depending on which player is moving)
% Outputs:
%   1. move (absolute index of the selected game board space)
% =========================================================================

function move = P8_ttt_move_Shier(game_board,player)
gb = game_board(:);
z = P2_find_zeros_Shier(gb);
c_gb = game_board;
r = length(z);
move = 0;
a = [1,3,7,9];

for k = 1:r
    c_gb(z(k)) = player;
    if P1_ttt_winner_check_Shier(c_gb) == player
        move = z(k);
        return
    else
        c_gb(z(k)) = 0;
    end
end

if move == 0
    for k = 1:r
        if move == 0
            c_gb(z(k)) = -1*player;
            if P1_ttt_winner_check_Shier(c_gb) == -1*player
                move = z(k);
                return
            else
                c_gb(z(k)) = 0;
            end
        else
            return
        end
    end
end

if move == 0
    for k = 1:4
        if c_gb(a(k)) == 0
            if c_gb(1) == c_gb(a(k)) && c_gb(2) == 0 && c_gb(4) == 0
                move = a(k);
                return
            elseif c_gb(3) == c_gb(a(k)) && c_gb(2) == 0 && c_gb(6) == 0
                move = a(k);
                return
            elseif c_gb(7) == c_gb(a(k)) && c_gb(4) == 0 && c_gb(8) == 0
                move = a(k);
                return
            elseif c_gb(9) == c_gb(a(k)) && c_gb(6) == 0 && c_gb(8) == 0
                move = a(k);
                return
            else
                move = 0;
            end
        end
    end
end

if move == 0
    for k = 1:4
        if c_gb(1) == player
            if c_gb(2) ~= -1*player && c_gb(3) == 0
                move = 3;
                return
            elseif c_gb(4) ~= -1*player && c_gb(7) == 0
                move = 7;
                return
            end
        elseif c_gb(9) == player
            if c_gb(2) ~= -1*player && c_gb(3) == 0
                move = 3;
                return
            elseif c_gb(4) ~= -1*player && c_gb(7) == 0
                move = 7;
                return
            end
        elseif c_gb(3) == player
            if c_gb(2) ~= -1*player && c_gb(1) == 0
                move = 2;
                return
            elseif c_gb(6) ~= -1*player && c_gb(9) == 0
                move = 6;
                return
            end
        elseif c_gb(7) == player
            if c_gb(2) ~= -1*player && c_gb(1) == 0
                move = 2;
                return
            elseif c_gb(6) ~= -1*player && c_gb(9) == 0
                move = 6;
                return
            end
        end
    end
end

if move == 0
    move = P2_ttt_move_v1_Shier(game_board);
end

end

% =========================================================================
% Helper Function: ttt move v1
% =========================================================================
% Inputs: 
%   1. game_board (3 × 3 matrix that represents the current state of a 
%   tic tac toe game)
% Outputs:
%   1. move_space (absolute index of the selected game_board space)
% =========================================================================
function move_space = P2_ttt_move_v1_Shier(game_board)
nums = game_board(:); % make game_board a vector
locations = P2_find_zeros_Shier(nums); % find the zeros
n = length(locations); % length of the amount of zeros
tested_value = randi(n);
move_space = locations(tested_value);

end


% =========================================================================
% Helper Function: ttt winner check
% =========================================================================
% Inputs: 
%   1. game_board (3 × 3 matrix that represents the current state of a 
%   tic tac toe game)
% Outputs:
%   1. outcome (1 if player X won, ?1 if player O won, 0 otherwise)
% =========================================================================
function outcome = P1_ttt_winner_check_Shier(game_board)
sum_list = P3_matrix_path_sums_Shier(game_board);
outcome = 0;
n = length(sum_list);

for k = 1:n
    if sum_list(k) == 3
        outcome = 1;
        return
    elseif sum_list(k) == -3
        outcome = -1;
        return
    else
    end

end
end


% =========================================================================
% Helper Function: find zeros
% =========================================================================
% Inputs: 
%   1. nums: row of numbers to search
% Outputs:
%   1. locations: row vector of inices where there are zero in nums
% =========================================================================
function locations = P2_find_zeros_Shier(nums)
q = length(nums);
locations = [];
r = 1;
loc_of_nums = (1:q);

for k = 1:q
    if nums(k) == 0
        locations(r) = loc_of_nums(k);
        r = r + 1;
    end
end

end


% =========================================================================
% Helper Function: matrix path sums
% =========================================================================
% Inputs: 
%   1. A: (3 × 3 matrix)
% Outputs:
%   1. sum_list: (column vector of values specified above)
% =========================================================================
function sum_list = P3_matrix_path_sums_Shier(A)
sum_list = zeros(8,1);
[r,c] = size(A);

for k = 1:r
    sum_list(1) = sum_list(1) + A(1,k);
    sum_list(2) = sum_list(2) + A(2,k);
    sum_list(3) = sum_list(3) + A(3,k);
    sum_list(4) = sum_list(4) + A(k,1);
    sum_list(5) = sum_list(5) + A(k,2);
    sum_list(6) = sum_list(6) + A(k,3);
end

[sum_list(7), sum_list(8)] = P2_cross_diagonal_sums_Shier(A);


end


% =========================================================================
% Helper Function: cross diagonal sums
% =========================================================================
% Inputs: 
%   1. A: (n × n square matrix)
% Outputs:
%   1. down_diagonal_sum: (sum of the diagonal entries between A(1,1) and A(n,n))
%   2. up_diagonal_sum: (sum of the diagonal entries between A(n,1) and A(1,n))
% =========================================================================
function [down_diagonal_sum,up_diagonal_sum] = P2_cross_diagonal_sums_Shier(A)
[r,c] = size(A);
down_diagonal_sum = 0;
up_diagonal_sum = 0;
a = c;

for k = 1:r
    down_diagonal_sum = down_diagonal_sum + A(k,k);
    up_diagonal_sum = up_diagonal_sum + A(a,k);
    a = a - 1;
end

end