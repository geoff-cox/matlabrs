%ME-310-02
%Homework 5
%Carter, DC
%10/26/18
%Part 1
%------------------------------------------------------------------------
%Pseudocode
%create function
%determine if 1 or 2 inputs
%2 input case
%establish randi settings
%store gameboard as single row
%find zeros
%make move
%1 input case
%find zeros
%make move
%end switch
%display gameboard
%-------------------------------------------------------------------------

function move=TTT_Move1_Carter(gameBoard,randomSeed)
switch nargin;
    case 2
        rng(randomSeed);
        B=gameBoard(1:9);
locations=FindZeros_Carter(B);
        B(locations(randi(length(locations))))=1;
    case 1
                B=gameBoard(1:9);
locations=FindZeros_Carter(B);
        B(locations(randi(length(locations))))=1;
end
move=B([1:3;4:6;7:9]);
end
        