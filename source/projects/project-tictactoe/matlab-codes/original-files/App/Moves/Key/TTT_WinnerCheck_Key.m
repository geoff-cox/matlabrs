function outcome = TTT_WinnerCheck_Key(gameBoard)
checkSums = SumVals_Key(gameBoard);
n=length(checkSums);
outcome = 0;
for i = 1:n
    if checkSums(i) == 3
        outcome = 1;
        return
    elseif checkSums(i) == -3
        outcome = -1;
        return
    end
end
end

