% =========================================================================
% Name: Chengbo Yao
% HR:   None
% Inputs: 
%   1. [Input 1 Name]: [Input 1 Description]
%   2. [Input 2 Name]: [Input 2 Description]
%   3. [Input 3 Name]: [Input 3 Description]
%                   ...
% Outputs:
%   1. [Output 1 Name]: [Output 1 Description]
%   2. [Output 2 Name]: [Output 2 Description]
%                   ...
% =========================================================================

% =========================================================================
% Notes:  (REMOVE THESE NOTES BEFORE SUBMITTING!)
% * Use descriptive variable names. Otherwise, use comments to describe
%   your variables
% * Do not just write names of people or resources in your help received 
%   statement. You must state how these resources helped you. 
% =========================================================================
function move = P8_ttt_move_Yao(game_board,player)
if game_board==[0 0 0;0 0 0;0 0 0]
move=5;
end
A=game_board(:);
open_spaces = P2_find_zeros_Yao(A);
move=P1_ttt_winning_move_Yao(game_board,player,open_spaces);
check=isempty(move);
if check==1
    player = -1*player;
    move=P1_ttt_winning_move_Yao(game_board,player,open_spaces);
    check2=isempty(move);
    if check2==1
       move=P1_ttt_winning_move_v2_Yao;
       check3=isempty(move);
       if check3==1
           move=P2_ttt_move_v1_Yao(game_board);
       end
    end
end


end


function outcome = P1_ttt_winner_check_Yao(game_board)
sum_list = P3_matrix_path_sums_Yao(game_board);
[a,b]=size(sum_list);
for n=1:a
    if sum_list(n,b) == 3
        outcome=1;
        break
    elseif sum_list(n,b) == -3
        outcome=-1;
        break
    else
        outcome=0;
    end
end
end

function locations = P2_find_zeros_Yao(nums)
n=length(nums);
x=0;
for k=1:n
if nums(k) == 0
x=x+1;
locations(x)=k;
end
end
end

function move=P1_ttt_winning_move_Yao(game_board,player,open_spaces)
n=length(open_spaces);
move=[];
for k=1:n
    board=game_board;
    a=open_spaces(k);
    board(a)=player;
    outcome = P1_ttt_winner_check_Yao(board);
    if outcome == player
        move=a;
        break
    end
end
end

function outcome = P1_ttt_winner_check_v2_Yao(game_board)
sum_list = P3_matrix_path_sums_Yao(game_board);
[a,b]=size(sum_list);
for n=1:a
    if sum_list(n,b) == 2
        outcome=1;
        break
    elseif sum_list(n,b) == -2
        outcome=-1;
        break
    else
        outcome=0;
    end
end
end

function move=P1_ttt_winning_move_v2_Yao(game_board,player,open_spaces)
n=length(open_spaces);
move=[];
for k=1:n
    board=game_board;
    a=open_spaces(k);
    board(a)=player;
    outcome = P1_ttt_winner_check_v2_Yao(board);
    if outcome == player
        move=a;
        break
    end
end
end

function move_space=P2_ttt_move_v1_Yao(game_board)
A=game_board(:);
locations = P2_find_zeros_Yao(A);
a=length(locations);
b=randi(a);     
move_space=locations(b);
    


end
