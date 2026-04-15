%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cadet Barry Thaxton Jr. 
% MA310-02
% HW5
% DUE: October 25, 2018
% HR: I used the corrections given on my previous assignment. 
%
% PROGRAM NAME:  TTT_Move1_Thaxton.m
% Psuedocode:
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function move = TTT_Move1_Thaxton(gameBoard,randomSeed)
A = FindZeros_Thaxton(gameBoard(1:9));
if nargin==2
    rng(randomSeed)
    x = randi(length(A));
    move = A(x); 
else
    x = randi(length(A));
    move = A(x);
end 