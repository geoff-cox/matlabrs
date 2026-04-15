% =========================================================================
% Name:  Jerry Haste
% HR:   HR- Looked up tic-tac-toe strategy online.
% Inputs: 
%   1. game_board: Any ttt game board.
%   2. player: Either 1 or -1. 1 moves first.
%                   ...
% Outputs:
%   1. move: Picks a move using advanced ttt strategy that beats move_v2
%   and move_v1
%                   ...
% =========================================================================
function move = P8_ttt_move_Haste(game_board,player)
%initialize move as -1
move=-1;
open_spaces = P2_find_zeros_Haste(game_board);
R=length(open_spaces);

%Check if winning move
move = P1_ttt_winning_move_Haste(game_board,player,open_spaces);

%Check if blocking move
op_player=player*-1;
if move == -1
    move = P1_ttt_winning_move_Haste(game_board,op_player,open_spaces);
end

%Protocol to cause win
if R==9
    move=5;
end

%Blocks win in case that opposing player goes to corners
if game_board(5)==player
    if game_board(1) == op_player
        if move == -1
            move = move_if_open(open_spaces,9);
        end
    end
    if game_board(3) == op_player
        if move == -1
            move = move_if_open(open_spaces,7);
        end
    end
    if game_board(9) == op_player
        if move == -1
            move = move_if_open(open_spaces,1);
        end
    end
    if game_board(7) == op_player
        if move == -1
            move = move_if_open(open_spaces,3);
        end
    end
end


if game_board(5)==player || game_board(7)==player || game_board(3)==op_player
    if game_board(4)==op_player
        if move == -1
            move = move_if_open(open_spaces,9);
        end
    end
    if game_board(8)==op_player
        if move == -1
            move = move_if_open(open_spaces,1);
        end
    end
end

if game_board(5)==player || game_board(1)==player || game_board(9)==op_player
    if game_board(2)==op_player
        if move == -1
            move = move_if_open(open_spaces,7);
        end
    end
    if game_board(4)==op_player
        if move == -1
            move = move_if_open(open_spaces,3);
        end
    end
end

if game_board(5)==player || game_board(3)==player || game_board(7)==op_player
    if game_board(2)==op_player
        if move == -1
            move = move_if_open(open_spaces,9);
        end
    end
    if game_board(6)==op_player
        if move == -1
            move = move_if_open(open_spaces,1);
        end
    end
end

if game_board(5)==player || game_board(9)==player || game_board(1)==op_player
    if game_board(6)==op_player
        if move == -1
            move = move_if_open(open_spaces,7);
        end
    end
    if game_board(8)==op_player
        if move == -1
            move = move_if_open(open_spaces,3);
        end
    end
end




%Protocol to cause draw-
if game_board(1) == op_player || game_board(3) == op_player || game_board(7) == op_player || game_board(9) == op_player   
    if move == -1
        move = move_if_open(open_spaces,5);
    end
end

if game_board(5) == op_player    
    if move == -1
        move = move_if_open(open_spaces,1);
    end
    if move == -1
        move = move_if_open(open_spaces,3);
    end
    if move == -1
        move = move_if_open(open_spaces,7);
    end
    if move == -1
        move = move_if_open(open_spaces,9);
    end
end


%If else, use random value
if move == -1
    move = P2_ttt_move_v1_Haste(game_board);
end
end

function move = move_if_open(open_spaces,space)
check = open_checker(open_spaces,space);
if check == 1
    move=space;
else
    move=-1;
end
end

function check = open_checker(open_spaces,space)
B=length(open_spaces);
    for p=1:B 
        if open_spaces(p)==space
            check=1;
            break
        else
            check=0;
        end
    end
end

function locations=P2_find_zeros_Haste(nums)
nums=nums(:);
N=length(nums);
j=1;
for i=1:N
    if nums(i)==0
        locations(j)=i;
        j=j+1;
    end
end
end

function move_space=P2_ttt_move_v1_Haste(game_board)
game_board=game_board(:);
N=length(game_board);
j=1;
for i=1:N
    if game_board(i)==0
        locations(j)=i;
        j=j+1;
    end
end
M=length(locations);
move_space=0;
while move_space < 1
    random=randi(9);
    for i=1:M
        if locations(i)==random
            move_space=random;
        end
    end
end
end

function move = P1_ttt_winning_move_Haste(game_board,player,open_spaces)
N=length(open_spaces);
move=-1;
for i=1:N
new_game_board=game_board;
X=open_spaces(i);
new_game_board(X)=player;
sum_row_1=0;
sum_row_2=0;
sum_row_3=0;
sum_column_1=0;
sum_column_2=0;
sum_column_3=0;
down_diagonal_sum=0;
up_diagonal_sum=0;
for i=1:3
    B(i)=new_game_board(i,i);
    C(i)=new_game_board(i,4-i);
end
for i=1:3
    sum_row_1=sum_row_1+new_game_board(1,i);
    sum_row_2=sum_row_2+new_game_board(2,i);
    sum_row_3=sum_row_3+new_game_board(3,i);
    sum_column_1=sum_column_1+new_game_board(i,1);
    sum_column_2=sum_column_2+new_game_board(i,2);
    sum_column_3=sum_column_3+new_game_board(i,3);
    down_diagonal_sum=down_diagonal_sum+B(i);
    up_diagonal_sum=up_diagonal_sum+C(i);
end
sum_list=[sum_row_1;sum_row_2;sum_row_3;sum_column_1;sum_column_2;sum_column_3; down_diagonal_sum;up_diagonal_sum];
outcome=0;
for i=1:8
    if sum_list(i) == 3
        outcome=1;
    elseif sum_list(i) == -3
        outcome=-1;
    end
end
if outcome==player
    move=X;
    return
end
end
end