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