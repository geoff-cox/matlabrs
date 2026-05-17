function move=TTT_Move1_Donlan(gameboard,player,randomSeed)
%==========================================================================
% Connor Donlan
% 10/07/2018
% Homework 3
%==========================================================================
% Help Received: None
%==========================================================================
% Pseudocode:	if there is a random seed use it
% using find zeros function find all indexes of zeros and length
% choose a random value between 1 to the lenght of Index Zeros
% move is the IndexZeros(val)
%==========================================================================
% Code:

op=nargin;
if op==3
    rng(randomSeed);
end
IndexZeros=FindZeros_Key(gameboard(1:end));
a=length(IndexZeros);
val=randi(a,1);
move=IndexZeros(val);
end