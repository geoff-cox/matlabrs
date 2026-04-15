function state = set_initial_game_state(grid_size, difficulty)

    % Set fontsizes
    state.fontsizes = struct( ...
        'text', 30, ...
        'jerk', 18, ...
        'flag', 26, ...
        'menu', 14 ...
        );

    % Set icons that will be displayed on the interface
    state.icons = struct( ...
        'jerk', char([55357 56441 55357 56725]), ...
        'flag', '🎯', ...
        'reset', '🔁', ...
        'new', '🆕' ...
        );

    % Set colors for the various parts
    state.colors = struct( ...
        'space', [0.3 0.7 0.4], ...
        'text', 'blue', ...
        'jerk', [0.7 0.1 0.1], ...
        'flag', 'black', ...
        'menu', 'black' ...
        );

    % Game Board Scaling Factor
    state.scaling = 52;

    % Set the percent of the jerks present based on difficulty
    switch difficulty
        case 'easy'
            percent_jerks = 0.8;
        case 'normal'
            percent_jerks = 0.13;
        case 'hard'
            percent_jerks = 0.18;
    end

    % Set the other values
    %   n = number of grids per side
    %   j = number of jerks
    state.difficulty = difficulty;
    state.n = grid_size;
    state.j = round(percent_jerks*(state.n^2));
    state.game_over = false;
    state.player_won = false;
    state.flags = false(state.n);
    state.jerks = false(state.n);
    state.revealed = false(state.n);
    state.data = zeros(grid_size);
    state.last_x = 0;
    state.last_y = 0;
    state.left_click = true;

    % Randomly place the jerks on the board
    state = random_jerk_generator(state);

    % Add the jerk counts to the data matrix.
    state = compute_data_matrix(state);

end