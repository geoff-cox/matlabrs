% =========================================================================
% Name: [Nicholas Hausler ]
% HR:   [online strategies to give me an idea ]
% Inputs: 
%   1. [game board]: [ (3 × 3 matrix that represents the current state of a tic tac toe game)]
%   2. [player]: [(-1 or 1 depending on which player is moving)
%   3. [Input 3 Name]: [Input 3 Description]
%                   ...
% Outputs:
%   1. [move]: [ (absolute index of the selected game board space)]
%                   ...
% =========================================================================

% =========================================================================
% Notes:  (REMOVE THESE NOTES BEFORE SUBMITTING!)
% * Use descriptive variable names. Otherwise, use comments to describe
%   your variables
% * Do not just write names of people or resources in your help received 
%   statement. You must state how these resources helped you. 
% =========================================================================


function move = P8_ttt_move_v8_Hausler(game_board,player)
open_spaces = P2_find_zeros_Hausler(game_board);
move = P1_ttt_winning_move_Hausler(game_board,player,open_spaces);
if move == 0
move = P1_ttt_winning_move_Hausler(game_board,player*-1,open_spaces);
end
if move== 0
move = P2_ttt_move_v1_Hausler(game_board);
end
end

function locations=P2_find_zeros_Hausler(nums)
nums=nums(:);
N=length(nums);
locations = [];
for k=1:N
    if nums(k)==0
         locations = [locations,k];
       
    end
end
end

function move = P1_ttt_winning_move_Hausler(game_board,player,open_spaces)

       N = length(open_spaces);
       move= 0;
       for k = 1:N 
      game_board1 = game_board;
       X= open_spaces(k);
      game_board1(X) = player;
       
       
       
    sum_of_row_1 =0;
    sum_of_row_2=0;
    sum_of_row_3=0;
    sum_of_column_1=0;
    sum_of_column_2=0;
    sum_of_column_3=0;
    sum_of_the_diagonal=0;
    sum_of_the_off_diagonal=0;
    sum_list = 0;
    [~,n]= size(game_board1);
    
    for i = 1:3
        sum_of_row_1 = sum_of_row_1+game_board1(1,i);
        sum_of_row_2 = sum_of_row_2+game_board1(2,i);
        sum_of_row_3 = sum_of_row_3+game_board1(3,i);
        sum_of_column_1 = sum_of_column_1+ game_board1(i,1);
        sum_of_column_2 = sum_of_column_2 +game_board1(i,2);
        sum_of_column_3 = sum_of_column_3 + game_board1(i,3);
        sum_of_the_diagonal = sum_of_the_diagonal + game_board1(i,i);
        sum_of_the_off_diagonal = sum_of_the_off_diagonal + game_board1((n-i+1),i);
        sum_list= [sum_of_row_1;sum_of_row_2;sum_of_row_3;sum_of_column_1;sum_of_column_2;sum_of_column_3;sum_of_the_diagonal;sum_of_the_off_diagonal];
     
    end
outcome = 0 ;

for k = 1:8
if sum_list(k) == 3
    outcome = 1;
elseif sum_list(k) == -3 
    outcome = -1;
end    
end
if outcome == player
    move=X;
    return
end
       end
end
