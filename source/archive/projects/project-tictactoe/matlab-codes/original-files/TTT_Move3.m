function move = TTT_Move3(tttBoard,player,seedy)
% checkSums = SumVals(Board);
openSpaces = FindZeros_Key(tttBoard(1:end));
% make a winning move
move = TTT_Move_ForWin(tttBoard,player,openSpaces);
if ~isempty(move)
    return
end
% block a winning move
move = TTT_Move_ForWin(tttBoard,-player,openSpaces);
if ~isempty(move)
    return
end

% create a pivot
move = TTT_Move_ForPivot(tttBoard,player,openSpaces);
if ~isempty(move)
%     fprintf(' ...  created!\n')
    return
end

% block a pivot
move = TTT_Move_ForPivot(tttBoard,-player,openSpaces);
if ~isempty(move)
%     fprintf(' ...  blocked!\n')
    return
end


% if player == 1 && tttBoard(1) == 0
%     move = 1;
%     return
% else

if nargin == 3
    move = TTT_Move1(tttBoard,player,seedy);
else
    move = TTT_Move1(tttBoard,player);
end

end

