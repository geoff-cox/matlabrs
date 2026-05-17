function state = process_right_click(state)

    x = state.last_x;
    y = state.last_y;

    % Write this function
    if state.flags(x, y)

        state.flags(x, y) = false;
        state.spaces(x, y).flag_display.Visible = false;
        state.flags(x, y) = false;

    else

        state.flags(x, y) = true;
        state.spaces(x, y).flag_display.Visible = true;
        state.flags(x, y) = true;

    end

end