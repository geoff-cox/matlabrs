function neighborCount = CountNeighbors(PopulationMatrix,RCPair)
[m,n]=size(PopulationMatrix);
TempMatrix = [PopulationMatrix(m,:);PopulationMatrix;PopulationMatrix(1,:)];
TempMatrix = [TempMatrix(:,n) TempMatrix TempMatrix(:,1)];

r=RCPair(1)+1;
c=RCPair(2)+1;
TempMatrix(r,c) = 0;

neighborCount = sum(sum(TempMatrix(r-1:r+1,c-1:c+1)));

end

