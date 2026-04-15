Map = readtable('US_State_Boundary_Coordinates.csv');
L=length(Map.State);
State = 'Nevada';
StateLat = Map.Latitude(strcmp(Map.State,State));
StateLong = Map.Longitude(strcmp(Map.State,State));
LL = length(StateLat);
StateLat = StateLat(1:LL);
StateLong = StateLong(1:LL);

plot(StateLong,StateLat)
shit='bag';