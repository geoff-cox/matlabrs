% =========================================================================
% Tic-Tac-Toe game player vs computer
% =========================================================================
% Name:
% HR:
% Inputs:
%   None
% Outputs:
%   1. winner: has value 1 if player X wins,
%              has value -1 if player O wins,
%              has value 0 if there was a tie
% =========================================================================

function [winner,message] = ttt_single_game_sim(p1_move,p2_move)

winner = 0;
game_board = zeros(3,3);
player = 1;
moves = 0;
while winner == 0 && moves < 9
    if player == 1
        space = p1_move(game_board,player);
    else
        space = p2_move(game_board,player);
    end
    game_board(space) = player;
    moves = moves+1;
    winner = P1_ttt_winner_check_Key(game_board);
    player = -player;
end
end