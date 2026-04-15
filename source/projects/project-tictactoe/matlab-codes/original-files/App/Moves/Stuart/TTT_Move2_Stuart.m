%Maxwell Stuart
% Date: 10/15/18
% Homework #5
%=========================================================================
% Help Received Statement: Class Demos
% 
%=========================================================================
% Psuedocode
%set variable  to find zeros
%if statement for nargin and randomSeed 
%make for loop for the length of the variable
%set gameboard with loop equal to player
%winner Check function
%if statent for wining move
%elseif statment for blocking move
%esle statment for random move
%end loops and functions
%=========================================================================
function move=TTT_Move2_Stuart(gameboard,player,randomSeed)
t=FindZeros_Stuart(gameboard(1:end));
if nargin==2
  rng(randomSeed);
end 
for k= 1:length(t)
    gameboard(k)=player
    h=TTT_WinnerCheck_Stuart(gameboard);
    if h==player
        move=k;
    elseif h== player*(-1)
        move=k;
    else 
        move=TTT_Move1_Stuart(gameboard);
    end 
end 

end 
