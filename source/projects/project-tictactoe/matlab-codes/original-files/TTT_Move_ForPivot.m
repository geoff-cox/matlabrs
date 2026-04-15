function move = TTT_Move_ForPivot(tttBoard,player,spaces)
move=[];
tempBoard = tttBoard;

n=length(spaces);
for i = 1:n
    tempBoard(spaces(i)) = player;
    if length(FindZeros_Key(SumVals(tempBoard)-2*player)) > 1
        move = spaces(i);
        %         fprintf('Pivot Move ... ')
        return
    end
    tempBoard = tttBoard;
end

% if length(spaces) > 1
%     twoMovesAhead = nchoosek(spaces,2);
%     n=length(twoMovesAhead);
%     for i = 1:n
%         tempBoard(twoMovesAhead(i,1)) = player;
%         tempBoard(twoMovesAhead(i,2)) = player;
%         if length(FindZeros_Key(SumVals(tempBoard)-2*player)) > 1
%             move = spaces(twoMovesAhead(i,1));
% %             fprintf('2 Pivot Move ... ')
%             return
%         end
%         tempBoard = tttBoard;
%     end
% end

end
% for i = 1:n
%     tempBoard(spaces(i)) = -player;
%     if TTT_WinnerCheck(tempBoard) == -player*3
%         move = spaces(i);
%         return
%     end
%     tempBoard = tttBoard;
% end
%
%     if checkSums(i) == 2*player
%         %fprintf('player %i makes a winning move\n',player);
%         move = TTT_Move_Win(tttBoard,player);
%         return
%     elseif checkSums(i) == -2*player
%         %fprintf('player %i  blocks a win\n',player);
%         move = TTT_Move_WinBlock(tttBoard,player);
%         return
%     end
% end
%
% move = tttBoard;
% for r = 1:3
%     if sum(tttBoard(r,:)) == 2*player
%         emptyC = find(tttBoard(r,:)==0);
%         move(r,emptyC) = player;
%         return;
%     end
% end
% for c = 1:3
%     if sum(tttBoard(:,c)) == 2*player
%         emptyR = find(tttBoard(:,c)==0);
%         move(emptyR,c) = player;
%         return;
%     end
% end
% for d = 1:3
%     if sum(diag(tttBoard)) == 2*player
%         emptyD = find(diag(tttBoard)==0);
%         move(emptyD,emptyD) = player;
%         return;
%     elseif sum(diag(tttBoard(end:-1:1,:))) == 2*player
%         emptyD = find(diag(tttBoard(end:-1:1,:))==0);
%         move(end-emptyD+1,emptyD) = player;
%         return;
%     end
% end
% end

