% =========================================================================
% This program returns an AI move to an available space in a Tic-Tac-Toe
% game based on the set of priorities:
%
%  	1: If a winning move is available, it takes it. 
%
%   2: If a winning move for the opposing player is available, it takes it
%   (thus, blocking that move).
%
%   3: It chooses an available space at random from a uniform distribution (i.e., all spaces are equally likely
%  	to be selected).
%
% INPUT:
%   game_state (3 x 3) the current game state matrix
%   player (1 x 1) the current player ( 1 = X, -1 = O )
% OUTPUT:
%   move_to (1 x 1) absolute index of an available space on the gameboard.  
% =========================================================================
function move_to = TTT_ai_move_2_clements(game_state,player)
        if player == 1
            
            ai = 2;
        elseif player == -1
            player = 2;
            ai = 1;
            
        end
        
        W = TTT_detect_winning_move_Clements(game_state);
    
        if W(ai) ~= 0 
            move_to = W(ai);
        
        elseif W(player) ~= 0
            move_to = W(player);
            
        else
            move_to = TTT44_ai_move_1_clements(game_state);
        end
end


function move_to = TTT44_ai_move_1_clements(game_state)
 
    able = zeros(1,9);
    j = 1;
    for k = 1:9
      if game_state(k) == 0 
          able(j) = k;
          j = j+1;
      end
    end
    able(j:end) = [];
    l = numel(able);
    if l ==0
        move_to = [];
        return
    end
    set = randi([1,l]);
    move_to = able(set);
end

% =========================================================================
% HR: None
%
% =========================================================================
