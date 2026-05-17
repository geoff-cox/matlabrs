function move = TTT_Move4(tttBoard,player,curMoveSeqn,seedy)
% checkSums = SumVals(Board);
openSpaces = FindZeros_Key(tttBoard(1:end));
numOfMovesLeft = length(openSpaces);
numOfMoves = 9-numOfMovesLeft;
xData=load('data_TTT_xOutcomes.mat');
xWinMoves=xData.xWinSeqns;
xLoseMoves=xData.xLoseSeqns;
xTieMoves=xData.xTieSeqns;

xWinMovesLeft = xWinMoves;
numOfxWinMovesLeft=length(xWinMovesLeft(:,1));

xLoseMovesLeft = xLoseMoves;
numOfxLoseMovesLeft=length(xLoseMovesLeft(:,1));

xTieMovesLeft = xTieMoves;
numOfxTieMovesLeft=length(xTieMovesLeft(:,1));

% totalNumOfMovesLeft = numOfxWinMovesLeft+numOfxLoseMovesLeft+numOfxTieMovesLeft;
goodXPivots = [];
badXPivots  = [];
if mod(numOfMoves,2)==0
    for j=1:numOfMoves
        xWinMovesLeft(xWinMovesLeft(1:numOfxWinMovesLeft,j) ~= curMoveSeqn(j),:) = [];
        numOfxWinMovesLeft=length(xWinMovesLeft(:,1));
    end
    [M,N]=size(xWinMovesLeft);
    StartingValueWins = zeros(1,N);
    tic
    for i=1:M
        StartingValueWins(xWinMovesLeft(i,numOfMoves+1))=StartingValueWins(xWinMovesLeft(i,numOfMoves+1))+1;
        if numOfMoves > 3
            tempBoard = tttBoard;
            for p=numOfMoves+1:8
                tempBoard(xWinMovesLeft(i,p))=(-1)^(p+1);
                if length(find(SumVals(tempBoard)==2))==2
%                     fprintf('i = %i, p = %i   <---- future pivot for X\n',i,p)
                    goodXPivots = [goodXPivots;[p,i]];
                end
                if length(find(SumVals(tempBoard)==-2))==2
                    fprintf('i = %i, p = %i   <---- future pivot for O\n',i,p)
                    badXPivots = [badXPivots;[p,i]];
                end
            end
            
        end
        
        %         goodXPivots = [goodXPivots;xWinMovesLeft(SumVals(tempBoard)== 2,:)];
        %         badXPivots  = [badXPivots;xWinMovesLeft(SumVals(tempBoard)==-2,:)];
    end
    if numOfMoves > 3 && ~isempty(goodXPivots)
    [P,I]=min(goodXPivots(:,1));
    fprintf('min p = %i at location = %i\n',P,goodXPivots(I,2))
    disp(xWinMovesLeft(goodXPivots(I,2),:))
    move = xWinMovesLeft(goodXPivots(I,2),numOfMoves+1);
    return
    end
    toc
else
    for j=1:numOfMoves
        xLoseMovesLeft(xLoseMovesLeft(1:numOfxLoseMovesLeft,j) ~= curMoveSeqn(j),:) = [];
        numOfxLoseMovesLeft=length(xLoseMovesLeft(:,1));
    end
    [M,N]=size(xLoseMovesLeft);
    StartingValueWins = zeros(1,N);
    for i=1:M
        StartingValueWins(xLoseMovesLeft(i,numOfMoves+1))=StartingValueWins(xLoseMovesLeft(i,numOfMoves+1))+1;
        %         goodOPivots = xLoseMovesLeft(SumVals([xLoseMovesLeft(i,1:3)' xLoseMovesLeft(i,4:6)' xLoseMovesLeft(i,7:9)'])==-2,:);
        %         badOPivots =  xLoseMovesLeft(SumVals([xLoseMovesLeft(i,1:3)' xLoseMovesLeft(i,4:6)' xLoseMovesLeft(i,7:9)'])== 2,:);
    end
end

[maxNum,move] = max(StartingValueWins);
%
% % make a winning move
% move = TTT_Move_ForWin(tttBoard,player,openSpaces);
% if ~isempty(move)
%     return
% end
% % block a winning move
% move = TTT_Move_ForWin(tttBoard,-player,openSpaces);
% if ~isempty(move)
%     return
% end
%
% % block a pivot
% move = TTT_Move_ForPivot(tttBoard,-player,openSpaces);
% if ~isempty(move)
%     return
% end
%
% % create a pivot
% move = TTT_Move_ForPivot(tttBoard,player,openSpaces);
% if ~isempty(move)
%     return
% end
%
%
%
% % if player == 1 && tttBoard(1) == 0
% %     move = 1;
% %     return
% % else
%
% if nargin == 2
%     move = TTT_Move1(tttBoard,player);
% else
%     move = TTT_Move1(tttBoard,player,seedy);
% end

end

