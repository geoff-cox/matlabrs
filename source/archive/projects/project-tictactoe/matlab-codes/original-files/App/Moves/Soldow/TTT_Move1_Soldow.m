%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lab 4
% Name: William Soldow
% Date: 10/10/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HR:Cadet Vesterman, Cadet Pessognelli and mathworks.com
% x. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Psuedocode:
% Step 1:establish gameBoard but with absolute index
% Step 2: using nargin establish whether there are one or two inputs
% Step 3: if only 1 input, move is random number
% Step 4: if 2 inputs, random number has a seed to set it
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
function move= TTT_Move1_soldow(gameBoard,randomSeed)
gameBoard=gameBoard(1:9)
findzeros=FindZeros_soldow(gameBoard)
switch nargin
    case 1
        move=randi([1,9],1)
    case 2
        rng(randomSeed)
        move=randi([1,9],1)
end
end