% Header: Help Received: Matlab Documentation
function board = TTT_Move1_Harris2 (gameBoard, firstPlayer)
% rng(randomSeed); % - don't need this to receive a uniform, random distr.
gameBoard2 = gameBoard;
playFirst = (firstPlayer == 1);
if playFirst
    ind = randi(9); % randi(5);
%    indices = [1,3,5,7,9] - the smart move
    gameBoard2(ind) = 1; % gameBoard2(indices(ind)) = 1;
end
board = gameBoard2;
end