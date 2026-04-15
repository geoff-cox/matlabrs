Map = readtable('US_State_Boundary_Coordinates.csv');
Airports = readtable('Airport_Codes_mapped_to_Latitude_Longitude_in_the_United_States.csv');
A=length(Airports.Latitude);
M=length(Map.State);
n=1;
S=6;
scrambled_indices = randperm(A,S);
% for i=1:length(scrambled_indices)
    
while n <= M
    State = Map.State{n};
    StateLat = Map.Latitude(strcmp(Map.State,State));
    StateLong = Map.Longitude(strcmp(Map.State,State));
    LL = length(StateLat);
    StateLat = StateLat(1:LL);
    StateLong = StateLong(1:LL);
    axis('image')
    plot(StateLong,StateLat)
    hold on
    while strcmp(State,Map.State{n})
        n=n+1;
        if n > M
            break
        end
    end
end
AirLat = Airports.Latitude(scrambled_indices);
AirLon = Airports.Longitude(scrambled_indices);
plot(AirLon,AirLat,'x')
plot(AirLon(1),AirLat(1),'o')
hold off