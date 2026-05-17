%ME-310-02
%Homework 5
%Carter, DC
%10/26/18
%Part 2
%------------------------------------------------------------------------
%Pseudocode
%create function
%determine if 1 or 2 inputs
%2 input case
%establish randi settings
%store gameboard as single row
%find zeros
%make move
%1 input case
%find zeros
%make move
%end switch
%display gameboard
%-------------------------------------------------------------------------

function move= TTT_Move2_Carter(gameBoard,player,randomSeed)
switch nargin;
    case 3
        rng(randomSeed);
        B=gameBoard(1:9)
        gb=SumVals_Carter(B)
if gb(1)==2
    locations=FindZeros_Carter(B([1 2 3]));
   B(locations(randi(length(locations))))=player*-1;
elseif gb(2)==2
        locations=FindZeros_Carter(B([4 5 6]));
   B(locations(randi(length(locations))))=player*-1;
elseif gb(3)==2
        locations=FindZeros_Carter(B([7 8 9]));
   B(locations(randi(length(locations))))=player*-1;
elseif gb(4)==2
        locations=FindZeros_Carter(B([1 4 7]));
   B(locations(randi(length(locations))))=player*-1;
elseif gb(5)==2
    locations=FindZeros_Carter(B([2 5 8]));
   B(locations(randi(length(locations))))=player*-1;
elseif gb(6)==2
        locations=FindZeros_Carter(B([3 6 10]));
   B(locations(randi(length(locations))))=player*-1;
elseif gb(7)==2
        locations=findZeros_Carter(B([1 5 9]));
   B(locations(randi(length(locations))))=player*-1;
else
   locations=FindZeros_Carter(B);
        B(locations(randi(length(locations))))=1;
end
    case 2
        B=gameBoard(1:9)
        gb=SumVals_Carter(B).'
if gb(1)==2
    locations=FindZeros_Carter(B(1:3));
   B(locations(randi(length(locations))))=player*-1;
elseif gb(2)==2
        locations=FindZeros_Carter(B(4:6));
   B(locations(randi(length(locations))))=player*-1;
elseif gb(3)==2
        locations=FindZeros_Carter(B(7:9));
   B(locations(randi(length(locations))))=player*-1;
elseif gb(4)==2
        locations=FindZeros_Carter(B([1 4 7]));
   B(locations(randi(length(locations))))=player*-1;
elseif gb(5)==2
    locations=FindZeros_Carter(B([2 5 8]));
   B(locations(randi(length(locations))))=player*-1;
elseif gb(6)==2
        locations=FindZeros_Carter(B([3 6 9]));
   B(locations(randi(length(locations))))=player*-1;
elseif gb(7)==2
        locations=FindZeros_Carter(B([1 5 9]));
   B(locations(randi(length(locations))))=player*-1;
else
   locations=FindZeros_Carter(B);
        B(locations(randi(length(locations))))=1;
end

end
move=B([1:3;4:6;7:9]);
end