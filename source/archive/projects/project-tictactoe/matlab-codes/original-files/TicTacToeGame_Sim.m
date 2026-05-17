function results = TicTacToeGame_Sim(numOfGames)
results = zeros(1,numOfGames);
runs = 1:numOfGames;
seedy1=82;
seedy2=245;
XWins = 0;
OWins = 0;
Ties = 0;
tic
for run = runs
%     fprintf('Game = %i, Seeds = %i, %i: \n', run,seedy1,seedy2)
%     results(run) = TicTacToeGame_CvC('3','1',seedy1,seedy2);
    results(run) = TicTacToeGame_CvC('3','2');
%     seedy1 = seedy1 + 1;
%     seedy2 = seedy2 + 3;
    if results(run) == 1
        XWins = XWins + 1;
    elseif results(run) == -1
        OWins = OWins + 1;
    else
        Ties = Ties + 1;
    end
    XWinningPer(run)=XWins/run;
    OWinningPer(run)=OWins/run;
    TiePer(run)=Ties/run;
end
toc
hold on;
step = ceil(numOfGames/100);
textOffSet = step;
if step < 50
    textOffSet = step/10;
end
plot(runs(step:step:end),XWinningPer(step:step:end),'-o'); text(run+textOffSet,XWinningPer(end),[num2str(round(XWinningPer(end)*100,2)),'%']);
plot(runs(step:step:end),OWinningPer(step:step:end),'-x'); text(run+textOffSet,OWinningPer(end),[num2str(round(OWinningPer(end)*100,2)),'%']);
title(['Ties = ',num2str(round(TiePer(end)*100,2)),' % ']);
%plot(runs(1:step:end),TiePer(1:step:end),'-Square'); text(run+10,TiePer(end),num2str(TiePer(end)*100))
hold off;
% goodSeeds
end
