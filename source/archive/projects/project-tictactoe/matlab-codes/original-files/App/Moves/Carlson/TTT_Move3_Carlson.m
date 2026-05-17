%=========================================================================
% Daniel Carlson
% 11/09/2018
% Homework 06
%=========================================================================
% Help Received Statement
% None
%=========================================================================
% Psuedocode
% create function
% initialize move to zero
% initialize gameBoard_test to zero
% set variable g equal to the row vector corresponding to gameBoard
% set z equal to the values produced by the values produced by FindZeros_Carlson(g)
% create if statement for i equals 1 to the number of zeros in gameBoard
% set gameBoard_test equal to gameBoard
% set the specific index of a zero in gameBoard_test equal to the value of the current player
% create if statement for when the current player could be the winner
% set move equal to the specific index to produce a winning move
% end if statement
% set the index of a zero in gameBoard_test equal to the value of the opposing player
% create if statement for when the next move could produce a win for the opposing player and no winning moves for the current player are possible
% set move equal to the specific index
% end if statement
% end for loop
% create if statement for when the length of z is greater than 7
% set move equal to TTT_Move1_Carlson(gameBoard)
% end if statement
% create if statement
% create for loop
% create if statement 
% set move equal to z(i)
% end if statement
% create if statement
% end if statement
% end if statement
% create if statement
% set move equal to z(i)
% end if statement
% create if statement
% set move equal to z(i)
% end if statement
% create if statement
% set move equal to z(i)
% end if statement
% create if statement
% set move equal to z(i)
% end if statement
% create if statement
% set move equal to z(i)
% end if statement
% create if statement
% set move equal to z(i)
% end if statement
% create if statement
% set move equal to z(i)
% end if statement
% end if statement
% end for loop
% end function
%=========================================================================
function move=TTT_Move3_Carlson(gameBoard,player) % create function
move=0; % initialize move to zero
gameBoard_test=0; % initialize gameBoard_test to zero
g=gameBoard(1:9); % set variable g equal to the row vector corresponding to gameBoard
z=FindZeros_Key(g); % set z equal to the values produced by the values produced by FindZeros_Carlson(g)
for i=1:length(z) % create if statement for i equals 1 to the number of zeros in gameBoard
    gameBoard_test=gameBoard; % set gameBoard_test equal to gameBoard
    gameBoard_test(z(i))=player; % set the specific index of a zero in gameBoard_test equal to the value of the current player
    if TTT_WinnerCheck_Key(gameBoard_test)==player % create if statement for when the current player could be the winner
        move=z(i); % set move equal to the specific index to produce a winning move
    end % end if statement
    gameBoard_test(z(i))=-player; % set the index of a zero in gameBoard_test equal to the value of the opposing player
    if TTT_WinnerCheck_Key(gameBoard_test)==-player % create if statement for when the next move could produce a win for the opposing player and no winning moves for the current player are possible
        move=z(i); % set move equal to the specific index
    end % end if statement
end % end for loop
if length(z)>7 % create if statement for when the length of z is greater than 7
    move=TTT_Move1_Carlson(gameBoard); % set move equal to TTT_Move1_Carlson(gameBoard)
end % end if statement
if move==0 % create if statement
    for i=1:length(z) % create for loop
        if z(i)==1 & ((gameBoard(z(i)+3)==player & gameBoard(z(i)+6)==0) | (gameBoard(z(i)+3)==0 & gameBoard(z(i)+6)==player) | (gameBoard(z(i)+1)==player & gameBoard(z(i)+2)==0) | (gameBoard(z(i)+1)==0 & gameBoard(z(i)+2)==player) | (gameBoard(z(i)+4)==player & gameBoard(z(i)+8)==0) | (gameBoard(z(i)+4)==0 & gameBoard(z(i)+8)==player)) % create if statement 
            move=z(i); % set move equal to z(i)
        end % end if statement
        if z(i)==2 & ((gameBoard(z(i)+3)==player & gameBoard(z(i)+6)==0) | (gameBoard(z(i)+3)==0 & gameBoard(z(i)+6)==player) | (gameBoard(z(i)+1)==player & gameBoard(z(i)-1)==0) | (gameBoard(z(i)+1)==0 & gameBoard(z(i)-1)==player)) % create if statement
            move=z(i); % end if statement
        end % end if statement
        if z(i)==3 & ((gameBoard(z(i)+3)==player & gameBoard(z(i)+6)==0) | (gameBoard(z(i)+3)==0 & gameBoard(z(i)+6)==player) | (gameBoard(z(i)-1)==player & gameBoard(z(i)-2)==0) | (gameBoard(z(i)-1)==0 & gameBoard(z(i)-2)==player) | (gameBoard(z(i)+2)==player & gameBoard(z(i)+4)==0) | (gameBoard(z(i)+2)==0 & gameBoard(z(i)+4)==player)) % create if statement
            move=z(i); % set move equal to z(i)
        end % end if statement
        if z(i)==4 & ((gameBoard(z(i)+3)==player & gameBoard(z(i)-3)==0) | (gameBoard(z(i)+3)==0 & gameBoard(z(i)-3)==player) | (gameBoard(z(i)+1)==player & gameBoard(z(i)+2)==0) | (gameBoard(z(i)+1)==0 & gameBoard(z(i)+2)==player)) % create if statement
            move=z(i); % set move equal to z(i)
        end % end if statement
        if z(i)==5 & ((gameBoard(z(i)-3)==player & gameBoard(z(i)+3)==0) | (gameBoard(z(i)-3)==0 & gameBoard(z(i)+3)==player) | (gameBoard(z(i)-1)==player & gameBoard(z(i)+1)==0) | (gameBoard(z(i)-1)==0 & gameBoard(z(i)+1)==player) | (gameBoard(z(i)-2)==player & gameBoard(z(i)+2)==0) | (gameBoard(z(i)-2)==0 & gameBoard(z(i)+2)==player)) % create if statement
            move=z(i); % set move equal to z(i)
        end % end if statement
        if z(i)==6 & ((gameBoard(z(i)-3)==player & gameBoard(z(i)+3)==0) | (gameBoard(z(i)-3)==0 & gameBoard(z(i)+3)==player) | (gameBoard(z(i)-1)==player & gameBoard(z(i)-2)==0) | (gameBoard(z(i)-1)==0 & gameBoard(z(i)-2)==player)) % create if statement
            move=z(i); % set move equal to z(i)
        end % end if statement
        if z(i)==7 & ((gameBoard(z(i)-3)==player & gameBoard(z(i)-6)==0) | (gameBoard(z(i)-3)==0 & gameBoard(z(i)-6)==player) | (gameBoard(z(i)-2)==player & gameBoard(z(i)-4)==0) | (gameBoard(z(i)-2)==0 & gameBoard(z(i)-4)==player) | (gameBoard(z(i)+1)==player & gameBoard(z(i)+2)==0) | (gameBoard(z(i)+1)==0 & gameBoard(z(i)+2)==player)) % create if statement
            move=z(i); % set move equal to z(i)
        end % end if statement
        if z(i)==8 & ((gameBoard(z(i)-3)==player & gameBoard(z(i)-6)==0) | (gameBoard(z(i)-3)==0 & gameBoard(z(i)-6)==player) | (gameBoard(z(i)-1)==player & gameBoard(z(i)+1)==0) | (gameBoard(z(i)-1)==0 & gameBoard(z(i)+1)==player)) % create if statement
            move=z(i); % set move equal to z(i)
        end % end if statement
        if z(i)==9 & ((gameBoard(z(i)-3)==player & gameBoard(z(i)-6)==0) | (gameBoard(z(i)-3)==0 & gameBoard(z(i)-6)==player) | (gameBoard(z(i)-4)==player & gameBoard(z(i)-8)==0) | (gameBoard(z(i)-4)==0 & gameBoard(z(i)-8)==player) | (gameBoard(z(i)-1)==player & gameBoard(z(i)-2)==0) | (gameBoard(z(i)-1)==0 & gameBoard(z(i)-2)==player)) % create if statement
            move=z(i); % set move equal to z(i)
        end % end if statement
    end % end if statement
end % end for loop
end % end function