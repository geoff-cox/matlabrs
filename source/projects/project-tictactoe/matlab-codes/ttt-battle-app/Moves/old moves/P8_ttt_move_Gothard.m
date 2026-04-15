% =========================================================================
% Programming Problem
% HW:  6
% Name: Emily Gothard
% HR:   none
% =========================================================================
function move = P8_ttt_move_Gothard(game_board, player)

game_board_vectorized=game_board(:);

locations = P2_find_zeros_Gothard(game_board_vectorized);
N=length(locations);
game_board1=game_board;
move=0;

for k=1:N
    game_board1(locations(k))=player;
    outcome = P1_ttt_winner_check_Gothard(game_board1);
    if outcome == player
        move=locations(k);
        return
    end
    game_board1=game_board;
end

if move==0
    for k=1:N
        game_board1(locations(k))=player*-1;
    outcome = P1_ttt_winner_check_Gothard(game_board1);
    if outcome == player*-1
        move=locations(k);
        return
    end
    game_board1=game_board;
    end
end
check=(player*-1);
if move==0
    if game_board(5)==0 && game_board(1)==check
        move=5;
    elseif game_board(5)==0 && game_board(3)==check
        move=5;
    elseif game_board(5)==0 && game_board(7)==check
        move=5;
    elseif game_board(5)==0 && game_board(9)==check
        move=5;
    elseif game_board(7)==check && game_board(8)==0
        move=8;
    elseif game_board(5)==check && game_board(1)==0
        move=1;
    elseif game_board(2)==player && game_board(5)==0
        move=5;
    elseif game_board(4)==player && game_board(5)==0
        move=5;
    elseif game_board(6)==player && game_board(5)==0
        move=5;
    elseif game_board(8)==player && game_board(5)==0
        move=5;
    elseif game_board(5)==player && game_board(2)==0
        move=2;
    elseif game_board(5)==player && game_board(4)==0 && game_board(2)==check
        move=4;
    elseif game_board(5)==player && game_board(6)==0 && game_board(2)==check  && game_board(4)==check
        move=6;
    elseif game_board(5)==player && game_board(8)==0 && game_board(6)==check && game_board(2)==check  && game_board(4)==check
        move=8;
    elseif game_board(1)==0
        move=1;
    elseif game_board(3)==0
        move=3;
    elseif game_board(7)==0
        move=7;
    elseif game_board(9)==0 && game_board(1)==check
        move=9;
    elseif game_board(9)==0 && game_board(3)==check
        move=9;
    elseif game_board(9)==0 && game_board(7)==check
        move=9;
    elseif game_board(1)~=0 && game_board(3)~=0 && game_board(7)~=0 && game_board(9)~=0 && game_board(5)==0
        move=5;
    else
        move = P2_ttt_move_v1_Gothard(game_board);
        
    end
end

end
%==========================================================================

function locations = P2_find_zeros_Gothard(nums)

N=length(nums);
locations=[];
l=0;

for k=1:N
    if nums(k)==0
      l=l+1;
      locations(l)=k;
    end

end

end

function move_space = P2_ttt_move_v1_Gothard(game_board)
game_board_vectorized=game_board(:);

locations = P2_find_zeros_Gothard(game_board_vectorized);

N=length(locations);
M=randi(N);

move_space=locations(M);

end

function outcome = P1_ttt_winner_check_Gothard(game_board)

sum_list = P3_matrix_path_sums_Gothard(game_board);
outcome=0;

N=length(sum_list);

for k=1:N
    if sum_list(k)==-3
        outcome=-1;
    elseif sum_list(k)==3
        outcome=1;
    end
end

end

function sum_list = P3_matrix_path_sums_Gothard(A)

N=length(A);
sum_row1=0;
sum_row2=0;
sum_row3=0;
sum_column1=0;
sum_column2=0;
sum_column3=0;
sum_of_diagonal=0;
sum_of_off_diagonal=0;

for k=1:N
    sum_row1=sum_row1+A(1,k);
    sum_row2=sum_row2+A(2,k);
    sum_row3=sum_row3+A(3,k);
    sum_column1=sum_column1+A(k,1);
    sum_column2=sum_column2+A(k,2);
    sum_column3=sum_column3+A(k,3);
    sum_of_diagonal=sum_of_diagonal+A(k,k);
end
column=1;
for h=N:-1:1
    sum_of_off_diagonal=sum_of_off_diagonal+A(h,column);
    column=column+1;
end

sum_list=[sum_row1; sum_row2; sum_row3; sum_column1; sum_column2; sum_column3; sum_of_diagonal; sum_of_off_diagonal];
    
end

