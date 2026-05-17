function move = TTT_Move3_Key(tttBoard,player)
openSpaces = FindZeros_Key(tttBoard(1:end));
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
    scoreMove = TTT_MoveScore_Key(tttBoard,player,9-spacesLeft,openSpaces(i),firstplayer);   
    if scoreMove == 1  % Good move, take it
        move = openSpaces(i);
        return;
    elseif scoreMove == 0 % Neutral move, keep looking for better
        move = openSpaces(i);
    end
end
end

