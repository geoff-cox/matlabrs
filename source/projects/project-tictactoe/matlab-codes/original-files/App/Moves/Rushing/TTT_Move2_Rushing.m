%=========================================================================
% Brent Rushing
% 10/26/18
% Homework #5
%=========================================================================
% Help Received Statement
% none
%=========================================================================
% Psuedocode
% define board vector using the absolute index of the gameboard 
% display game board 
% enter for loop for values i=1:9 
% define output Z as the zeros on the board 
% check for a winner 
% enter for loop for player 1 and player 2 
% use sumvals to find the possible moves to win for player 2 
% use if statements to find open zeros in the row/col/diag with a game winning
% spot 
%=========================================================================

function [move]= TTT_Move2_Rushing(gameBoard,player,randomSeed)

BoardVector= [gameBoard(:,1); gameBoard(:,2); gameBoard(:,3)];
DisplayBoard(gameBoard)

for i=1:9
    [Z]= FindZeros_Rushing(BoardVector);
    [WinCheck]= TTT_WinnerCheck_Rushing(gameBoard);
    
for player= -1    
   [row1,row2,row3,col1,col2,col3, DiagSum, OffDiagSum] = SumVals_Rushing(gameBoard);
   if row1==-2 
      A= FindZeros_Rushing(gameBoard(1,:)); 
      move= A(1);
   end
   if row2==-2 
      A= FindZeros_Rushing(gameBoard(2,:)); 
      move= A(1);
   end
   if row3==-2 
       A= FindZeros_Rushing(gameBoard(3,:));
       move= A(1);
   end
   if col1==-2 
       A= FindZeros_Rushing(gameBoard(:,1));
       move= A(1); 
   end
   if col2==-2 
       A= FindZeros_Rushing(gameBoard(:,2)); 
       move= A(1);
   end
   if col3==-2 
       A= FindZeros_Rushing(gameBoard(:,3));
       move= A(1); 
   end
   if col1==-2 
       A=  FindZeros_Rushing(gameBoard(:,1));
       move= A(1); 
   end
   if DiagSum== -2
      A= FindZeros_Rushing([gameBoard(1),gameBoard(5),gameBoard(9)]);
      move= A(1);
   end  
   if OffDiagSum== -2
      A= FindZeros_Rushing([gameBoard(3),gameBoard(5),gameBoard(7)]);
      move= A(1);
   end   
end

for player= 1    
   [row1,row2,row3,col1,col2,col3, DiagSum, OffDiagSum] = SumVals_Rushing(gameBoard);
   if row1==2 
      A= FindZeros_Rushing(gameBoard(1,:)); 
      move= A(1);
   end
   if row2==2 
      A= FindZeros_Rushing(gameBoard(2,:)); 
      move= A(1);
   end
   if row3==2 
       A= FindZeros_Rushing(gameBoard(3,:));
       move= A(1);
   end
   if col1==2 
       A= FindZeros_Rushing(gameBoard(:,1));
       move= A(1); 
   end
   if col2==2 
       A= FindZeros_Rushing(gameBoard(:,2)); 
       move= A(1);
   end
   if col3==2 
       A= FindZeros_Rushing(gameBoard(:,3));
       move= A(1); 
   end
   if col1==2 
       A=  FindZeros_Rushing(gameBoard(:,1));
       move= A(1); 
   end
   if DiagSum== 2
      A= FindZeros_Rushing([gameBoard(1),gameBoard(5),gameBoard(9)]);
      move= A(1);
   end  
   if OffDiagSum== 2
      A= FindZeros_Rushing([gameBoard(3),gameBoard(5),gameBoard(7)]);
      move= A(1);
   end   
end

end
end
