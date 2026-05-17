function [winner,moveSeqn] = TicTacToeGame_CvC_Deeper(moveNameX,moveNameO,seedy1,seedy2)
winner = 0;
board = zeros(3,3);
player = 1;
%DisplayBoard(board);
moves = 0;
moveSeqn = zeros(1,9);
playerNames = ['X','O'];
XMove = str2func(['TTT_Move',moveNameX]);
OMove = str2func(['TTT_Move',moveNameO]);
while winner == 0 && moves < 9
    if player == 1
        if nargin == 3 || nargin == 4
            space = XMove(board,player,seedy1);
        else
            space = XMove(board,player);
        end
    else
        if nargin == 4
            space = OMove(board,player,seedy2);
%             space = OMove(board,player,26);
        else
            space = OMove(board,player);
        end
    end
    %fprintf('Player %s moves to the %i space.\n',playerNames(1-(player-1)/2),space);
    board(space) = player;
    moves = moves+1;
    winner = TTT_WinnerCheck(board);
    moveSeqn(moves) = space;
    %DisplayBoard(board);
    player = -player;
end
if winner == 0
    %fprintf('Tie Game\n\n');
else
    %fprintf('Player %s wins!\n\n',playerNames(1-(winner-1)/2));
end
end
