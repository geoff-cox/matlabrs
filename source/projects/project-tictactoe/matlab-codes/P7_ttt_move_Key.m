function move = move_Cox(tttBoard,player)
openSpaces = find(tttBoard(:)==0);
spacesLeft = length(openSpaces);
firstplayer = player;
if tttBoard(5) == 0 % Take center space
    move = 5;
    return
elseif spacesLeft == 8 && tttBoard(5) == 1
    move = 9;       % Take corner space if center is taken
    return
end
move = openSpaces(1); % default move
for i=1:spacesLeft
    scoreMove = ttt_move_score(tttBoard,player,9-spacesLeft,openSpaces(i),firstplayer);   
    if scoreMove == 1  % Good move, take it
        move = openSpaces(i);
        return;
    elseif scoreMove == 0 % Neutral move, keep looking for better
        move = openSpaces(i);
    end
end
end

% =========================================================================
% Helper Function: ttt_move_score (unbeatable tic-tac-toe AI)
% =========================================================================

function score = ttt_move_score(ttt_board,player,round,this_move,first_player)
ttt_board(this_move) = player;
if first_player*P1_ttt_winner_check_Key(ttt_board) > 0
    score = 1;
    return;
elseif first_player*P1_ttt_winner_check_Key(ttt_board) < 0
    score = -1;
    return;
else
    openSpaces = find(ttt_board(:)==0);
    spacesLeft = length(openSpaces);
    if spacesLeft == 0
        score = 0;
        return;
    end
    scores = nan(1,spacesLeft);
    i=1;
    if spacesLeft > 0
        while round <= 9 && length(find(~isnan(scores))) < spacesLeft
            nextMove = openSpaces(i);
            score = ttt_move_score(ttt_board,-player,round+1,nextMove,first_player);
            scores(i) = score;
            ttt_board(nextMove) = 0;
            i=i+1;
        end
    end
    if first_player*player == 1
        score = min(scores);
    else
        score = max(scores);
    end
end
end

% =========================================================================
% Helper Function:ttt_winner_check
% =========================================================================

function outcome = P1_ttt_winner_check_Key(game_board)
checkSums = P3_matrix_path_sums_Key(game_board);
n=length(checkSums);
outcome = 0;
for i = 1:n
    if checkSums(i) == 3
        outcome = 1;
        return
    elseif checkSums(i) == -3
        outcome = -1;
        return
    end
end
end

% =========================================================================
% Helper Function: matrix_path_sums
% =========================================================================

function values = P3_matrix_path_sums_Key(A)
values = zeros(8,1);
i=1;
for r=1:3
    values(i) = sum(A(r,:));
    i=i+1;
end
for c=1:3
    values(i) = sum(A(:,c));
    i=i+1;
end
[values(i),values(i+1)] = P2_cross_diagonal_sums_Key(A);
end

% =========================================================================
% Helper Function: cross_diagonal_sums
% =========================================================================

function [down_diagonal_sum,up_diagonal_sum] = P2_cross_diagonal_sums_Key(A)
[m,n]=size(A);
down_diagonal_sum = 0;
up_diagonal_sum = 0;
for i=1:n
    down_diagonal_sum = down_diagonal_sum + A(i,i);
    up_diagonal_sum = up_diagonal_sum + A(m-i+1,i);
end
end

