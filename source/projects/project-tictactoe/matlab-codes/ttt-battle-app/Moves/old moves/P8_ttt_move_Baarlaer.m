% =========================================================================
% Name: Logan Baarlaer
% HR:   [Help Received Statement]
% Inputs: 
%   1. game board (3 × 3 matrix that represents the current state of a tic
%   tac toe game)
%   2. player (-1 or 1 depending on which player is moving)
% Outputs:
%   1. move (absolute index of the selected game board space)
% =========================================================================

function move = P8_ttt_move_Baarlaer(game_board,player)

move_space_random = P2_ttt_move_v1_Baarlaer(game_board);
game_board_v = game_board(:);
empty_spaces = P2_find_zeros_Baarlaer(game_board_v);
outcome=0;
game_board_copy=game_board;
move=[];
for i=empty_spaces
    game_board_copy=game_board;
    game_board_copy(i)=player; 
    outcome = P1_ttt_winner_check_Baarlaer(game_board_copy);
    if outcome == player
        move = i;
        return
    end
    game_board_copy=game_board;
    game_board_copy(i)=player*-1; 
    outcome = P1_ttt_winner_check_Baarlaer(game_board_copy);
    if outcome == player*-1
        move = i;
        return
    end
    if game_board_copy(9)==0
        move = 9;
    elseif game_board_copy(3)==0
        move = 3;
    elseif game_board_copy(1)==0
        move = 1;
    elseif game_board_copy(7)==0
        move = 7;
    else
        move = move_space_random;
    end
end
end
function move_space = P2_ttt_move_v1_Baarlaer(game_board)
game_board_v = game_board(:);
empty_spaces = P2_find_zeros_Baarlaer(game_board_v);

empty_spaces_length = length(empty_spaces);
rand = randi(empty_spaces_length);

move_space = empty_spaces(rand);

end
function locations = P2_find_zeros_Baarlaer(nums)

locations = [];
N = length(nums);
count = 0;

for k = 1:N;
    if nums(k) == 0;
        count = count + 1;
        locations(count) = [k];
    else
        count = count;
    end
end
end
function outcome = P1_ttt_winner_check_Baarlaer(game_board)

sum_list = P3_matrix_path_sums_Baarlaer(game_board);

N_sum_list = length(sum_list);
outcome = 0;

for z = 1:N_sum_list
    if sum_list(z) == 3;
        outcome = 1;
        return
    elseif sum_list(z) == -3;
        outcome = -1;
        return
    else
        outcome = 0;
    end
end
end
   





