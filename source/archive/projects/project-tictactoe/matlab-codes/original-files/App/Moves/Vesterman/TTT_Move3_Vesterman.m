%=========================================================================
% Johnny Vesterman
% November 14, 2018 
% Homework #06
%=========================================================================
% Help Received Statement
% COL Cox: JEV
%=========================================================================
% Psuedocode
% 
% 
% 
% 
%=========================================================================

function move=TTT_Move3_Vesterman(gameBoard,player)
vector=gameBoard(1:9); % put gameBoard into vec
locations=FindZeros_Vesterman(vector); % find empty spaces in vector 
zerosLength=length(locations); % find total empty spaces
move=0; % initialize move
values=SumVals_Vesterman(gameBoard); % run SumVals
if player==1 % if it's player 1 turn
    for i=1:9 % as i goes from 1 to vecLength
        for j=1:8 % as j goes from 1 to 8
            if values(j)==2 && vector(i)==0 % if values is 2 and vec is 0
                move=i; % put move there
                return % return loop
            end % end if
        end % end for
    end % end for
    for i=1:9 % as i goes from 1 to 9
        for j=1:8 % as j goes from 1 to 8
            if values(j)==-2 && vector(i)==0 % if a blank spot blocks a win
                move=i; % put move there
                return % return loop
            end % end if
        end % end for
    end % end for
    for i=1:9 % as i goes from 1 to 9
        if vector(i)==0 % if a spot is blank
            vector(i)=1; % put a 1 in the spot
            values=SumVals_Vesterman(gameBoard); % run SumVals
            double=0; % initialize double
            for j=1:8 % as j goes from 1 to 8
                if values(j)==2 % if there's 2 in a row
                    double=double+1; % increase double
                    if double>1 % if double is more than 1
                        move=i; % put move at i
                        return % return loop
                    end % end if
                end % end if 
            end % end for
        end % end if
    end % end for 
elseif player==-1 % elseif its player -1
    for i=1:vecLength % as i goes from 1 to vecLength
        for j=1:8 % as j goes from 1 to 8
            if values(j)==-2 && vector(i)==0 % if values is -2 and vec is 0
                move=i; % put move there
                return % return loop
            end % end if
        end % end for
    end % end for
    for i=1:9 % as i goes from 1 to 9
        for j=1:8 % as j goes from 1 to 8
            if values(j)==2 && vector(i)==0 % if a blank spot is a winner
                move=i; % put move there
                return % return loop
            end % end if
        end % end for
    end % end for 
    for i=1:9 % as i goes from 1 to 9
        if vector(i)==0 % if a spot is blank
            vector(i)=-1; % put move there
            values=SumVals_Vesterman(gameBoard); % run SumVals
            double=0; % initialize double
            for j=1:8 % as i goes 1 to 8
                if values(j)==-2 % if theres 2 in a row
                    double=double+1; % increase double
                    if double>1 % if double is greater than 1 
                        move=i; % place move there
                        return % return loop
                    end % end if
                end % end if
            end % end for
        end % end if
    end % end for    
end % end if
if move==0 % if move is 0
    move=locations(randi(zerosLength)); % randomly select empty space
end % end if
end % end function