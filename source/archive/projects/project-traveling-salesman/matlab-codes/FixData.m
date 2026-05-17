Map = readtable('Book1.csv');
L=length(Map.Alaska);
state = 'Alaska';
j=1;
for i=1:L
    if isempty(Map.Alaska{i})
        continue;
    elseif isletter(Map.Alaska{i}(1))
        state = Map.Alaska{i};
    else
        latiCoord{j} = Map.Alaska{i};
        longCoord{j} = Map.x_ff0000{i};
        curState{j} = state;
        j=j+1;
    end
end
Vars={'State','Latitude','Longitude'};
T=table(curState',latiCoord',longCoord','VariableNames',Vars);
writetable(T,'US_State_Boundary_Coordinates.csv')
shit=1;