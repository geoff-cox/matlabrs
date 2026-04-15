function move_to = TTT_ai_move_v1(game_state,~)
    open_spaces = TTT_get_open_spaces_Key(game_state);
    num_open_spaces = length(open_spaces);
    randomIndex = randi(num_open_spaces);
    move_to = open_spaces(randomIndex);
end
function locations = TTT_get_open_spaces_Key(game_state)
    n = numel(game_state);
    locations = zeros(1,n);
    j = 1;
    for k = 1:n
        if game_state(k) == 0
            locations(j) = k;
            j = j+1;
        end
    end
    locations(j:end) = [];
end
