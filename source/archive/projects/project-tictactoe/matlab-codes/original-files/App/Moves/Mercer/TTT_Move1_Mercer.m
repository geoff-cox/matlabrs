%=========================================================================
% Full Name Lindsey Mercer
% Date 10/03/18
% Homework #4
%=========================================================================
% Help Received Statement:
% 
%=========================================================================
% Psuedocode
% Set the gameBoard as a 1x9 vector
% Use the FindZeros function to find the locations of the zeros
% select a random variable between the first number in the random vector
% and the last number in the random variable
% set output
%=========================================================================

function move= TTT_Move1_Mercer(gameBoard, randomSeed)
if nargin==3
    rng(randomSeed);
end

gameBoardVector= [gameBoard(1), gameBoard(2), gameBoard(3), gameBoard(4), gameBoard(5), gameBoard(6), gameBoard(7), gameBoard(8), gameBoard(9)];
ZerosInTTTBoard= FindZeros_Mercer(gameBoardVector)

move1= randi(ZerosInTTTBoard(end), 1, ZerosInTTTBoard(1));

move= move1(1);
end