%==========================================================================
% Name: Justin Polito
% HR: ttt_move_v2
% Input: 
%   1. game_board: 3 x 3 matrix that represents the current state of a tic
%   tac toe game
%   2. player: -1 or 1 depending on what player is moving
% Output:
%   1. move: absolute index of the selected game_board space     
% =========================================================================
function move = P8_ttt_move_Polito(game_board, player)
locations = P2_find_zeros_Polito(game_board);
x = length(locations);
move = 0;
for i = 1:x
   new_game_board = game_board;
   new_game_board(locations(i)) = player;
   outcome = P1_ttt_winner_check_Polito(new_game_board);
  if outcome == player;
    move = locations(i);
    return
  end
end
for i = 1:x;
   if move ~=0;
    return
    end
   new_game_board = game_board;
   new_game_board(locations(i)) = player*-1;
   outcome = P1_ttt_winner_check_Polito(new_game_board);
  if outcome == player*-1;
    move = locations(i);
    return
  end
end
if move == 0;
   move = P2_ttt_move_v1_Polito(game_board);
end
end

%%helper Functions
function locations = P2_find_zeros_Polito(nums)
locations = [];
x = length(nums);
a = 1;
for i = 1:x^2;
    if nums(i) == 0;
        locations(a) = i;
        a = a+1; 
    end
end
end
function outcome = P1_ttt_winner_check_Polito(game_board)
sum_list = P3_matrix_path_sums_Polito(game_board);
x = length(sum_list);
for i = 1:x;
    if sum_list(i) == 3;
        outcome = 1;
        break
    elseif sum_list(i) == -3;
        outcome = -1;
        break
    else 
        outcome = 0;
    end
end
end