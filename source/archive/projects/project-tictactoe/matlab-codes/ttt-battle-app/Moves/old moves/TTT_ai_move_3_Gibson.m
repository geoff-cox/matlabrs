% =========================================================================
% This program returns an AI move to an available space in a Tic-Tac-Toe 
% game based on your chosen strategy.
%
% INPUT:
%   game_state (3 x 3) the current game state matrix
%   player (1 x 1) the current player ( 1 = X, -1 = O )
% OUTPUT:
%   move_to (1 x 1) absolute index of an available space on the gameboard.  
% =========================================================================
function move_to = TTT_ai_move_3_Gibson(game_state,player)

move_to = [];
player_status = TTT_detect_winning_move_Gibson(game_state);
locations = TTT42_get_open_spaces_gibson(game_state);

if player == 1 && numel(locations) == 9 
    start_move = [1,3,7,9];
         move_to = start_move(randi(4)); %Places the first move of X into one of the 4 corners of the game_state
    elseif player == 1 && player_status(1) ~= 0 % Searches for potential Win
         move_to = player_status(1);
     elseif player == 1 && player_status(2) ~= 0 % Searches for potential Block
         move_to = player_status(2);
    elseif player == 1 && player_status(1) == 0 && player_status(2) == 0 && game_state(5) == 0 % X takes middle position
         move_to = 5;
    elseif player == 1 && player_status(1) == 0 && player_status(2) == 0 && game_state(5) == -1 % O has taken the middle position
            if game_state(1) == 1 && game_state(3) == 0
               move_to = 3;
            elseif game_state(3) == 1 && game_state(1) == 0
                   move_to = 1; 
            elseif game_state(7) == 1 && game_state(9) == 0
                   move_to = 9; 
            elseif game_state(9) == 1 && game_state(7) == 0
                   move_to = 7; 
            end
elseif player == 1 && (game_state(1) == 1 || game_state(3) == 1 || game_state(7) == 1 || game_state(9) == 1) && game_state(5) == 1
       if game_state(1) == 1 && game_state(3) == 0
          move_to = 3;
       elseif game_state(3) == 1 && game_state(1) == 0
          move_to = 1;
       elseif game_state(1) == 1 && game_state(7) == 0
          move_to = 7;
       elseif game_state(7) == 1 && game_state(1) == 0
          move_to = 1;
       elseif game_state(7) == 1 && game_state(9) == 0
          move_to = 9;
       elseif game_state(9)== 1 && game_state(7) == 0
          move_to = 7;
       elseif game_state(3)== 1 && game_state(9) == 0
          move_to = 9;
       elseif game_state(9)== 1 && game_state(3) == 0
          move_to = 3;
       end
end


if player == -1 && numel(locations) == 8 && game_state(5) == 0
   move_to = 5;
elseif player == -1 && player_status(2) ~= 0
    move_to = player_status(2);
elseif player == -1 && player_status(1) ~= 0  
    move_to = player_status(1);   
elseif player == -1 && game_state(5) == -1
       if game_state(1) == 0
          move_to = 1;
       elseif game_state(3) == 0
          move_to = 3;
       elseif game_state(7) == 0
          move_to = 7;
       elseif game_state(9) == 0
          move_to = 9;
       end
 elseif player == -1 && player_status(1) == 0 && player_status(2) == 0
     move_to = TTT44_ai_move_1_gibson(game_state); 
end
end

%
% If you called any programs from a previous HW assignment in this function,
% copy and paste them here.  Otherwise, delete this comment.
function player_status = TTT_detect_winning_move_Gibson(game_state)
    player_status = [0 , 0];
    
    locations = TTT42_get_open_spaces_gibson(game_state);
    n = numel(locations);
    
    for i = 1:n
        theory_state = game_state;
        theory_state(locations(i)) = 1;
        winner = TTT41_winner_check_gibson(theory_state);
            if winner == 1
                player_status(1) = locations(i);
                break
            end
    end
    
    for j = 1:n
        theory_state = game_state;
        theory_state(locations(j)) = -1;
        winner = TTT41_winner_check_gibson(theory_state);
            if winner == -1
                player_status(2) = locations(j);
                break
            end
    end
    
    
end
function locations = TTT42_get_open_spaces_gibson(game_state)
    locations = [];
    n = numel(game_state);
    j = 1;
    for i = 1:n
        if game_state(i) == 0
            locations(j) = i;
            j = j+1;
        end
    end
end
function winner = TTT41_winner_check_gibson(game_state)
   winner = 0;
  
  for m = 1:3
      if sum(game_state(m,:)) == 3
          winner = 1;
      elseif sum(game_state(m,:)) == -3
          winner = -1;
      end   
  end
  for n = 1:3
      if sum(game_state(:,n)) == 3
          winner = 1;
      elseif sum(game_state(:,n)) == -3
          winner = -1;
      end 
  end
 
 if game_state(1,1) + game_state(2,2) + game_state(3,3) == 3
     winner = 1;
 elseif game_state(1,1) + game_state(2,2) + game_state(3,3) == -3
     winner = -1;    
 end
 
if game_state(1,3) + game_state(2,2) + game_state(3,1) == 3
     winner = 1;
 elseif game_state(1,3) + game_state(2,2) + game_state(3,1) == -3
     winner = -1;    
end
end
function move_to = TTT44_ai_move_1_gibson(game_state)
    move_to = [];
    locations = TTT42_get_open_spaces_gibson(game_state);
    n = numel(locations);
    if n == 0 
        move_to = [];
    else
    move_to = locations(randi(n));
    end
end
% =========================================================================
% HR:
%
% =========================================================================
