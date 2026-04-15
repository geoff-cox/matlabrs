function move = TTT_Move_ForWin(tttBoard,player,spaces)
move=[];
tempBoard = tttBoard;

n=length(spaces);
for i = 1:n
    tempBoard(spaces(i)) = player;
    if TTT_WinnerCheck(tempBoard) == player
        move = spaces(i);
        return
    end
    tempBoard = tttBoard;
end

end
