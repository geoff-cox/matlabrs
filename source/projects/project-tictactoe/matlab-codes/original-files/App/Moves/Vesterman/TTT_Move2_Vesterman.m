%=========================================================================
% Johnny Vesterman
% October 15, 2018 
% Homework #05
%=========================================================================
% Help Received Statement
% COL Cox: JEV
%=========================================================================
% Psuedocode
% put gameBoard into vec
% find length of vec
% find empty spaces in vector
% find total empty spaces
% initialize move
% if there are 3 inputs
%   rng the seed
% end if statment
% run SumVals of the board
% if it's player 1 turn
%   as i goes from 1 to vecLength
%       as j goes from 1 to 8
%           if values is 2 and vec is 0
%               put move there
%               break loop
%           end if
%       end for
%   end for
% elseif its player -1
%   as i goes from 1 to vecLength
%       as j goes from 1 to 8
%           if values is -2 and vec is 0
%               put move there
%               break loop
%           end if
%       end for
%   end for
% end if
% if move is 0
%   randomly select empty space
% end if
% end function
%=========================================================================

function move=TTT_Move2_Vesterman(gameBoard,player,randomSeed)
vector=gameBoard(1:9); % put gameBoard into vec
vecLength=length(vector); % find length of vec
locations=FindZeros_Vesterman(vector); % find empty spaces in vector 
zerosLength=length(locations); % find total empty spaces
move=0; % initialize move
if nargin==3 % if there are 3 inputs  
    rng(randomSeed) % rng the seed  
end % end if  
values=SumVals_Vesterman(gameBoard);
if player==1 % if it's player 1 turn
    for i=1:vecLength % as i goes from 1 to vecLength
        for j=1:8 % as j goes from 1 to 8
            if values(j)==2 && vector(i)==0 % if values is 2 and vec is 0
                move=i; % put move there
                break % break loop
            end % end if
        end % end for
    end % end for
elseif player==-1 % elseif its player -1
    for i=1:vecLength % as i goes from 1 to vecLength
        for j=1:8 % as j goes from 1 to 8
            if values(j)==-2 && vector(i)==0 % if values is -2 and vec is 0
                move=i; % put move there
                break % break loop
            end % end if
        end % end for
    end % end for
end % end if
if move==0 % if move is 0
    move=locations(randi(zerosLength)); % randomly select empty space
end % end if
end % end function