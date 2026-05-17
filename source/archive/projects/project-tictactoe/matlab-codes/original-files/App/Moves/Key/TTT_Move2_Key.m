function move = TTT_Move2_Key(tttBoard,player,seedy)
openSpaces = FindZeros_Key(tttBoard(1:end));
% make a winning move
move = TTT_Move_ForWin_Key(tttBoard,player,openSpaces);
if ~isempty(move)
    return
end
% block a winning move
move = TTT_Move_ForWin_Key(tttBoard,-player,openSpaces);
if ~isempty(move)
    return
end

if nargin == 2
    move = TTT_Move1_Key(tttBoard,player);
else
    move = TTT_Move1_Key(tttBoard,player,seedy);
end

end

