%Maxwell Stuart
% Date: 10/29/18
% Homework #6
%=========================================================================
% Help Received Statement: Class Demos
% 
%=========================================================================
% Psuedocode
%=========================================================================
function move=TTT_Move3_Stuart(gameboard,player)
t=FindZeros_Stuart(gameboard(1:end));
for k= 1:length(t)
    gameboard(k)=player
    h=TTT_WinnerCheck_Stuart(gameboard);
    if h==1
        move=1;
    elseif h==5
        move=5;
    end 
    if h==player
        move=k;
    elseif h== player*(-1)
        move=k;
    else 
        move=TTT_Move1_Stuart(gameboard);
    end 
end 
end 