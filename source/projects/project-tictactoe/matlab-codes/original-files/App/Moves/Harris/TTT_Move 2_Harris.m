% Header: Help Received: Matlab Documentation, in-class instruction
function move = TTT_Move_2_Harris (board, player, randomSeed)
if nargin == 3
    rng(randomSeed) % help received: in class instruction from LTC Cox
end
[n, m] = size(board);
ind = -1;
ind2 = -1;
sumz = SumVals_Harris(board);
for j = 1:8
    if sumz(j) == 2*player
        ind = j;
    elseif sumz(j) == -2*player
        ind2 = j;
    end
end % get index of sumVals returned sum if equal to 2
for i = 1:(n*m)
    % if there is a row,col,diag sum equal to 2
%     if board(i) == 0 && zeroAround(board, i)
    if ind ~= -1
        boardIndex = setFromTest(board, ind);
        break
    elseif ind2 ~= -1
        boardIndex = setFromTest(board, ind2);
        break
    else
        for j = 1:9
            if board(j) == 1 && zeroAround(board, j)
                boardIndex = findZeros(board, j);
                break
            elseif j == 9
                boardIndex = pickRandom(board);
            end
                
        end
        break
    end
end
move = boardIndex;
end

function index = pickRandom(board)
    while true
        f = randi([1,9]);
        if board(f) == 0
            index = f;
            return
        end
    end
end

function index = setFromTest(board, ind)
if ind == 1 || ind == 2 || ind == 3
    for j = 1:3
        if board(ind, j) == 0
            index = ((ind-1)*3) + j;
            return
        end
    end
%     board = pickRandom(board);
elseif ind == 4 || ind == 5 || ind == 6
    ind = ind-3;
    for j = 1:3
        if board(j, ind) == 0
            index = (((ind-1)*3) + j);
            return
        end
    end
%     board = pickRandom(board);
elseif ind == 7
    for j = 1:3
        if board(j, j) == 0
            index = ((j-1)*3) + (j);
            return
        end
    end
%     board = pickRandom(board);
elseif ind == 8
    for j = 1:3
        if board(j, 4-j) == 0
            index = (((4-j)-1)*3) + j;
            return
        end
    end
end
% board = pickRandom(board);
boardIndex = pickRandom(board);
index = boardIndex;
end

function test = zeroAround(board, i) % finds if zeros are around the current point
out = false;
if (board(2) == 0 || board(4) == 0) && (i == 1)
    out = true;
elseif (board(1) == 0 || board(5) == 0|| board(3) == 0) && (i == 2)
    out = true;
elseif (board(2) == 0 || board(6) == 0) && (i == 3)
    out = true;
elseif (board(1) == 0 || board(7) == 0|| board(5) == 0) && (i == 4)
    out = true;
elseif (board(2) == 0 || board(4) == 0|| board(6) == 0|| board(8) == 0) && (i == 5)
    out = true;
elseif (board(3) == 0 || board(5) == 0|| board(9) == 0) && (i == 6)
    out = true;
elseif (board(4) == 0 || board(8) == 0) && (i == 7)
    out = true;
elseif (board(7) == 0 || board(5) == 0|| board(9) == 0) && (i == 8)
    out = true;
elseif (board(6) == 0 || board(8) == 0) && (i == 9)
    out = true;
end
test = out;
end

function ind = findZeros(board, i) % returns index of 0 around current point
j = mod(i, 3);
k = ceil(i / 3);
if ((i == 2) || (i == 4)) && (board(1) == 0)
    out = 1;
elseif ((i == 1) || (i == 5)|| (i == 3)) && (board(2) == 0)
    out = 2;
elseif ((i == 2) || (i == 6)) && (board(3) == 0)
    out = 3;
elseif ((i == 1) || (i == 7)|| (i == 5)) && (board(4) == 0)
    out = 4;
elseif ((i == 2) || (i == 4)|| (i == 6)|| (i == 8)) && (board(5) == 0)
    out = 5;
elseif ((i == 3) || (i == 5)|| (i == 9)) && (board(6) == 0)
    out = 6;
elseif ((i == 4) || (i == 8)) && (board(7) == 0)
    out = 7;
elseif ((i == 7) || (i == 5)|| (i == 9)) && (board(8) == 0)
    out = 8;
elseif ((i == 6) || (i == 8)) && (board(9) == 0)
    out = 9;
end
ind = out;
end