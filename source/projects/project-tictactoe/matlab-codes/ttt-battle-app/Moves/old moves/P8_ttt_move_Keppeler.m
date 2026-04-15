% Name: Joseph R Keppeler
% HR:   None

% Inputs: 
%   1. game_board: 3x3 matrix of a current tic-tac toe board
%   2. player: which player is going first
%                   ...
% Outputs:
%   1. move: move that the player will take
%                   ...
% =========================================================================


function move= P8_ttt_move_keppeler(game_board,player)

avalible_spaces=P2_find_zeros_keppeler(game_board(:));
winner=P1_ttt_winner_check_keppeler(game_board);
L=length(avalible_spaces);
move=0;
for j=1:L
    game_board(avalible_spaces(j))=player;
    winner=P1_ttt_winner_check_keppeler(game_board);
     if winner==0
        game_board(avalible_spaces(j))=0;
     end
     if winner>0 || winner<0
     move=avalible_spaces(j);
     return
     end
end

if player==1
    player2=-1;
elseif player==-1
    player2=1;
end
if winner==0 
for k=1:L
    game_board(avalible_spaces(k))=player2;
    winner=P1_ttt_winner_check_keppeler(game_board);
    if winner==player2
        game_board(avalible_spaces(k))=player;
        move=avalible_spaces(k);
        return
    end
     if winner==0
        game_board(avalible_spaces(k))=0;
     end
end
end
  if winner==0
      for w=1:L
          
      if avalible_spaces(w)==1
          move=1;
          return
      elseif avalible_spaces(w)==3
          move=3;
          return
      elseif avalible_spaces(w)==7
          move=7;
          return
      elseif avalible_spaces(w)==9
          move=9;
          return
      elseif avalible_spaces(w)==5
          move=5;
      end
      end
      if move==0
      move=P2_ttt_move_v1_keppeler(game_board);
      end
  end
end

function move_space = P2_ttt_move_v1_keppeler(game_board)
zeros=P2_find_zeros_keppeler(game_board(:));
L=length(zeros);
A=randi(L,1,1);
move_space=zeros(A);
end

 

function locations = P2_find_zeros_keppeler(nums)
L= length(nums);
locations=[];
i=1;
for k=1:L
    if nums(k)==0
        locations(i)=k;
        i=i+1;
    end
end
end

function outcome = P1_ttt_winner_check_keppeler(game_board)
sums=P3_matrix_path_sums_keppeler(game_board);
outcome=0;
for k=1:8
    if sums(k,1)==3
        outcome=1;
    elseif sums(k,1)==-3
        outcome=-1;
    end
end
        

end

 
function [sum_list] = P3_matrix_path_sums_keppeler(A)
SR1=0;
SR2=0;
SR3=0;
SC1=0;
SC2=0;
SC3=0;
DD=0;
UD=0;
for k=1:3
    SR1=SR1+A(1,k);
    SR2=SR2+A(2,k);
    SR3=SR3+A(3,k);
    SC1=SC1+A(k,1);
    SC2=SC2+A(k,2);
    SC3=SC3+A(k,3);
    DD=DD+A(k,k);
end
for j=0:2
    UD=UD+A(3-j,1+j);
end
sum_list=[SR1;SR2;SR3;SC1;SC2;SC3;DD;UD];
end




