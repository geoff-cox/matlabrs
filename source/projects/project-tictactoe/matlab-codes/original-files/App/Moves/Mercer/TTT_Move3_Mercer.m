%=========================================================================
% Full Name: Lindsey Mercer
% Date 10/29/18
% Homework #6
%=========================================================================
% Help Received Statement:
% 
%=========================================================================
% Psuedocode
% step 1
% step 2
% ...
% step n
%=========================================================================

function move= TTT_Move3_Mercer(gameBoard, player)

gameBoardVector= [gameBoard(1), gameBoard(2), gameBoard(3), gameBoard(4), gameBoard(5), gameBoard(6), gameBoard(7), gameBoard(8), gameBoard(9)];
ZerosInTTTBoard= FindZeros_Mercer(gameBoardVector);
SumofXandOs=SumVals_Mercer(gameBoard);
SizeofGameBoard= size(SumofXandOs);
X_output=1;
O_output=-1;

for c=1:SizeofGameBoard(1)

 if SumofXandOs==2
     move = 2+ gameBoard(X_output);
 end
 
 if SumofXandOs==-2
     move = -2+ gameBoard(O_output);
 end
 
 if (SumofXandOs~=2) || (SumofXandOs~= -2)
    move= TTT_Move1_Mercer(gameBoard);
 end
 
 end
end