function move_to = TTT_ai_move_3_egbo(game_state,player)
    N = numel(game_state);    
    for i = 1:N
        player_status = TTT_detect_winning_move_egbo(game_state);
        if player == 1
            if game_state(1) == 0
                move_to = 1;
            elseif player_status(1) ~= 0 
                move_to = player_status(1);
            elseif player_status(2) ~= 0 
                move_to = player_status(2);
            elseif game_state(3) == 0
                move_to = 3;
            elseif game_state(7) == 0
                move_to = 7;
            elseif game_state(9) == 0
                move_to = 9;
            else                
                move_to = TTT44_ai_move_1_egbo(game_state);
            end
        else
             if game_state(1) == 0
                move_to = 1;
            elseif player_status(2) ~= 0 
                move_to = player_status(2);
            elseif player_status(1) ~= 0 
                move_to = player_status(1);
            elseif game_state(3) == 0
                move_to = 3;
            elseif game_state(7) == 0
                move_to = 7;
            elseif game_state(9) == 0
                move_to = 9;
            else                
                move_to = TTT44_ai_move_1_egbo(game_state);
            end
        end
    end     
end

function move_to = TTT44_ai_move_1_egbo(game_state)

locations = TTT42_get_open_spaces_egbo(game_state);
   m = numel(locations);
if locations > 0
    n = randi(m);
    move_to = locations(n);
else
    move_to = [];
end   
        
end
function locations = TTT42_get_open_spaces_egbo(game_state)
    locations = 0;
    N = numel(game_state);    
    for i = 1:N
        locations = P22_locate_zeros_egbo(game_state);        
    end
end
function locations = P22_locate_zeros_egbo(list)
N = numel(list);
j = 1;
locations = zeros(1,N);
    for i = 1:N
        val = list(i);
            if val == 0
                locations(j) = i;
                j = j + 1;
            else            
            end
            locations([j:end]) = [];
    end
end
function player_status = TTT_detect_winning_move_egbo(game_state)
player_status = [0 0];
N = numel(game_state);
new_game_state = game_state;
new_game_state1 = game_state;

for i = 1:N
    if game_state(i) == 0
        new_game_state(i) = 1;
        winner = TTT41_winner_check_egbo(new_game_state);
        new_game_state = game_state;
        
        new_game_state1(i) = -1;
        winner1 = TTT41_winner_check_egbo(new_game_state1);
        new_game_state1 = game_state;
        
        if winner == 1
            player_status(1) = i;
        elseif  winner1 == -1
            player_status(2) = i;
        end
    end
end
end
function winner = TTT41_winner_check_egbo(game_state)

values = P32_matrix_sums_egbo(game_state);
winner = 0;
i = 1;
N = numel(values);

while winner == 0 && i <= N
    val = values(i);
    if val == 3
        winner = 1;
    elseif val == -3
        winner = -1;
    end   
    i = i + 1;
end
end
function values = P32_matrix_sums_egbo(A)
    r = sum(A,2);
    c = sum(A);
    diag_sums = P31_diagonal_sums_egbo(A);
    values = [r; c'; diag_sums];
end
function diag_sums = P31_diagonal_sums_egbo(A)
    diag_sums = 0;
    diag_sums1 = 0;
    diag_sums2 = 0;
    [m,n] = size(A);
    x = 1;
    y = 1;
    x1 = m;
    y1 = 1;
    if m >= n
        t = n;
    elseif n > m
        t = m;
    end
    for i = 1:t
        val1 = A(x,y);
        x = x + 1;
        y = y + 1;
        diag_sums1 = diag_sums1 + val1;
    end
    for i2 = 1:t
        val2 = A(x1,y1);
        x1 = x1 - 1;
        y1 = y1 + 1;
        diag_sums2 = diag_sums2 + val2;
    end
    diag_sums = [diag_sums1; diag_sums2];
end
% =========================================================================
% HR: none
%
% =========================================================================
