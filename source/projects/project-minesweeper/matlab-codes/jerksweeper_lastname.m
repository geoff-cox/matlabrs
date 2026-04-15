%==========================================================================
% FINAL PROJECT
%==========================================================================
% NAME: 
%
% HR:
% 
%--------------------------------------------------------------------------
%-------------------------- Game Entry Point ------------------------------

function jerksweeper_lastname(grid_size, difficulty)

    % Clean up
    clear state; close all;

    % Get user options if grid_size & difficulty 
    % were not provided as inputs
    if nargin < 2
    
        % Get the grid_size and difficulty from the player
        grid_size = questdlg( ...
            'Select the size of the game grid', ...
	        'Grid Size Selection', ...
	        '5', '10', '15', '10');
    
        difficulty = questdlg( ...
            'Select the difficulty', ...
	        'Difficulty Selection', ...
	        'easy', 'normal', 'hard', 'normal');

        % Convert the grid_size into a number using str2double
        grid_size = str2double(grid_size);
    
    end
    
    % Set initial game state structure
    state = set_initial_game_state(grid_size, difficulty);
    
    % Display the game interface
    state = display_initial_board(state);
    
    % Play the Game and time it
    tic
    state = game_loop(state);
    time = round(toc, 2);
    
    % Send a message back to the player
    display_results(state, time)

end

%----------------------------- End of Game --------------------------------
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%--------------------------- Helper Functions -----------------------------

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

% Program 1
function state = random_jerk_generator(state)
    
    % Write this function
    state = state;

end

% Program 2
function state = compute_data_matrix(state)

    % Write this function
    state = state;

end

function state = display_initial_board(state)

    % For readability abrreviate the user options
    N = state.n;
    D = state.difficulty;

    % Set the game figure properties
    fig = figure;
    fig.Position = [1,1,N,N+2]*state.scaling;
    fig.ToolBar = 'none';
    fig.MenuBar = 'none';

    % Set the game axis (grid) properties
    ax = axes;
    title(ax, ['Jerksweeper (' D ')'], 'FontSize', 18)
    axis square

    % Set the x and y axis properties
    ax.XAxis.Color = 'none';
    ax.XAxis.Limits = [1 N+1];
    ax.YAxis.Color = 'none';
    ax.YAxis.Limits = [1 N+1];

    % Save the figure and axes in the game state (we will need them later)
    state.fig = fig;
    state.ax = ax;

    % Set up the grid details
    for r = 1:N
        for c = 1:N

            % Plot numbers as text
            if state.data(r,c) > 0

                text(r + 0.5, c + 0.5, num2str(state.data(r,c)), ...
                    'FontSize', state.fontsizes.text, ...
                    'HorizontalAlignment', 'center', ...
                    'FontWeight', 'bold', ...
                    'Color', state.colors.text);

            % Plot jerks as text
            elseif state.data(r,c) == -1

                text(r + 0.5, c + 0.5, state.icons.jerk, ...
                    'FontSize', state.fontsizes.jerk, ...
                    'HorizontalAlignment', 'center', ...
                    'Color', state.colors.jerk ...
                    );
            end    

            % Plot covers for the spaces as rectangles
            state.spaces(r,c).space = rectangle( ...
                'Position', [r c 0.95 0.95], ...
                'FaceColor', state.colors.space, ...
                'EdgeColor', [0.5 0.5 0.5], ...
                'Curvature', 0.2, ...
                'AlignVertexCenters', 'on' ...
                );

            % Plot invisible flags as text
            % These will be set to visible as the player marks them
            state.spaces(r,c).flag_display = ...
                text(r + 0.5, c + 0.5, state.icons.flag, ...
                'FontSize', state.fontsizes.flag, ...
                'HorizontalAlignment', 'center', ...
                'Color', state.colors.flag, ...
                'Visible', 'off');

        end
    end

    % Reset Button. If the text is pressed, this jerksweeper 
    % function is called with the same user options 
    text(1, 1, state.icons.reset, ...
        'FontSize', state.fontsizes.menu, ...
        'VerticalAlignment' ,'top', ...
        'ButtonDownFcn', @(~,~) jerksweeper(N,D) ...
        )

    % New Game Button. If the text is pressed, this jerksweeper 
    % function is called and new user options are requested
    text(1.6, 1, state.icons.new, ...
        'FontSize', state.fontsizes.menu, ...
        'VerticalAlignment' ,'top', ...
        'ButtonDownFcn', @(~,~) jerksweeper ...
        )

end

% Program 3
function result = is_valid_click(state)

    % Write this function
    result = false;

end

% Program 4
function neighbors = get_neighbors(x, y, N)

    % Write this function
    neighbors = [];

end

% Program 5
function reveal_list = get_spaces_to_reveal(x, y, state)

    % Write this function
    reveal_list = [];

end

% Program 6
function state = process_left_click(state)

    % Write this function
    state = state;

end

% Program 7
function state = process_right_click(state)

    % Write this function
    state = state;

end

% Program 8
function state = game_over_check(state)

    % Write this function
    state = state;

end

function state = game_loop(state)

    while ~state.game_over

        user_press = waitforbuttonpress;

        % Make sure mouse was clicked
        if user_press == 0

            % Get floored click location
            click_location = floor(state.ax.CurrentPoint(1,1:2));
            state.last_x = floor(click_location(1));
            state.last_y = floor(click_location(2));

            % Determine if the click was a left or right mouse-click
            switch state.fig.SelectionType
                case 'normal'
                    state.left_click = true;
                case 'alt'
                    state.left_click = false;
            end

            % Process valid left and right clicks
            if is_valid_click(state)

                if state.left_click
                    state = process_left_click(state);
                else
                    state = process_right_click(state);
                end

                % Check to see if game is in a terminal state
                state = game_over_check(state);

            end

        end

    end

end

function display_results(state, player_time)

    % For readability abrreviate the user options
    N = num2str(state.n);
    D = state.difficulty;

    % Reveal all the spaces
    for k = 1:state.n^2
        state.spaces(k).space.FaceColor = 'none';
    end

    % Winning Message
    if state.player_won

        % Import best times or create a new file to contain them
        if exist('js_best_times.mat','file')
            load('js_best_times.mat', 'best_times');
        else
            default = struct('N5', inf, 'N10', inf, 'N15', inf);
            best_times = struct( ...
                'easy', default, ...
                'normal', default, ...
                'hard', default ...
                );
        end

        % Get the best time
        best_time = best_times.(D).(['N' N]);

        % Display and Update if a new best time was found
        if player_time < best_time

            best_times.(D).(['N' N]) = player_time;

            text(1, 0.3, [ ...
                "You won! Time: " + player_time + " s!" ; ...
                "New best time!" ...
                ], ...
                'FontSize', state.fontsizes.menu, ...
                'Color', state.colors.menu, ...
                'VerticalAlignment' ,'top' ...
                )

            save('js_best_times.mat', 'best_times')

        % Otherwise just display a winning message
        else

            text(1, 0.3, [ ...
                "You won! Time: " + player_time + " s!" ; ...
                "Time to beat: " + best_time + " s" ...
                ], ...
                'FontSize', state.fontsizes.menu, ...
                'Color', state.colors.menu, ...
                'VerticalAlignment' ,'top' ...
                )

        end

    % Losing Message
    else

        % Tag the space that caused the loss
        state.spaces(state.last_x,state.last_y).space.LineWidth = 3;

        text(1, 0.3, ["You Lost!"; "Better luck next time."], ...
                'FontSize', state.fontsizes.menu, ...
                'Color', state.colors.menu, ...
                'VerticalAlignment' ,'top' ...
                )

    end

end