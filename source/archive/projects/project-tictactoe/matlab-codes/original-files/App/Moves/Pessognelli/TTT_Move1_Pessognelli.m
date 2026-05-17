%=========================================================================
% Full Name: Sara Pessognelli
% Date: 05 OCT 2018
% Homework #4
%=========================================================================
% Help Received Statement
% none
%=========================================================================
% Psuedocode
% step 01: switch nargin
% step 02: case 2
            %rng (randomSeed)  to set the seed
            %intialize gameBoardVec
            %use a for loop to make an absolute index vector of gameBoard
            %called gameBoardVec
            %end loop
% step 03: use FindZeros to make a vector of possible move indices for the
            % called cpuMoves
% step 04: find the number of possible moves for the computer
            % (numPosMovesCPU)
% step 05: select a move for the cpu using randi and numPosMovesCPU (cpuLoc
% step 06: change the gameBoard index at cpuLoc to cpuMoves(cpuLoc)
            % (randomly selected move of the possible moves for the cpu)
% step 07: case 1
% step 08: repeat everything above WITHOUT rng(randomSeed)
% step 09: DisplayBoard(gameBoard) to show the gameBoard after the cpu
% moves
%=========================================================================
function move = TTT_Move1_Pessognelli(gameBoard, randomSeed)

switch nargin
    case 2
        rng(randomSeed);
        gameBoardVec = [];
            for i = 1:1:9
            gameBoardVec = [gameBoardVec, gameBoard(i)];
            end
        cpuMoves = FindZeros_Pessognelli(gameBoardVec);
        numPosMovesCPU = length(cpuMoves);
        cpuLoc = randi([1,numPosMovesCPU],1,1);
        move = cpuMoves(cpuLoc);
        gameBoard(cpuMoves(cpuLoc)) = -1;
       
        
    case 1
        gameBoardVec = [];
            for i = 1:1:9
            gameBoardVec = [gameBoardVec, gameBoard(i)];
            end
        cpuMoves = FindZeros_Pessognelli(gameBoardVec);
        numPosMovesCPU = length(cpuMoves);
        cpuLoc = randi([1,numPosMovesCPU],1,1);
        move = cpuMoves(cpuLoc);
        gameBoard(cpuMoves(cpuLoc)) = -1;
        
end

end
