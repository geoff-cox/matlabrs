%=========================================================================
% Full Name:Po-yin Su
% Date 11/15/18
% Homework 6
%=========================================================================
% Help Received Statement
% none
%=========================================================================
function move=TTT_Move3_Su(gameBoard,player,randomSeed)
if nargin==3 
    rng(randomSeed);
end
gameBoard1=gameBoard(1:9);
A=FindZeros_Su(gameBoard1);

n=length(FindZeros_Su(gameBoard1));
for i=1:n
    gameBoard(A(i))=player;
    if TTT_WinnerCheck_Su(gameBoard)==player
        move=A(i);
        return
    else
        gameBoard(A(i))=0;
    end
end
for i=1:n
    gameBoard(A(i))=-player;
    if TTT_WinnerCheck_Su(gameBoard)==-player
       move=A(i);
     return
    else
       gameBoard(A(i))=0;
    end
end
if gameBoard(5)==0
    move=5;
else
move=TTT_Move1_Su(gameBoard);
end