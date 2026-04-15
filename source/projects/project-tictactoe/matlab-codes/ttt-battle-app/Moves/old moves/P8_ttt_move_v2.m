function move = P8_ttt_move_v2(board,player)
open_spaces = find(board(:) == 0);
% make a winning move
move = ttt_winning_move_Key(board,player,open_spaces);
if ~isempty(move)
    return
end
% block a winning move
move = ttt_winning_move_Key(board,-player,open_spaces);
if ~isempty(move)
    return
end

move = ttt_move_v1(board);

end

% =========================================================================
% Helper Function: description
% =========================================================================

function move = ttt_move_v1(game_board)
open_spaces = find(game_board(:) == 0);
num_open_spaces = length(open_spaces);
randomIndex = randi(num_open_spaces);
move = open_spaces(randomIndex);
end

function move = ttt_winning_move_Key(tttBoard,player,spaces)
move=[];
tempBoard = tttBoard;

n=length(spaces);
for i = 1:n
    tempBoard(spaces(i)) = player;
    if ttt_winner_check(tempBoard) == player
        move = spaces(i);
        return
    end
    tempBoard = tttBoard;
end

end

function outcome = ttt_winner_check(game_board)
outcome = 0;
col_sums = sum(game_board);
row_sums = sum(game_board,2);
diag1_sum = sum(diag(game_board));
diag2_sum = sum(diag(game_board([3 2 1],:)));
if sum([col_sums,row_sums',diag1_sum,diag2_sum] == 3) > 0
    outcome = 1;
    return
elseif sum([col_sums,row_sums',diag1_sum,diag2_sum] == -3) > 0
    outcome = -1;
    return
end
end
