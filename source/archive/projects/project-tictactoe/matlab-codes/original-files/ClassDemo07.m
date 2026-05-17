% ClassDemo07
% Topics covered:
%  * demo of how to use DisplayBoard
%  * demo of how the game should look
% ------------------------------------------------------------------------
% Problems: 
% 1. Define the empty game board and run it through DisplayBoard
% 2. Add an X to the center space and run it through DisplayBoard
% 3. Add an O to the E space and run it through DisplayBoard
% 4. Check for winner
% 5. Add an X -> SE space, O -> S space, and X -> NW space and run it through DisplayBoard
% 6. Check for winner
% ------------------------------------------------------------------------
% Other Notes: 
% 1. MATLAB's input function can be used to prompt user inputs from the commandline
% 2. Flow control options 
%        return - exits out of the current function/program
%        break - exits out of the function for/while loop
%        continue - goes directly to the next iteration in a for loop
% ------------------------------------------------------------------------
% Problems: 
% 1. Define the empty game board and run it through DisplayBoard
gameBoard = zeros(3,3);
DisplayBoard(gameBoard)

% 2. Add an X to the center space and run it through DisplayBoard
gameBoard(5) = 1;
DisplayBoard(gameBoard)

% 3. Add an O to the E space and run it through DisplayBoard
gameBoard(8) = -1;
DisplayBoard(gameBoard)

% 4. Check for winner
TTT_WinnerCheck(gameBoard)

% 5. Add an O to the E space and run it through DisplayBoard
gameBoard(9) = 1;
gameBoard(6) = -1;
gameBoard(1) = 1;
DisplayBoard(gameBoard)

% 6. Check for winner
TTT_WinnerCheck(gameBoard)
