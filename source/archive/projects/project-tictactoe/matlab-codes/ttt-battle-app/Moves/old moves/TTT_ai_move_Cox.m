function move_to = TTT_ai_move_Cox(tttBoard,player)
    open_spaces = find(tttBoard(:)==0);
    spaces_left = length(open_spaces);
    firstplayer = player;
    if tttBoard(5) == 0 % Take center space
        move_to = 5;
        return
    elseif spaces_left == 8 && tttBoard(5) == 1
        move_to = 9;       % Take corner space if center is taken
        return
    end
    move_to = open_spaces(1); % default move
    for i=1:spaces_left
        scoreMove = TTT_move_score(tttBoard,player,9-spaces_left,open_spaces(i),firstplayer);   
        if scoreMove == 1  % Good move, take it
            move_to = open_spaces(i);
            return;
        elseif scoreMove == 0 % Neutral move, keep looking for better
            move_to = open_spaces(i);
        end
    end
end

function score = TTT_move_score(tttBoard,player,round,thisMove,firstplayer)
    tttBoard(thisMove) = player;
    if firstplayer*TTT_winner_check_Key(tttBoard) > 0
        score = 1;
        return;
    elseif firstplayer*TTT_winner_check_Key(tttBoard) < 0
        score = -1;
        return;
    else
        openSpaces = TTT_get_open_spaces_Key(tttBoard(1:end));
        spacesLeft = length(openSpaces);
        if spacesLeft == 0
            score = 0;
            return;
        end
        scores = nan(1,spacesLeft);
        i=1;
        if spacesLeft > 0
            while round <= 9 && length(find(~isnan(scores))) < spacesLeft
                next_move = openSpaces(i);
                score = TTT_move_score(tttBoard,-player,round+1,next_move,firstplayer);
                scores(i) = score;
                tttBoard(next_move) = 0;
                i=i+1;
            end
        end
        if firstplayer*player == 1
            score = min(scores);
        else
            score = max(scores);
        end
    end
end

function winner = TTT_winner_check_Key(game_state)
    path_sums = P32_matrix_sums_Key(game_state);
    winner = 0;
    k = 1;
    while winner == 0 && k <= numel(path_sums)
        if path_sums(k) == 3
            winner = 1;
        elseif path_sums(k) == -3
            winner = -1;
        end
        k = k + 1;
    end
end
function locations = TTT_get_open_spaces_Key(game_state)
    n = numel(game_state);
    locations = zeros(1,n);
    j = 1;
    for k = 1:n
        if game_state(k) == 0
            locations(j) = k;
            j = j+1;
        end
    end
    locations(j:end) = [];
end
function values = P32_matrix_sums_Key(A)
    row_sums = sum(A,2);
    col_sums = sum(A)';
    dia_sums = P31_diagonal_sums_Key(A);
    values = [row_sums;col_sums;dia_sums];
end
function diag_sums = P31_diagonal_sums_Key(A)
    [m,n]=size(A);

    if m < n  % get the min of m and n
        max_i = m;
    else
        max_i = n;
    end

    down_diagonal_sum = 0; % initialize the sums
    up_diagonal_sum = 0;

    for i = 1:max_i
        down_diagonal_sum = down_diagonal_sum + A(i,i);
        up_diagonal_sum = up_diagonal_sum + A(m-i+1,i);
    end

    diag_sums = [down_diagonal_sum;up_diagonal_sum];
end



