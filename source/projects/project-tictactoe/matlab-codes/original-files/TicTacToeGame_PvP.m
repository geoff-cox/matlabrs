function winner = TicTacToeGame_PvP()
clear all; close all; clc;
winner = 0;
board = zeros(3,3);
player = 1;
DisplayBoard(board);
moves = 0; 
playerNames = ['X','O'];
while winner == 0 && moves < 9
    space = input(['Player ',playerNames(1-(player-1)/2),', pick a space: ']);
    board(space) = player;
    moves = moves+1;
    winner = TTT_WinnerCheck(board);
    DisplayBoard(board);
    player = -player;
end
if moves == 9
    fprintf('Tie Game\n\n');
else
    fprintf('Player %s wins!\n\n',playerNames(1-(winner-1)/2));
end
end
