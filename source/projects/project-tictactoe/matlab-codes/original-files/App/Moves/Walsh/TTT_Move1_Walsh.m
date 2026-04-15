%=========================================================================
% Dolan Walsh
% Date 10/12/18
% Homework # 4
%=========================================================================
% Help Received Statement
% worked on psuedocode with Cadet Daniels
%=========================================================================
% Psuedocode
% Calling on the FindZeros function so that the function TTT_Move1 knows
% which space it open to move to. I had to fix the FindZeros function so
% that it was absolute index. The nargin == 2 is so that in case the user
% doesn't want to input randomSeed, they don't have to. x=length(locations)
% is getting the amount of zeros in vector locations. rng(randomSeed) will
% be whatever the input value is and it'll go through the randi that many
% times and it'll pick the randi iteration of the input. random = randi(x) 
% will take whatever that length is of locations and pick a number from 1 
% to that length randomly.Move =locations(random) will be the next move taken.

%=========================================================================
function [move] = TTT_Move1_Walsh(gameBoard,randomSeed)



if nargin == 2
    locations = FindZeros_Walsh(gameBoard);
    x = length(locations);
    rng(randomSeed);
    random = randi(x);
    move = locations(random);
    
else
    locations = FindZeros_Walsh(gameBoard);
    x = length(locations);
    random = randi(x);
    move = locations(random);
    
end





