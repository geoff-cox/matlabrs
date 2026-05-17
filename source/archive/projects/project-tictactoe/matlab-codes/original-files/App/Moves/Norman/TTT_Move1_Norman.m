%=========================================================================
% Jeremiah Norman
% 9/21/18
% Homework 4
%=========================================================================
% Help Received Statement
% 
%=========================================================================
% Psuedocode
% 
% find all zeros
% randomly select a space
% place a move there
% end
%=========================================================================

function move = TTT_Move1_Norman(gameboard,randomseed)

zero = FindZeros_Norman(gameboard);
x = length(zero);
if nargin==2
rng(randomseed);
end
pic = randi([1,x]);
space = zero(pic);

move = space;

end