%=========================================================================
% Johnny Vesterman
% October 10, 2018 
% Homework #04
%=========================================================================
% Help Received Statement
% COL Cox: JEV
%=========================================================================
% Psuedocode
% make gameboard a vector from abs. indicies
% find where the zeros are in the vector
% vecLength is number of zeros
% if there are 2 inputs
%   rng the seed
% end if statement
% move is a random zeros spot
% end function
%=========================================================================

function move=TTT_Move1_Vesterman(gameBoard,randomSeed)
vector=gameBoard(1:9); % make gameboard a vector from abs. indicies
locations=FindZeros_Vesterman(vector); % find where the zeros are in the vector
vecLength=length(locations); % vecLength is number of zeros
if nargin==2 % if there are 2 inputs
    rng(randomSeed) % rng the seed
end % end if statement 
move=locations(randi(vecLength)); % move is a random zeros spot
end % end function