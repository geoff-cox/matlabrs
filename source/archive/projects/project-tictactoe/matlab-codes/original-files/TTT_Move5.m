function move = TTT_Move5(tttBoard,player)
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
        scoreMove = TTT_MoveScore(tttBoard,player,9-spacesLeft,openSpaces(i),firstplayer);   
        if scoreMove == 1  % Good move, take it
            move = openSpaces(i);
            return;
        elseif scoreMove == 0 % Neutral move, keep looking for better
            move = openSpaces(i);
        end
    end
end

% Unbeatable TicTacToe AI 
function score = TTT_MoveScore(tttBoard,player,round,thisMove,firstplayer)
    tttBoard(thisMove) = player;
    if firstplayer*TTT_WinnerCheck(tttBoard) > 0
        score = 1;
        return;
    elseif firstplayer*TTT_WinnerCheck(tttBoard) < 0
        score = -1;
        return;
    else
        openSpaces = FindZeros_Key(tttBoard(1:end));
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
                score = TTT_MoveScore(tttBoard,-player,round+1,nextMove,firstplayer);
                scores(i) = score;
                tttBoard(nextMove) = 0;
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
