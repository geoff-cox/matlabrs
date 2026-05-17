function move_to = TTT_ai_move_3_Mas(game_state,player)

move_to = TTT44_ai_move_1_Mas(game_state);
player_status = TTT_detect_winning_move_Mas(game_state);

if player == 1
    if player_status(1) ~= 0
        game_state(player_status(1)) == 1;
    elseif player_status(2) ~= 0
        game_state(player_status(2)) == 1;
    elseif player_status == [0 0];
        game_state = move_to;
    end

end
if player == -1
    if player_status(2) ~= 0
        game_state(player_status(2)) == -1;
    elseif player_status(1) ~= 0
        game_state(player_status(1)) == -1;
    elseif player_status == [0 0];
        game_state = move_to;
    end
end
end

function move_to = TTT44_ai_move_1_Mas(game_state)

move_to = [];

locations = TTT42_get_open_spaces_Mas(game_state);
x = length(locations);
if x == 0
    move_to = [];
else
    y = randi(x);
    move_to = locations(y);
end
end

function locations = TTT42_get_open_spaces_Mas(game_state)

k = 0;
locations = zeros(1,k);

for index = 1 : 9
    if game_state(index) == 0
        k = k + 1;
        locations(k) = index;
    end
end
end

function player_status = TTT_detect_winning_move_Mas(game_state)

game_state_X = game_state;
game_state_O = game_state;

player_status = [0 0];

for j = 1 : 9
    if game_state_X(j) == 0
        game_state_X(j) = 1;
        winner = TTT41_winner_check_Mas(game_state_X);
        game_state_X = game_state;
        if winner == 1
            player_status(1) = j;
        end
        if game_state_O(j) == 0
            game_state_O(j) = -1;
            winner = TTT41_winner_check_Mas(game_state_O);
            game_state_O = game_state;
            if winner == -1
                player_status(2) = j;
            end
        end
    end
end
end    


function winner = TTT41_winner_check_Mas(game_state)

diag_sums = P31_diagonal_sums_Mas(game_state);

winner = 0;

for index = 1 : 3
    a = game_state(index,:);
    b = game_state(:,index);
    c = diag_sums(1);
    d = diag_sums(2);
    if a == [1 1 1]
        winner = 1;
    elseif a == [-1 -1 -1]
        winner = -1;
    elseif b == [1 1 1]'
        winner = 1;
    elseif b == [-1 -1 -1]'
        winner = -1;
    elseif c == 3;
        winner = 1;
    elseif c == -3;
        winner = -1;
    elseif d == 3;
        winner = 1;
    elseif d == -3;
        winner = -1;
    end
end


end

function diag_sums = P31_diagonal_sums_Mas(game_state)

diag_sums = [];
diag_sums_T = 0;
diag_sums_B = 0;
s = size(game_state);
m = s(1);
n = s(2);

for i = 1 : n
    diag_sums_T = game_state(i,i) + diag_sums_T;
    diag_sums_B = game_state((m-i)+1,i)+ diag_sums_B;
    diag_sums = [diag_sums_T,diag_sums_B]';
end
end