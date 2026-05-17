% =========================================================================
% Name: Joshua Krogman 
% HR:   Edited my ttt_move_v2 code for this to win. 
% Inputs: 
%   1. game board (3 × 3 matrix that represents the current state of a tic tac toe game)
%   2. player (-1 or 1 depending on which player is moving)
%                   ...
% Outputs:
%   1. digits list (a row vector containing the digits of num.)
%                   ...
% =========================================================================

function move = P8_ttt_move_Krogman(game_board, player)
open_spaces = P2_find_zeros_Krogman(game_board);
space = P1_ttt_winning_move_Krogman(game_board, player, open_spaces);
if space ~= 0 
    move = space; 
elseif space == 0 
    space = P1_ttt_winning_move_Krogman(game_board, -1, open_spaces);%hard coded in the player number -1
    if space ~= 0
       move = space; 
    else 
        move = P2_ttt_move_v1_Krogman(game_board);
    end
elseif space == 0
    space = P1_ttt_winning_move_Krogman(game_board, 1, open_spaces);%hard coded in the player number for 1
    if space ~= 0
       move = space; 
    else 
        move = P2_ttt_move_v1_Krogman(game_board);
    end 
end
end 

function move = P1_ttt_winning_move_Krogman(game_board, player, open_spaces) 
x = length(open_spaces);
move = P2_ttt_move_v1_Krogman(game_board);
new_game_board = game_board; 
for i = 1:x 
    game_board = new_game_board; 
    if player == 1
       game_board(open_spaces(i)) = 1; 
        d = P1_ttt_winner_check_Krogman(game_board);
        if d==1
        move = open_spaces(i);
        return
        end
    elseif player == -1
        game_board(open_spaces(i)) = -1; 
         f = P1_ttt_winner_check_Krogman(game_board);
         if f==-1
         move = open_spaces(i) ;
         return
         end
    end 
end
end 
function outcome = P1_ttt_winner_check_Krogman(game_board) 

z = P3_matrix_path_sums_Krogman(game_board);
y = z';
for k = 1:8
    if y(k) == 3
        outcome = 1;
        return
    elseif y(k) == -3 
        outcome = -1;
        return
    else
        outcome = 0;
    end 

end
end 
function sum_list = P3_matrix_path_sums_Krogman(A)
sum_row_1 = 0; 
sum_row_2 = 0;
sum_row_3 = 0;
sum_col_1 = 0;
sum_col_2 = 0;
sum_col_3 = 0; 
down_diagonal_sum = 0;
up_diagonal_sum = 0;

for i = 1:3
    down_diagonal_sum = down_diagonal_sum+A(i,i);
    up_diagonal_sum = up_diagonal_sum + A(4-i,i);
    for k = 1:3
        if i==1
            sum_row_1 = sum_row_1 + A(i,k);
            sum_col_1 = sum_col_1 +A(k,i);
        end 
        if i==2 
            sum_row_2 = sum_row_2 + A(i,k);
            sum_col_2 = sum_col_2 +A(k,i);
        end
         if i==3
            sum_row_3 = sum_row_3 + A(i,k);
            sum_col_3 = sum_col_3 +A(k,i);
        end 
    end 
sum_list = [sum_row_1;sum_row_2;sum_row_3;sum_col_1;sum_col_2;sum_col_3;down_diagonal_sum;up_diagonal_sum];
end
end 
function locations = P2_find_zeros_Krogman(nums)
[a,b]=size(nums);
k=a*b;
locations = [];
count = 0;
count1 = 0; 

for i = 1:k
 if nums(i) == 0 
     count = count+1;
     locations(1,count) = (i);
 elseif nums(i)<0 && nums(i)>0
     count1 = count1+1;
     locations(1,count1) = [];
 end 
     
end
end 
function move_space = P2_ttt_move_v1_Krogman(game_board)
space = []; 
for i = 1:9
    zeros = P2_find_zeros_Krogman(game_board(:));
    space = [space, zeros];
end
move_space = space(randi([1,length(space)]));
    


end
    


