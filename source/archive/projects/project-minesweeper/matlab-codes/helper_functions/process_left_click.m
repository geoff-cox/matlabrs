function state = process_left_click(state)

    x = state.last_x;
    y = state.last_y;

    % Write this function
    reveal_list = get_spaces_to_reveal(x, y, state);
    for k = 1:height(reveal_list)

        x = reveal_list(k, 1);
        y = reveal_list(k, 2);
        state.spaces(x, y).space.FaceColor = 'none';
        state.revealed(x, y) = true;

    end

end
