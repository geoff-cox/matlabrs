function results = TicTacToeGame_Sim_02(numOfGames)
results = zeros(1,numOfGames);
runs = 1:numOfGames;
% seedy=rng;
XWins = 0;
OWins = 0;
Ties = 0;
tic
for run = runs
    %results(run) = TicTacToeGame_CvC('1','1',seedy);
    results(run) = TicTacToeGame_CvC('5','5');
    %seedy = seedy + 1;
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
title(['Ties = ',num2str(round(TiePer(end)*100,2)),' %   Seed = ']);
%plot(runs(1:step:end),TiePer(1:step:end),'-Square'); text(run+10,TiePer(end),num2str(TiePer(end)*100))
hold off;
% goodSeeds
end
