function move=TTT_Move3_Donlan(gameboard,player,randomSeed)
%==========================================================================
% Connor Donlan
% 11/14/2018
% Homework 6
%==========================================================================
% Help Received: Used move 2 to create move 3, my roomate Jared Braiman
% recomended checking my process because I ranted to him that I kept
% getting only a win for player 1 and then i realized I wasnt counting the
% ties
%==========================================================================
% Pseudocode:
% using find zeros function find all indexes of zeros and length
% for
% set new game board
% if the value of 1 is playes is there a winner?
% if yes, play the space corresponding to the win
% if the value of -1 is playes is there a winner?
% if yes, play the space corresponding to the win
% check the corners and if they are open play there if there was no
% winning/ losing play
% if no winning moves or corners available use corrected move 1 to find a space to
% play
%==========================================================================
% Code:
op=nargin;
if op==3
rng(randomSeed);
end
IndexZeros=FindZeros_Donlan(gameboard);
a=length(IndexZeros);
if player==1
    for i=1:a;
        gprime=gameboard;
        gprime(IndexZeros(i))=1;
        outcome=TTT_WinnerCheck_Donlan(gprime);
        if outcome==1;
            move=IndexZeros(i);
            break
        end
        gprime(IndexZeros(i))=-1;
        outcome=TTT_WinnerCheck_Donlan(gprime);
        if outcome==-1;
            move=IndexZeros(i);
            break
        end
        if gameboard(1)==0;
            move=1;
        elseif gameboard(3)==0;
            move=3;
        elseif gameboard(7)==0;
            move=7;
        elseif gameboard(9)==0;
            move=9;
        else
            move=TTT_Move1_Donlan(gameboard);
        end
    end
elseif player==-1
    for i=1:a;
        gprime=gameboard;
        gprime(IndexZeros(i))=1;
        outcome=TTT_WinnerCheck_Donlan(gprime);
        if outcome==1;
            move=IndexZeros(i);
            break
        end
        gprime(IndexZeros(i))=-1;
        outcome=TTT_WinnerCheck_Donlan(gprime);
        if outcome==-1;
            move=IndexZeros(i);
            break
        end
        if gameboard(1)==0;
            move=1;
        elseif gameboard(3)==0;
            move=3
        elseif gameboard(7)==0;
            move=7;
        elseif gameboard(9)==0;
            move=9;
        else
            move=TTT_Move1_Donlan(gameboard);
        end
    end
end
