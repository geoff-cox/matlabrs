function results = TicTacToeGame_Sim_Deeper(numOfGames)
results = zeros(1,numOfGames);
runs = 1:numOfGames;
seedy=1;
rng(seedy);
seeds=randi(numOfGames,1,numOfGames);
XWins = 0;
OWins = 0;
Ties = 0;
countBoard{1} = zeros(1,9);
countBoard{2} = zeros(1,9);
countBoard{3} = zeros(1,9);
countBoard{4} = zeros(1,9);
countBoard{5} = zeros(1,9);
countBoard{6} = zeros(1,9);
countBoard{7} = zeros(1,9);
countBoard{8} = zeros(1,9);
countBoard{9} = zeros(1,9);
% countBoard{2} = zeros(1,9);
% countBoard{3} = zeros(1,9);
playerNames = ['X','O'];
tic
l=1;
for run = runs
%     results(run) = TicTacToeGame_CvC('1','1',seedy);
%     [results(run),moveSeqn] = TicTacToeGame_CvC_Deeper('3','2',seeds(run),seedy);
    [results(run),moveSeqn] = TicTacToeGame_CvC_Deeper('3','2',90,26);
%     [results(run),moveSeqn] = TicTacToeGame_CvC_Deeper('3','2',seeds(run));
%     [results(run),moveSeqn] = TicTacToeGame_CvC_Deeper('3','2');
    if results(run) == 1
        XWins = XWins + 1;
%         fprintf('X Win Move Sequence = %i %i %i %i %i %i %i %i %i \n',moveSeqn)
%         for c=1:9
%             if moveSeqn(c) == 0
%                 break
%             end
%             countBoard{c}(moveSeqn(c)) = countBoard{c}(moveSeqn(c)) + 1;
%         end
%         countBoard{1}(moveSeqn(1)) = countBoard{1}(moveSeqn(1)) + 1;
%         countBoard{2}(moveSeqn(2)) = countBoard{2}(moveSeqn(2)) + 1;
%         countBoard{3}(moveSeqn(3)) = countBoard{3}(moveSeqn(3)) + 1;
    elseif results(run) == -1
        OWins = OWins + 1;
        for c=1:9
            if moveSeqn(c) == 0
                break
            end
            countBoard{c}(moveSeqn(c)) = countBoard{c}(moveSeqn(c)) + 1;
            lSeeds(1,l)=seeds(run);
            lSeeds(2,l)=seedy;
            l=l+1;
        end
%         fprintf('O Win Move Sequence = %i %i %i %i %i %i %i %i %i \n',moveSeqn)
    else
        Ties = Ties + 1;
    end
    XWinningPer(run)=XWins/run;
    OWinningPer(run)=OWins/run;
    TiePer(run)=Ties/run;
    seedy = seedy + 1;
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
% fprintf('\nX Win 1st Move =  %0.1f  %0.1f  %0.1f  %0.1f  %0.1f  %0.1f  %0.1f  %0.1f  %0.1f \n',(countBoard/XWins)*100)
for c=1:9
    fprintf('\n\n%s Move =  %4.1f | %4.1f | %4.1f  \n',playerNames(mod(c+1,2)+1),(countBoard{c}([1 4 7])/OWins)*100)
    fprintf('         --------------------- \n')
    fprintf('          %4.1f | %4.1f | %4.1f  \n',(countBoard{c}([2 5 8])/OWins)*100)
    fprintf('         --------------------- \n')
    fprintf('          %4.1f | %4.1f | %4.1f  \n\n',(countBoard{c}([3 6 9])/OWins)*100)
end
% fprintf('\n\nX Win 1st Move =  %4.1f | %4.1f | %4.1f  \n',(countBoard{1}([1 4 7])/XWins)*100)
% fprintf('                ---------------------- \n')
% fprintf('                  %4.1f | %4.1f | %4.1f  \n',(countBoard{1}([2 5 8])/XWins)*100)
% fprintf('                ---------------------- \n')
% fprintf('                  %4.1f | %4.1f | %4.1f  \n\n',(countBoard{1}([3 6 9])/XWins)*100)
% 
% fprintf('\n\nO Los 1st Move =  %4.1f | %4.1f | %4.1f  \n',(countBoard{2}([1 4 7])/XWins)*100)
% fprintf('                ---------------------- \n')
% fprintf('                  %4.1f | %4.1f | %4.1f  \n',(countBoard{2}([2 5 8])/XWins)*100)
% fprintf('                ---------------------- \n')
% fprintf('                  %4.1f | %4.1f | %4.1f  \n\n',(countBoard{2}([3 6 9])/XWins)*100)
% 
% fprintf('\n\nX Win 2nd Move =  %4.1f | %4.1f | %4.1f  \n',(countBoard{3}([1 4 7])/XWins)*100)
% fprintf('                ---------------------- \n')
% fprintf('                  %4.1f | %4.1f | %4.1f  \n',(countBoard{3}([2 5 8])/XWins)*100)
% fprintf('                ---------------------- \n')
% fprintf('                  %4.1f | %4.1f | %4.1f  \n\n',(countBoard{3}([3 6 9])/XWins)*100)
% [countBoard(1:3)' countBoard(4:6)' countBoard(7:9)']
% sum(round((countBoard/XWins)*100,4))
fprintf('seed 1 = %4.1f | seed 2 = %4.1f  \n\n',lSeeds(:,1))
end
