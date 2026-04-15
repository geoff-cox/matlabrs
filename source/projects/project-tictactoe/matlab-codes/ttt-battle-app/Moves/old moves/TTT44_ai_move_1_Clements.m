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
rng(77); 
set = randi([1,l]);
move_to = able(set);
end
%
%
% =========================================================================
% HR: None 
%
% =========================================================================
