%=========================================================================
% Full Name:Po-yin Su
% Date 10/26/18
% Homework 5
%=========================================================================
% Help Received Statement
% none
%=========================================================================
function move=TTT_Move2_Su(gameBoard,player,randomSeed)
if nargin==3 
    rng(randomSeed);
end
gameBoard1=gameBoard(1:9);
A=FindZeros_Su(gameBoard1);
n=length(FindZeros_Su(gameBoard1));
for i=1:n
    gameBoard(A(i))=player;
    if TTT_WinnerCheck_Su(gameBoard)==player
        move=i;
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
move=TTT_Move1_Su(gameBoard);
end
