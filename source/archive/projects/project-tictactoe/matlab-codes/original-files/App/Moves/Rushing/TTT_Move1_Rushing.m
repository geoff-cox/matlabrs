%=========================================================================
% Brent Rushing
% 10/26/18
% Homework #5
%=========================================================================
% Help Received Statement
% none
%=========================================================================
% Psuedocode
% define the board vector using the index values of the gameboard 
% display the game board 
% define spots using find zeros as the zeros in board vector 
% define L as the length of the vector spots 
% use randi of L to find a random value of spots to find where to move
% use nargin to make the random seed input optional
% do same as above using rng of the random seed 
%=========================================================================

function [move]= TTT_Move1_Rushing(gameBoard,randomSeed)

BoardVector= [gameBoard(:,1); gameBoard(:,2); gameBoard(:,3)];
DisplayBoard(gameBoard)
 

        spots= FindZeros_Rushing(BoardVector);
        L= length(spots);
        r= randi(L);
        move= spots(r);    
        

if nargin == 2
    

        spots= FindZeros_Rushing(BoardVector);
        L= length(spots);
        rng(randomSeed)
        r= randi(L);
        move= spots(r);
     
    
    
end


end



