% =========================================================================
% Name: Kelia Aardema
% HR:   See helper functions below. The new strategy is that if my opponent
%       has a winning move, I will be able to block it.
% Inputs: 
%   1. game_board (3 × 3 matrix that represents the current state of a tic tac toe game)
%   2. player (-1 or 1 depending on which player is moving)
% Outputs:
%   1. move (absolute index of the selected game board space)
% =========================================================================

function move = P8_ttt_move_Aardema(game_board,player)
move = 0;
board_vector = game_board(:);
locations = P2_find_zeros_Aardema(board_vector);
N = length(locations);
game_board_copy = game_board;

if P1_ttt_winning_move_Aardema(game_board_copy,player,locations) ~= 0
   move = P1_ttt_winning_move_Aardema(game_board_copy,player,locations);
elseif P1_ttt_winning_move_Aardema(game_board_copy,-player,locations) ~= 0
    move = P1_ttt_winning_move_Aardema(game_board_copy,player,locations);
    
   return
end

player = player*-1;
if P1_ttt_winning_move_Aardema(game_board_copy,player,locations) ~= 0
   move = P1_ttt_winning_move_Aardema(game_board_copy,player,locations);
elseif P1_ttt_winning_move_Aardema(game_board_copy,-player,locations) ~= 0
    move = P1_ttt_winning_move_Aardema(game_board_copy,player,locations);
   return
end

player = player*-1;
move = P2_ttt_move_v1_Aardema(game_board);

end

function move_space = P2_ttt_move_v1_Aardema(game_board)

move_space = 0;
nums = game_board(:);
empty_space_locations = P2_find_zeros_Aardema(nums);
N = length(empty_space_locations);
index = randi(N);
move_space = empty_space_locations(index);

end

function locations = P2_find_zeros_Aardema(nums)

N = length(nums);
locations = [];

for k = 1:N
    if nums(k) == 0
        locations = [locations, k];
    end
end

end

function move = P1_ttt_winning_move_Aardema(game_board,player,open_spaces)
move = 0;
outcome = P1_ttt_winner_check_Aardema(game_board);
game_board_temp = game_board;
k = 1;
N = length(open_spaces);
while outcome == 0 && k <= N
    game_board_temp(open_spaces(k)) = player;
    if P1_ttt_winner_check_Aardema(game_board_temp) == player
        game_board = game_board_temp;
        move = open_spaces(k);
    else 
        game_board_temp = game_board;
    end
    k = k+1;
    outcome = P1_ttt_winner_check_Aardema(game_board);
end

end

function outcome = P1_ttt_winner_check_Aardema(game_board)

sum_list = P3_matrix_path_sums_Aardema(game_board);
k = 1; %initialized a counter for the while loop
outcome = 0;

while abs(outcome) ~= 1 && k < 9
    if sum_list(k) == 3
        outcome = 1;
    elseif sum_list(k) == -3
        outcome = -1;
    end
    k = k + 1;
end

end

function sum_list = P3_matrix_path_sums_Aardema(A)

sum_list = zeros(8,1);

[down_diagonal_sum,up_diagonal_sum] = P2_cross_diagonal_sums_Aardema(A);

for r = 1:3
    sum_list(4) = sum_list(4) + A(r,1);
    sum_list(5) = sum_list(5) + A(r,2);
    sum_list(6) = sum_list(6) + A(r,3); 
end

for c = 1:3
sum_list(1) = sum_list(1) + A(1,c);
sum_list(2) = sum_list(2) + A(2,c);
sum_list(3) = sum_list(3) + A(3,c);
end
    
sum_list(7) = down_diagonal_sum;
sum_list(8) = up_diagonal_sum;

end

function [down_diagonal_sum,up_diagonal_sum] = P2_cross_diagonal_sums_Aardema(A)

down_diagonal_sum = 0;
up_diagonal_sum = 0;
[row,col] = size(A);
down_diagonal_vector = [];
up_diagonal_vector = [];


for r = 1:row
    for c = 1:col
        if r == c
        down_diagonal_vector = [down_diagonal_vector,A(r,c)];
        end
        
        if c == col-(r-1)
        up_diagonal_vector = [up_diagonal_vector,A(r,c)];    
        end
    end
end

N = length(down_diagonal_vector);
for k = 1:N
    down_diagonal_sum = down_diagonal_sum + down_diagonal_vector(k);
end

M = length(up_diagonal_vector);
for k = 1:M
    up_diagonal_sum = up_diagonal_sum + up_diagonal_vector(k);
end

end

