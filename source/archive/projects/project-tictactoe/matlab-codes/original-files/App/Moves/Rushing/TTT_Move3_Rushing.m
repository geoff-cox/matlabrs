%=========================================================================
% Brent Rushing
% 11/14/18
% Homework #6
%=========================================================================
% Help Received Statement
% 
%=========================================================================
% Psuedocode
% define board vector using the absolute index of the gameboard 
% display game board 
% enter for loop for values i=1:9 
% define output Z as the zeros on the board 
% check for a winner 
% enter for loop for player 1 and player 2 
% use sumvals to find the possible stategic moves for player 2 
% use if statements to find open zeros in the row/col/diag 
% repeat for player 1 
%=========================================================================


function [ move ]= TTT_Move3_Rushing(gameBoard,player)

for i=1:9
    
    BoardVector= [gameBoard(:,1); gameBoard(:,2); gameBoard(:,3)];
    DisplayBoard(gameBoard)
    [Z]= FindZeros_Rushing(BoardVector);
    [WinCheck]= TTT_WinnerCheck_Rushing(gameBoard);
    
for player= -1    
   [row1,row2,row3,col1,col2,col3, DiagSum, OffDiagSum] = SumVals_Rushing(gameBoard);
   if row1==-1 
      A= FindZeros_Rushing(gameBoard(1,:)); 
      move= A(1);
   elseif row2==-1 
      A= FindZeros_Rushing(gameBoard(2,:)); 
      move= A(1);
   elseif row3==-1 
       A= FindZeros_Rushing(gameBoard(3,:));
       move= A(1);
   elseif col1==-1 
       A= FindZeros_Rushing(gameBoard(:,1));
       move= A(1); 
   elseif col2==-1 
       A= FindZeros_Rushing(gameBoard(:,2)); 
       move= A(1);
   elseif col3==-1 
       A= FindZeros_Rushing(gameBoard(:,3));
       move= A(1); 
   elseif col1==-1 
       A=  FindZeros_Rushing(gameBoard(:,1));
       move= A(1); 
   elseif DiagSum== -1
      A= FindZeros_Rushing([gameBoard(1),gameBoard(5),gameBoard(9)]);
      move= A(1);
   elseif OffDiagSum== -1
      A= FindZeros_Rushing([gameBoard(3),gameBoard(5),gameBoard(7)]);
      move= A(1);
   else 
      TTT_Move2_Rushing(gameboard,player)
   end   
end

for player= 1    
   [row1,row2,row3,col1,col2,col3, DiagSum, OffDiagSum] = SumVals_Rushing(gameBoard);
   if row1==1 
      A= FindZeros_Rushing(gameBoard(1,:)); 
      move= A(1);
   elseif row2==1 
      A= FindZeros_Rushing(gameBoard(2,:)); 
      move= A(1);
   elseif row3==1 
       A= FindZeros_Rushing(gameBoard(3,:));
       move= A(1);
   elseif col1==1 
       A= FindZeros_Rushing(gameBoard(:,1));
       move= A(1); 
   elseif col2==1 
       A= FindZeros_Rushing(gameBoard(:,2)); 
       move= A(1);
   elseif col3==1 
       A= FindZeros_Rushing(gameBoard(:,3));
       move= A(1); 
   elseif col1==1 
       A=  FindZeros_Rushing(gameBoard(:,1));
       move= A(1); 
   elseif DiagSum== 1
      A= FindZeros_Rushing([gameBoard(1),gameBoard(5),gameBoard(9)]);
      move= A(1); 
   elseif OffDiagSum== 1
      A= FindZeros_Rushing([gameBoard(3),gameBoard(5),gameBoard(7)]);
      move= A(1);
   else 
      TTT_Move2_Rushing(gameboard,player) 
   end   
         
end

end

end 