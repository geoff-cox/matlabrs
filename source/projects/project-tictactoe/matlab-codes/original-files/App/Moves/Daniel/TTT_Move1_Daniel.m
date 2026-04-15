%=========================================================================
% John Daniel
% 11 October 2018 
% Homework 04
%=========================================================================
% Help Received Statement: Col. Cox, Barry Thaxton, Dolan Walsh 
% 
%=========================================================================
% Psuedocode
% if there is a randomSeed, nargin is 2
% use command problems c6-c9 in the above if statement 
% and specify rng(randomSeed)
%
% else 
% don't use rng
%
% end end
%=========================================================================
function move = TTT_Move1_Daniel(gameBoard,randomSeed)

    if nargin == 2
        locations = FindZeros_Daniel(gameBoard);
        balls = length(locations);
        rng(randomSeed)
        c8 = randi(balls);
        move = locations(c8);
    else 
        locations = FindZeros_Daniel(gameBoard);
        balls = length(locations);
        c8 = randi(balls);
        move = locations(c8);
    end


end


