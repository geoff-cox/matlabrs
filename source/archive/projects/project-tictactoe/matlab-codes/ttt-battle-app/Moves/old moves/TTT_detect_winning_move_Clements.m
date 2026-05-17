% =========================================================================
% This program detects if either player has an immediate winning move.
%
% INPUT:
%   game_state (3 x 3) current state of the TTT game board
% OUTPUT:
%   player_status (1 x 2) locations of winning moves for both players
% =========================================================================
function player_status = TTT_detect_winning_move_clements(game_state)
    locations = TTT42_get_open_spaces_Clements(game_state);
    l = numel(locations);
    winningspotsX = zeros(1,9);
    p = 1;
    winningspotsO = zeros(1,9);
    z = 1;
    
    
    for k = 1:l
        new_game_state = game_state;
        spot = locations(k);
        new_game_state(spot) = 1;
        winner = TTT41_winner_check_clements(new_game_state);
            if winner == 1
                winningspotsX(p) = spot;
                p = p+1;
            end
            
            
        new_game_state = game_state;
        new_game_state(spot) = -1;
        winner = TTT41_winner_check_clements(new_game_state);
            if winner == -1
                winningspotsO(z) = spot;
                z = z+1;
            end
        
    end
winningspotsX(p:end) = [];
winningspotsO(z:end) = [];
        if p == 1
                winningspotsX = 0;
        end
        if z == 1
            winningspotsO = 0;
        end

[winningspotsX,~] = P24_list_min_clements(winningspotsX);
[winningspotsO,~] = P24_list_min_clements(winningspotsO);


player_status = [winningspotsX, winningspotsO];

end


function [min_value,min_loc] = P24_list_min_clements(list)

    P = numel(list);

    
    j = 1;
    u = 1;
    k = 1;
    if P==1 
       min_value = list; 
       min_loc = 1;
    end   
    while u<=P-1
        what = list(k) <= list(k+j);
        if what == 1
            min_value = list(k);
            
            j = j+1;
            
        else
            min_value = list(k+j);
            k = k+j;
            j =1;
        
        end
        u = u+1;
    end
     min_loc = k;
     
    
end
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
% =========================================================================
% HR: none
%
% =========================================================================