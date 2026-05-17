% =========================================================================
% This program returns a list available spaces (as an absolute index) in a
% Tic-Tac-Toe game. 
% INPUT:
%   game_state (3 x 3) current state of the TTT game board
% OUTPUT:
%   locations (1 x n) row vector of open spaces
% =========================================================================
function locations = TTT42_get_open_spaces_clements(game_state)
   num = numel(game_state);
   locations = zeros(1,num);
   j = 1;
   for k = 1:num
       if game_state(k) == 0
       locations(j) = k;
       j = j+1;
       end
   end
   locations(j:end) = [];
end
   
       




%
%
%
% =========================================================================
% HR: none
%
% =========================================================================