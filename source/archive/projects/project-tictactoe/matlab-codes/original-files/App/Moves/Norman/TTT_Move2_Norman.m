%=========================================================================
% Jeremiah Norman
% 9/21/18
% Homework 5
%=========================================================================
% Help Received Statement
% none
%=========================================================================
% Psuedocode
% 
% find all zeros
% set up for loop for loop
% determine best move
% randomly select a space
% place a move there
% end
%=========================================================================

function move = TTT_Move2_Norman(gameboard,randomseed)

zero = FindZeros_Norman(gameboard);
x = length(zero);
V = SumVals_Norman(gameboard);
if nargin == 2
    rng(randomseed);
end
gb = gameboard;
for i = zero
    gb(i) = -1;
    w = TTT_WinnerCheck_Norman(gb);
    if w == 1 
        pic = i;
    else if w == -1
            pic = i;
    else 
        pic = randi(zero);
        end
    end
end
move = pic;

end