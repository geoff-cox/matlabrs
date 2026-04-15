% Header: Help Received: Matlab Documentation
function out = TTT_Move1_Harris (gameBoard, randomSeed)

rng(randomSeed);

zeros = findZeros(gameBoard);

len = length(zeros);

ind = randi(len); % randi(5);

out = zeros(ind);
end

function out = findZeros (gameBoard)
zer = [];
for i = 1:9
    if gameBoard(i) == 0
        zer(length(zer)+1) = i;
    end
end
out = zer;
end