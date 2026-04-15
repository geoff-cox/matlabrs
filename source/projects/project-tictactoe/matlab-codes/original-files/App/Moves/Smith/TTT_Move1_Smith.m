%David Smith
%10/8/18
%MA310 HW4 Problem 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Help Received: See Help Received on Comand Problems code. 

%For this code:Altered and used my FindZeros code.Used MATLAB help to look
%up nargin,randi, and random number generator (rng) to learn how they 
%work and to determine the correct syntax to make them work in my code. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pseudocode
%1. Begin the function and allow for any inputs.
%2. Use nargin to allow for two paths to be followed depending on whether a
%seed in input for the random number generator.
%3. If the seed is input then it should be used as well as randi to
%determine an integer no larger than the length of the indices matrix.
%4. If the random seed is not input then just randi should be used to
%choose the integer.
%5. Once an integer is chosen, it is used as the index to dtermine which
%value from the indices matrix should be chosen.
%6. The FindZeros function is used in both paths to determine the values in
%the indices matrix based on whether they are a zero or not.
%7. End all loops and functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function move=TTT_Move1_Smith(gameBoard,randomSeed)
switch nargin
    case 2
        a=rng(randomSeed);
        locations=FindZeros_Smith(gameBoard);
        c=length(locations);
        d=randi(c);
        move=locations(d);
    case 1
        locations=FindZeros_Smith(gameBoard);
        c=length(locations);
        d=randi(c);
        move=locations(d);
end
end

    
