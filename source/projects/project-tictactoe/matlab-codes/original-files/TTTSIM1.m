function [XWins,OWins,Ties]=TTTSIM1
gameSequences = perms(1:9);
numOfGames = length(gameSequences);
XWins(1,:) = zeros(1,9); OWins(1,:) = zeros(1,9); Ties(1,:) = zeros(1,9);
x=1;o=1;t=1;
for game=1:numOfGames
    gameBoard = zeros(3,3);
    player=1;
    for i=1:9
        gameBoard(gameSequences(game,i))=player;
        outcome = TTT_WinnerCheck(gameBoard);
        if outcome ~=0
            break
        end
        player=-player;
    end
    if outcome == 1
        XWins(x,:) = zeros(1,9);
        XWins(x,:) = gameSequences(game,:);
        x=x+1;
    elseif outcome == -1
        OWins(o,:) = zeros(1,9);
        OWins(o,:) = gameSequences(game,:);
        o=o+1;
    else
        Ties(t,:) = zeros(1,9);
        Ties(t,:) = gameSequences(game,:);
        t=t+1;    
    end
end
end

