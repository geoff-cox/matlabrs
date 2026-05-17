% =========================================================================
% Name: Zachary A. Shaffer
% HR: NONE 
% Inputs: 
%   1. num_of_games: the number of games to be played
%   2.xmove:which program strat to use for player x
%   3. omove: which program strat to use for player o
%                   ...
% Outputs:
%   1. xwin_pct: the percentage of wins for the x player
%   2. owin_pct: the percentage of wins for the o player
%                   ...
% =========================================================================

function [xwin_pct,owin_pct] = P8_ttt_shaffer(num_of_games,xmove,omove)
xwin=0;
owin=0;4
clc; % clear the command window
game_board=zeros(3,3);% (*) initialize game_board variable here
player=1;% (*) initialize player variable here
moves=0;% (*) initialize moves variable here
for r=1:num_of_games
while moves<9% (*) game loop: set the conditions to keep playing
   if player==1 && xmove==1       
       game_board((P2_ttt_move_v1_shaffer(game_board)))=1;
   end
   if player==1 && xmove==2
       player=1;
       game_board((P2_ttt_move_v2_shaffer(game_board,player)))=1;
   end
   if player ==1 && xmove==3
       player=1;
        game_board((P8_ttt_move_v3_shaffer(game_board,player)))=1;
   end
  if player==2 && omove==1
  game_board(P2_ttt_move_v1_shaffer(game_board))=-1;
  end
  if player==2 && omove==2
      player=-1;
      game_board((P2_ttt_move_v2_shaffer(game_board,player)))=-1;
      player=2;
  end
  if player==2 && omove==3
      player=-1;
      game_board((P8_ttt_move_v3_shaffer(game_board,player)))=-1;
      player=2;
  end
  moves=moves+1;% (*) update the moves variable
 winner=P1_ttt_winner_check_shaffer(game_board);   % (*) update the winner variable using your ttt_winner_check program
   if winner==1
       xwin=xwin+1;
       break
   end
   if winner==-1
       owin=owin+1;
       break
   end
   if player==1% (*) update the player variable in preparation for the next turn
    player=2;
   else if player==2
           player=1;
        end
   end 
  
end
xwin_pct=(xwin/num_of_games)*100;
owin_pct=(owin/num_of_games)*100;


end
end
function move = P8_ttt_move_v3_shaffer(game_board,player)
game_board;
z=game_board(:)';
y=P2_find_zeros_shaffer(z); %find zeros is broken need to fix
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
function move = P2_ttt_move_v2_shaffer(game_board,player)
game_board;
z=game_board(:)';
y=P2_find_zeros_shaffer(z); %find zeros is broken need to fix
n=length(y);
for i=1:n
    check_game_board=game_board;
    if player==1
        check_game_board(y(i))=1;
        a=P1_ttt_winner_check_shaffer(check_game_board);
        if a==1
            move=y(i);
        break
        end
        
        if i==n
            for k=1:n
        check_game_board(y(k))=-1;
    a=P1_ttt_winner_check_shaffer(check_game_board);
        if a==-1
            move=y(k);
        break
        end
        end    
    end
    end
     if player==-1
        check_game_board(y(i))=-1;
    a=P1_ttt_winner_check_shaffer(check_game_board);
        if a==-1
            move=y(i);
        break
        end
        if i==n
            for k=1:n
            check_game_board(y(k))=1;
    a=P1_ttt_winner_check_shaffer(check_game_board);
        if a==1
            move=y(k);
        break
        end
            end
        end
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
function move_space=P2_ttt_move_v1_shaffer(game_board)

A=game_board;
nums=A(:);
loc=P2_find_zeros_shaffer(nums);
l=length(loc);
move_space=loc(randi(l));

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