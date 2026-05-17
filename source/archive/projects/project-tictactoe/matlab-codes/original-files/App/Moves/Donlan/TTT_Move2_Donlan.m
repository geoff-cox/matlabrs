function move=TTT_Move2_Donlan(gameboard,player,randomSeed)
%==========================================================================
% Connor Donlan
% 11/14/2018
% Homework 6
%==========================================================================
% Help Received: None
%==========================================================================
% Pseudocode:	
% using find zeros function find all indexes of zeros and length
% for 
% set new game board
% if the value of 1 is playes is there a winner?
% if yes, play the space corresponding to the win
% if the value of -1 is playes is there a winner?
% if yes, play the space corresponding to the win
% if no winning moves available use corrected move 1 to find a space to
% play
%==========================================================================
% Code:
op=nargin;

IndexZeros=FindZeros_Key(gameboard);
a=length(IndexZeros);
for i=1:a;
gprime=gameboard;
gprime(IndexZeros(i))=1;
outcome=TTT_WinnerCheck_Key(gprime);
if outcome==1;
    move=IndexZeros(i);
    break
end
gprime(IndexZeros(i))=-1;
outcome=TTT_WinnerCheck_Key(gprime);
if outcome==-1;
    move=IndexZeros(i);
    break
end
if op==3
    move=TTT_Move1_Donlan(gameboard,player,randomSeed);
else
    move=TTT_Move1_Donlan(gameboard,player);
end
end


