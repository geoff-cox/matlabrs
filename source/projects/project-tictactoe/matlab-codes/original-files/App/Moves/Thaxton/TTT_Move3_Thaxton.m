%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cadet Barry Thaxton Jr. 
% MA310-02
% HW6
% DUE: November 09, 2018
% HR: I used the corrections given on my previous assignment TTT_Move1_Thaxton.m file and the code from my TTT_Move2_Thaxton.m file. 
%
% PROGRAM NAME:  TTT_Move3_Thaxton.m
% Psuedocode:
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function move = TTT_Move3_Thaxton(gameBoard,player)
A = FindZeros_Thaxton(gameBoard(1:9));
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
    


