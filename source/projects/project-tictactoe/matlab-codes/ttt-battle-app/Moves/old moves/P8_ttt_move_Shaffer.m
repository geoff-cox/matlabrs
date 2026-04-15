% =========================================================================
% Name: Zachary A. Shaffer
% HR: NONE
% Inputs: 
%   1. game_board: matrix of values resembling the game board
%   2. player: the player who is moving. 
%   
%                   ...
% Outputs:
%   1. move= the space in the game_board where the player should move 
%                   ...
% =========================================================================
function move = P8_ttt_move_v3_shaffer(game_board,player)
game_board;
z=game_board(:)';
y=P2_find_zeros_shaffer(z); 
n=length(y);
for i=1:n
    check_game_board=game_board;
    if player==1
        check_game_board(y(i))=1;
        a=P1_ttt_winner_check_shaffer(check_game_board);
        if a==1
             move1=y(i);
            for k=1:n
        check_game_board(y(k))=-1;
    a=P1_ttt_winner_check_shaffer(check_game_board);
        if a==-1
            move2=y(k);
       
   
            if move1==move2
                move=move1;
       return 
            end
        end
        
            
        end
        end
    end
  
  if player==-1
        check_game_board(y(i))=-1;
    a=P1_ttt_winner_check_shaffer(check_game_board);
        if a==-1
            move1=y(i);
         for k=1:n
            check_game_board(y(k))=1;
    a=P1_ttt_winner_check_shaffer(check_game_board);
        if a==1
            move2=y(k);
       
        if move1==move2
            move=move1;
            return 
        end
        end
         end
        end
  end
   if i==n
      move=y(randi(n));
        end
end

end
function locations=P2_find_zeros_shaffer(nums)
n=length(nums);
i=1;
j=0;
locations=[];
for i= 1:n
    if nums(i)==0
        j=j+1;
        locations(j)= i;
    end
end

end
function outcome= P1_ttt_winner_check_shaffer(game_board)
a=P3_matrix_path_sums_shaffer(game_board);
n=length(a);
for i=1:n
    if a(i)== -3
        outcome= -1;
        break
    else if a(i)== 3
        outcome =1;
        break
        else if a(i)>-2 && a(i)<2
        outcome= 0;
    
    end 
    end 
    end
    
end
end
function sum_list=P3_matrix_path_sums_shaffer(A)
n=size(A);
sum_list=[];
sr1=0;
sr2=0;
sr3=0;
sc1=0;
sc2=0;
sc3=0;
down_diagonal_sum=0;
up_diagonal_sum=0;
for i=1:n(1)
    down_diagonal_sum=down_diagonal_sum+ A(i,i);
    up_diagonal_sum=up_diagonal_sum+ A(n(1)+1-i,i);
    sr1=sr1+A(1,i);
    sr2=sr2+A(2,i);
    sr3=sr3+A(3,i);
    sc1=sc1+A(i,1);
    sc2=sc2+A(i,2);
    sc3=sc3+A(i,3);
end
sum_list=[sr1,sr2,sr3,sc1,sc2,sc3,down_diagonal_sum,up_diagonal_sum];
end