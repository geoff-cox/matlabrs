% =========================================================================
% This program returns an AI move to an available space in a Tic-Tac-Toe
% game based on the following strategy:
% 
% An available space is chosen at random from a uniform distribution (i.e.
% all spaces are equally likely to be chosen).
% 
% INPUT:
%   game_state (3 x 3) current state of the TTT game board
% OUTPUT:
%   move_to (1 x 1) absolute index of an available space on the gameboard.
% =========================================================================
function move_to = TTT44_ai_move_1_Sellers(game_state)
a = game_state;
k = 0;
j = 0;



while k == 0  && j < 10
rng(77); 
b=randi([1,9],1);
j = j + 1;
if a(b) == 0
move_to = b;
k =1;
else 
move_to = [];
end

end



end

% =========================================================================
% HR: None
%
% =========================================================================
