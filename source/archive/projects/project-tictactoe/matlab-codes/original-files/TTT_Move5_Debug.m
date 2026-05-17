function move = TTT_Move5(tttBoard,player)
openSpaces = FindZeros_Key(tttBoard(1:end));
spacesLeft = length(openSpaces);
firstplayer = player;
if tttBoard(5) == 0 
    move = 5;
    return
elseif spacesLeft == 8 && tttBoard(5) == 1
    move = 9;
    return
end
move = openSpaces(1);
for i=1:spacesLeft
%     fprintf('Analyzing the move: %i *************************************\n',openSpaces(i));
%     DisplayBoard(tttBoard);
    scoreMove(i) = TTT_MoveScore(tttBoard,player,9-spacesLeft,openSpaces(i),firstplayer);
    
    if scoreMove(i) == 1
        move = openSpaces(i);
        return;
    elseif scoreMove(i) == 0
        move = openSpaces(i);
    end
shit=1;
end
end

