% =========================================================================
% Programming Problem
% HW:   6
% Name: Andrew Ho
% HR:   None
% =========================================================================

function [move] = P8_ttt_move_Ho(game_board,player)

game_board2=game_board;
game_board3=game_board(:);
[locations] = P2_find_zeros_Ho(game_board3);

locations_length=length(locations);

if locations==1 
    game_board2(locations)= player;
    [outcome] = P1_ttt_winner_check_Ho(game_board2);
    if outcome==1
        move=locations;
        return
    elseif outcome==-1
        move=locations;
        return
    end
    
else
    for q=1:locations_length %%winning move
        game_board2(locations(q))= player;
        [outcome] = P1_ttt_winner_check_Ho(game_board2);
        if outcome==1
            move=locations(q);
            return
        elseif outcome==-1
            move=locations(q);
            return
        end
        game_board2=game_board;
    end
end
if locations==1
    game_board2(locations)= player*-1;
    [outcome] = P1_ttt_winner_check_Ho(game_board2);
    if outcome==1
        move=locations;
        return
    elseif outcome==-1
        move=locations;
        return
    end
else
    for w=1:locations_length %%blocking move
        game_board2(locations(q))=player*-1;
        [outcome] = P1_ttt_winner_check_Ho(game_board2);
        if outcome==1
            move=locations(q);
            return
        elseif outcome==-1
            move=locations(q);
            return
        end
        game_board2=game_board;    
    end
end
for v=1:locations_length %%when player x or o can have 2 next to each other
    game_board2(locations(v))=player;
    sum_list=P3_matrix_path_sums_Ho(game_board2);
    sum_list_length=length(sum_list);
    for t=1:sum_list_length
        if sum_list(t)==2
            move=locations(v);
            return
        elseif sum_list(t)==-2
            move=locations(v);
            return
        end
    end
end
[move] = P2_ttt_move_v1_Ho(game_board2);
end




function [move_space] = P2_ttt_move_v1_Ho(game_board)
a=game_board(:);
nums=a;
[locations] = P2_find_zeros_Ho(nums);
n=length(locations);
move_space=0;

if n==1
    move_space=locations;
end

if n>1
   x=randi(n);
   move_space=locations(x);
end
end

function [locations] = P2_find_zeros_Ho(nums)
locations=[];
n=length(nums);
x=0;

for k=1:n
    if nums(k)==0
        x=x+1;
        locations(1,x)=k;
    
    end
end
end

function [outcome] = P1_ttt_winner_check_Ho(game_board)

[sum_list] = P3_matrix_path_sums_Ho(game_board);
[r]=length(sum_list);

for x=1:r
    if sum_list(x)==-3
            outcome=-1;
            return
    elseif sum_list(x)==3
            outcome=1;
            return
    else 
            outcome=0;
    end
end
end

function [sum_list] = P3_matrix_path_sums_Ho(A)

[r,c]=size(A);
sum_of_row1=0;
sum_of_row2=0;
sum_of_row3=0;
sum_of_col1=0;
sum_of_col2=0;
sum_of_col3=0;
down_diagonal_sum=0;
up_diagonal_sum=0;

for a=1:r
    for b=1:c
        if a==1
           sum_of_row1=sum_of_row1+A(1,b);
        elseif a==2
           sum_of_row2=sum_of_row2+A(2,b);
        elseif a==3
           sum_of_row3=sum_of_row3+A(3,b);
        end
    end
end

for c=1:c
    for d=1:r
        if d==1
           sum_of_col1=sum_of_col1+A(c,1);
        elseif d==2
           sum_of_col2=sum_of_col2+A(c,2);
        elseif d==3
            sum_of_col3=sum_of_col3+A(c,3);
        end
    end
end

for e=1:r
    for f=1:c
        if e==f
            down_diagonal_sum=down_diagonal_sum+A(e,f);
        
        end
    end
end


for x=1:r
    if x==1
    up_diagonal_sum=up_diagonal_sum+A(x,c);
    else
       up_diagonal_sum=up_diagonal_sum+A(x,c-(x-1)); 
    end
end

sum_list=[sum_of_row1; sum_of_row2; sum_of_row3; sum_of_col1; sum_of_col2; sum_of_col3; down_diagonal_sum; up_diagonal_sum];

end
