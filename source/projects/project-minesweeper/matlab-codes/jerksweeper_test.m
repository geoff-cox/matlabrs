function jerksweeper_test(grid_size, difficulty)

    % Clean up
    clear state; close all;
    
    % Get user options if grid_size & difficulty were not provided
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