function StartingValueWins = analyzeXWins
xW=load('data_TTT_XWins');
xL=load('data_TTT_OWins');
tI=load('data_TTT_Ties');
[M,N]=size(xW.xw);
StartingValueWins = zeros(1,N);
for i=1:M
    StartingValueWins(xW.xw(i,1))=StartingValueWins(xW.xw(i,1))+1;
end

end

