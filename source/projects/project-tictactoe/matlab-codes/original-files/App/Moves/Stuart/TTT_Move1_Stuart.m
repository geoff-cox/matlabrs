%Maxwell Stuart
% Date: 10/15/18
% Homework #5
%=========================================================================
% Help Received Statement: Class Demos
% 
%=========================================================================
% Psuedocode
%set a variable to find zeros function with the gameboard as a 1 by 9 matrix
%if loop using nargin and the rng of randomSeed input
%end loopset variable to rando integer of the size of first variable 
%set out put to the first variable of the second one
%end function 
%=========================================================================
function  move=TTT_Move1_Stuart(gameboard,randomSeed)
w=FindZeros_Stuart(gameboard(1:end));
if nargin==2
  rng(randomSeed);
end 
h=randi(size(w));
move=w(h);
end 
