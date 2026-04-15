function score = TTT_MoveScore(tttBoard,player,round,thisMove,firstplayer)
% if not terminal board, continue recursion
%   Get open spaces
%   Compute length of open spaces
%   Loop through open spaces (future moves)
%       Place move on gameboard
%       Go down Move5 one level, saving score in scores
%       Increment score counter, i
%   End Loop
% otherwise (we have a terminal gameboard)
%   Get terminal score (+1 for win, -1 for loss, 0 for tie)
% end if
% return score as max or min of scores (depending on player)
% playerNames = ['X','O'];
% s=[]; for k=1:round; s=[s,'....']; end
% if round == 0; fprintf(''); end
%else; fprintf('      %s %i \n',s,thisMove);
tttBoard(thisMove) = player;
% DisplayBoard(tttBoard);
if firstplayer*TTT_WinnerCheck(tttBoard) > 0
    score = 1;
%     fprintf('%s %s %i',playerNames(1-(player-1)/2),s,thisMove)
%     fprintf(' * WIN\n')
%     disp(['round ',num2str(round),' = ',num2str(score),'*'])
    return;
elseif firstplayer*TTT_WinnerCheck(tttBoard) < 0
    score = -1;
%     fprintf('%s %s %i',playerNames(1-(player-1)/2),s,thisMove)
%     fprintf(' * LOSE\n')
%     disp(['round ',num2str(round),' = ',num2str(score),'*'])
    return;
else
    
    openSpaces = FindZeros_Key(tttBoard(1:end));
    spacesLeft = length(openSpaces);
    if spacesLeft == 0
        score = 0;
%         fprintf('      %s %i',s,thisMove)
%         fprintf('%s %s %i',playerNames(1-(player-1)/2),s,thisMove)
%         fprintf(' * TIE\n')
%         disp(['round ',num2str(round),' = ',num2str(score),'*'])
        return;
    end
%     fprintf('%s %s %i\n',playerNames(1-(player-1)/2),s,thisMove)
    scores = nan(1,spacesLeft);
    i=1;
    if spacesLeft > 0
        while round <= 9 && length(find(~isnan(scores))) < spacesLeft
            %         moves(round) = openSpaces(i);
            %         i=i+1;
            nextMove = openSpaces(i);
            %         tttBoard(nextMove) = -player;
            %         DisplayBoard(tttBoard);
            score = TTT_MoveScore(tttBoard,-player,round+1,nextMove,firstplayer);
            scores(i) = score;
            %         moves(round) = openSpaces(i);
            tttBoard(nextMove) = 0;
%             DisplayBoard(tttBoard);
            %         scores(i) = 0;
            i=i+1;
        end
        % else
        %     scores(thisMove) = TTT_WinnerCheck(tttBoard);
        %     if player == 1
        %         score = max(scores);
        %     else
        %         score = min(scores);
        %     end
    end
    
    if firstplayer*player == 1
        score = min(scores);
%         fprintf('%s %s max(%s) = %i \n',playerNames(1-(player-1)/2),s,num2str(scores),score)
%         disp(['round ',num2str(round),' = ',num2str(score)])
    else
        score = max(scores);
%         fprintf('%s %s min(%s) = %i \n',playerNames(1-(player-1)/2),s,num2str(scores),score)
%         disp(['round ',num2str(round),' = ',num2str(score)])
    end
    
end