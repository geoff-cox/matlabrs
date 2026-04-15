function state = game_over_check(state)

    % Write this function

    x = state.last_x;
    y = state.last_y;

    win_condition_a = isequal(state.jerks, state.flags);
    win_condition_b = isequal(state.revealed + state.flags, true(state.n));
    lose_condition = ...
        state.jerks(x, y) && ~state.flags(x, y) && state.left_click;

    if win_condition_a && win_condition_b

        state.player_won = true;
        state.game_over = true;

    elseif lose_condition

        state.game_over = true;

    end

end