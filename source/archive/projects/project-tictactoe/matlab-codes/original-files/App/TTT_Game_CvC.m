function [winner,X_time,O_time,X_error,O_error] = TTT_Game_CvC(player_1,player_1_strategy,player_2,player_2_strategy,rseed1,rseed2)
winner = 0;
X_error = 0;
O_error = 0;
board = zeros(3,3);
curMoveSeqn = zeros(1,9);
player = 1;
%DisplayBoard(board);
moves = 0;
playerNames = ['X','O'];

XMove = str2func(['TTT_Move',player_1_strategy,'_',player_1]);
OMove = str2func(['TTT_Move',player_2_strategy,'_',player_2]);
X_time = 0;
O_time = 0;
while winner == 0 && moves < 9
    if player == 1
        X_move_start_time = tic;
        %try
            if nargin > 4
                space = XMove(board,player,rseed1);
            else
                space = XMove(board,player);
            end
        %catch
            %X_error = 1;
            %return
        %end
        X_time = X_time + toc(X_move_start_time);
    else
        O_move_start_time = tic;
%         try
            if nargin > 4
                space = OMove(board,player,rseed2);
            else
                space = OMove(board,player);
            end
        %catch
            %O_error = 1;
            %return
        %end
        O_time = O_time + toc(O_move_start_time);
    end
    %fprintf('Player %s moves to the %i space.\n',playerNames(1-(player-1)/2),space);
    try
        board(space) = player;
    catch
        stop = 1;
    end
        moves = moves+1;
    curMoveSeqn(moves) = space;
    winner = TTT_WinnerCheck_Key(board);
    if length(FindZeros_Key(abs(SumVals_Key(board))-2)) > 1
        %         fprintf('\nPivot Happened!\n')
    end
    %DisplayBoard(board);
    player = -player;
end
if winner == 0
    %     fprintf('Tie Game\n\n');
else
    %     fprintf('Player %s wins! Moves = %i \n\n',playerNames(1-(winner-1)/2),moves);
    if winner==-1
        %     disp(curMoveSeqn)
    end
    
end
end
