% =========================================================================
% This program returns the winner of the current Tic-Tac-Toe game board
% matrix, if one exists. 
% INPUT:
%   game_state (3 x 3) current state of the TTT game board
% OUTPUT:
%   winner =  1 if X won, 
%          = -1 if O won, 
%          =  0 if the current game board has no winner 
% =========================================================================
function winner = TTT41_winner_check_clements(game_state)
   values = P32_matrix_sums_clements(game_state);
   s = size(values);
   row = s(1);
   for k = 1:row
       if values(k) == -3
           winner = -1;
            break
       
       elseif values(k) == 3
           
           winner = 1;
           break
       else
           winner = 0;
       end
   end
       
   
   
end
function values = P32_matrix_sums_clements(A)

dim = size(A);
rows = dim(1);
col = dim(2);
values = zeros(rows+col+2,1);
valuesrows = 0;
valuescol = 0;
u = 1;

while u<=rows
    for k = 1:col
        valuesrows = valuesrows + A(u,k);
        values(u) = valuesrows;
    end
    u = u+1;
    valuesrows = 0;
       
end
p =1;
while p <=col
    for k = 1:rows
        valuescol = valuescol + A(k,p);
        values(u) = valuescol;
    end
    u = u+1;
    p = p+1;
    valuescol = 0;
end

val = P31_diagonal_sums_clements(A);
values(end) = val(2);
values(end-1) = val(1);


        




end
function [diag_sums] = P31_diagonal_sums_clements(A)
    diag_sum = 0;
    antidiag_sum = 0;

    dim = size(A);
    
    rows = dim(1);
    
    col = dim(2);  
    
    if rows == col
        for k = 0:rows-1
            
        diag_sum = diag_sum + A(k+1,k+1);
        antidiag_sum = antidiag_sum + A(rows-k,k+1);
        end
        
    elseif rows > col
        for k = 0:col-1
            
        diag_sum = diag_sum + A(k+1,k+1);
        antidiag_sum = antidiag_sum + A(rows-k,k+1);
        end
        
    else
        for k = 0:rows-1
            
        diag_sum = diag_sum + A(k+1,k+1);
        antidiag_sum = antidiag_sum + A(rows-k,k+1);
        end
    end
    diag_sums = [diag_sum,antidiag_sum];
end

%
% =========================================================================
% HR: none
%
% =========================================================================
