function NewPopulationMatrix = GameOfLife(PopulationMatrix)
NewPopulationMatrix = PopulationMatrix;
TempPopMatrix = NewPopulationMatrix;
maxDays = 10;
days = 0;
[m,n]=size(PopulationMatrix);
population = getPopulation(PopulationMatrix);
disp(NewPopulationMatrix);
while population > 0 && days < maxDays
    for r_coord = 1:m
        for c_coord = 1:n
            alive = TempPopMatrix(r_coord,c_coord);
            NumOfNeighbors = CountNeighbors(TempPopMatrix,[r_coord,c_coord]);
            if alive
                if NumOfNeighbors < 2 || NumOfNeighbors > 3
                    alive = 0;
                end
            else
                if NumOfNeighbors == 3
                    alive = 1;
                end
            end
            NewPopulationMatrix(r_coord,c_coord) = alive;
        end
    end
    TempPopMatrix=NewPopulationMatrix;
    population = getPopulation(TempPopMatrix);
    disp(NewPopulationMatrix);
    days=days+1;
end     
end