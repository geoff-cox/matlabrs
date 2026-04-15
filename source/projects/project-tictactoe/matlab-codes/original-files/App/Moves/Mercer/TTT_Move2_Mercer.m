%=========================================================================
% Full Name Lindsey Mercer
% Date 10/15/18
% Homework #5
%=========================================================================
% Help Received Statement: None
% 
%=========================================================================
% Psuedocode
% set an if statement for if nargin equals to 3
	% pick a random number from 1 to the number value in randomSeed
% end if statement
% set the gameboard as a 1x9 row vector
% determine how many empty spaces (zeros) there are in the gameBoard

% create an if statement for if any sum of the gameBoard equals to -2
    % when any sum equals to -2, the computer will make it add to -3
% end if statement

% create an if statement if any sum of the gameBoard equals to 2
    % when any sum equals to 2, make the computer block it so that the sum
    % will equal to 1
% end if statement

% if the computer can't do either option, it will use TTT_Move1
%=========================================================================

function move= TTT_Move2_Mercer(gameBoard, player, randomSeed)
if nargin==3
    rng(randomSeed);
end
gameBoardVector= [gameBoard(1), gameBoard(2), gameBoard(3), gameBoard(4), gameBoard(5), gameBoard(6), gameBoard(7), gameBoard(8), gameBoard(9)];

ZerosinTTTgame=FindZeros_Mercer(gameBoardVector);
SizeofGame=size(ZerosinTTTgame);

SumofValues=SumVals_Mercer(gameBoard);

if SumofValues==-2
-3== -2+ move(gameBoard) % when any sum equals to -2, the computer will make it add to -3
end

if SumofValues==2
1== 2+move(gameBoard) % when any sum equals to 2, make the computer block it so that the sum
                        %will equal to 1
end

if (SumofValues~=2) |  (SumofValues~=-2)
move=TTT_Move1_Mercer;
end
    
end
