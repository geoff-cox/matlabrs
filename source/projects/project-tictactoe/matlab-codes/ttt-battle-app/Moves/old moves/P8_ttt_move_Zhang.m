

% =======================================================================
% Name: Zhang Yuchen
% HR:   none 
% Inputs: 
%   1.game_board: row vector contaning the coordinates of the point p
%  2. player:-1 or 1 depending on which player is moving 
%  
% Output
%   1. move: absolute index of the selected gama_board space
% =====================================================================




function move = P8_ttt_move_Zhang(game_board,player)

open_spaces=P2_find_zeros_Zhang(game_board);
space=P1_ttt_winning_move_Zhang(game_board,player,open_spaces);

if space~=0
    move=space;
elseif space==0
        space=P1_ttt_winning_move_Zhang(game_board,-1*player,open_spaces);
    if space~=0
     move=space;
    else 
        move = P2_ttt_move_v1_Zhang(game_board);
        
    end
    
end

end

function move = P1_ttt_winning_move_Zhang(game_board,player,open_spaces)

N = length(open_spaces);
move =  P2_ttt_move_v1_Zhang(game_board);
game_board_2 =game_board ;


for k =1:N
    game_board=game_board_2 ;
    if player == 1
    game_board(open_spaces(k))=1;
    m = P1_ttt_winner_check_Zhang(game_board);
    if m == 1
        move=open_spaces(k);
        return
    end
    elseif player == -1
        game_board(open_spaces(k))=-1;
    g = P1_ttt_winner_check_Zhang(game_board);
    if g == 1
        move=open_spaces(k);
        return
    end
    end
end
end

function move_space= P2_ttt_move_v1_Zhang(game_board)
open_spots = [];
for i = 1:3
    zeros = (P2_find_zeros_Zhang(game_board(i, :))-1)*3 + (i);
    open_spots=[open_spots,zeros];
    
    
end
 move_space = open_spots(randi([1,length(open_spots)]));



end


function  locations = P2_find_zeros_Zhang(nums)

N=length(nums);
locations=[];
x=0;
for k=1:N
   if nums(k)== 0
       x=x+1;
      locations(1,x) = k;
  
   end
end  
end


