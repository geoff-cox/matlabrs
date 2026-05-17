function winner = TicTacToeGame_PvC(firstPlayer)
winner = 0;
board = zeros(3,3);
player = 1;
isCurrentPlayerHuman = mod(firstPlayer,2);
DisplayBoard(board);
moves = 0; 
playerNames = ['X','O'];
while winner == 0 && moves < 9
    if isCurrentPlayerHuman
        space = input(['Player ',playerNames(1-(player-1)/2),', pick a space: ']);
        isCurrentPlayerHuman = 0;
    else
        space = TTT_Move2(board,player);
        fprintf('Player %s moves to the %i space.\n',playerNames(1-(player-1)/2),space);
        isCurrentPlayerHuman = 1;
    end
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
