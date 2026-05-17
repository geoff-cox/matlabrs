%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cadet Barry Thaxton Jr. 
% MA310-02
% HW5
% DUE: October 26, 2018
% HR: I used the corrections given on my previous assignment TTT_Move1_Thaxton.m file. 
%
% PROGRAM NAME:  TTT_Move2_Thaxton.m
% Psuedocode:
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function move = TTT_Move2_Thaxton(gameBoard,player,randomSeed)
A = FindZeros_Thaxton(gameBoard(1:9));
if nargin == 3
    if player == -1
        for i=1:length(A)
        original = gameBoard;
        if original(A(i)) == -1 && TTT_WinnerCheck_Thaxton(original) == -1
            move = A(i);
            break
        elseif original(A(i)) == 1 && TTT_WinnerCheck_Thaxton(original) == 1
            move = A(i);
            break
        else
            move = TTT_Move1_Thaxton(gameBoard,randomSeed);
            break
        end
        end
    else
        for i=1:length(A)
        original = gameBoard;
        if original(A(i)) == 1 && TTT_WinnerCheck_Thaxton(original) == 1
            move = A(i);
            break
        elseif original(A(i)) == -1 && TTT_WinnerCheck_Thaxton(original) == -1
            move = A(i);
            break
        else
            move = TTT_Move1_Thaxton(gameBoard,randomSeed);
            break
        end
        end
    end
else
     if player == -1
        for i=1:length(A)
        original = gameBoard;
        if original(A(i)) == -1 && TTT_WinnerCheck_Thaxton(original) == -1
            move = A(i);
            break
        elseif original(A(i)) == 1 && TTT_WinnerCheck_Thaxton(original) == 1
            move = A(i);
            break
        else
            move = TTT_Move1_Thaxton(gameBoard);
            break
        end
        end
    else
        for i=1:length(A)
        original = gameBoard;
        if original(A(i)) == 1 && TTT_WinnerCheck_Thaxton(original) == 1
            move = A(i);
            break
        elseif original(A(i)) == -1 && TTT_WinnerCheck_Thaxton(original) == -1
            move = A(i);
            break
        else
            move = TTT_Move1_Thaxton(gameBoard);
            break
        end
        end
    end
end
    
end

