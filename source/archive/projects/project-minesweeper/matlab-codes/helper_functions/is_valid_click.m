function result = is_valid_click(state)

    % Write this function

    x = state.last_x;
    y = state.last_y;

    % Assume valid click
    result = true;

    % in-bounds conditions
    x_in_range = x >= 1 && x <= state.n;
    y_in_range = y >= 1 && y <= state.n;

    % Invalid check 1: out of range
    if ~x_in_range || ~y_in_range
        result = false;
        return
    end

    % other conditions
    revealed = state.revealed(x, y);
    flagged = state.flags(x, y);

    % Invalid check 2: already revealed
    if revealed
        result = false;
    end

    % Invalid check 3: left click on a flag
    if state.left_click && flagged
        result = false;
    end

end