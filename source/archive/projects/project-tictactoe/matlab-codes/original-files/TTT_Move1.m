function move = TTT_Move1(tttBoard,player,seedy)
if nargin == 3
    rng(seedy);
end
openSpaces = FindZeros_Key(tttBoard(1:end));
numOfOpenSpaces = length(openSpaces);
randomIndex = randi(numOfOpenSpaces);
move = openSpaces(randomIndex);
end

