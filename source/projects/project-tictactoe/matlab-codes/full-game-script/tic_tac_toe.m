clear all; close all; clc

% Set game properties
game_state.data = zeros(3);
game_state.round = 0;
game_state.winner = 0;
game_state.whos_turn = 'X';
game_state.player = 1;
game_state.empty_space = true(1,9);
game_state.x_click = 0;
game_state.y_click = 0;

display_initial_board();

game_type = questdlg( ...
    'Select Game Type?', ...
	'Game Type Selection', ...
	'PVE', 'PVP', 'EVE', 'PVE');

% Handle response
switch game_type
    case 'PVE'
        ai_level = questdlg( ...
            'Select Player O''s Level', ...
	        'CPU-1 Level Selection', ...
	        '1-dumb','2-better','3-best','2-better');
        game_state = pve_game_loop(game_state, ai_level);
    case 'EVE'
        ai1_level = questdlg( ...
            'Select Player X''s Level', ...
	        'AI Level Selection', ...
	        '1','2','3','2');
        ai2_level = questdlg( ...
            'Select Player O''s Level', ...
	        'AI Level Selection', ...
	        '1','2','3','2');
        game_state = eve_game_loop(game_state, ai1_level, ai2_level);
    otherwise
        game_state = pvp_game_loop(game_state);
end

% Determine Winner
if game_state.winner == 0
    title('Tie Game','FontSize',24);
else
    title(['Player ' game_state.whos_turn ' wins!'], 'FontSize', 24);
end

function display_initial_board

    figure('Position',[100, 100, 650, 600]);
    hold on
    plot([2 2], [1 4], 'k', 'LineWidth', 3);
    plot([3 3], [1 4], 'k', 'LineWidth', 3);
    plot([1 4], [2 2], 'k', 'LineWidth', 3);
    plot([1 4], [3 3], 'k', 'LineWidth', 3);
    axis([0.5 4.5 0.5 4.5]);
    grid off
    axis equal;
    ax = gca; ax.XColor = 'none'; ax.YColor = 'none';
end

function update_board(state)
        
    if state.player == 1
    
        text( ...
            state.x_click + 0.206, ...
            state.y_click + 0.525, ...
            'X', 'fontsize', 80, 'color', 'blue' ...
            )

    else

        text( ...
            state.x_click + 0.156, ...
            state.y_click + 0.525, ...
            'O', 'fontsize', 80, 'color', 'red' ...
            )
    end

end

function abs_index = click_2_index(x, y)

    xy_2_inx_matrix = [ 3 2 1; 6 5 4; 9 8 7 ];
    abs_index = xy_2_inx_matrix(x, y);
        
end

function [x, y] = index_2_click(abs_index)

    idx_2_x_map = [ 1 1 1 2 2 2 3 3 3 ];
    idx_2_y_map = [ 3 2 1 3 2 1 3 2 1 ];
    x = idx_2_x_map(abs_index);
    y = idx_2_y_map(abs_index);
        
end

function [x, y] = get_valid_click(state)

    while true
    
        % get floored mouse click from user
        mouse_click = floor(ginput(1));
        x = mouse_click(1);
        y = mouse_click(2);
    
        % click is valid if 
        %   x and y are between 1 and 3, and the space is empty
        if (x-1)*(x-3) <= 0 && (y-1)*(y-3) <= 0 && ...
                state.empty_space(click_2_index(x, y))

            return

        end
    
    end
end

function result = winner_check(board)
  
    values(1:3) = sum(board, 2);
    values(4:6) = sum(board)';
    values(7)   = sum(board([1 5 9]));
    values(8)   = sum(board([3 5 7]));
    
    if any(values == 3)
        result = 1;
    elseif any(values == -3)
        result = -1;
    else
        result = 0;
    end
  
end

function selection = dumb_ai_move(state)

    selection = randi(9);
    while ~state.empty_space(selection)
        selection = randi(9);
    end

end

function selection = better_ai_move(state)
    
    temp_board = state.data;

    for player = [state.player -state.player]
        for idx = 1:9
            if temp_board(idx) == 0
                temp_board(idx) = player;
                if winner_check(temp_board) == player
                    selection = idx;
                    return
                else
                    temp_board(idx) = 0;
                end
            end
        end
    end

    selection = dumb_ai_move(state);

end

function selection = my_ai_move(state)

    open_spaces = find(state.empty_space);
    current_player = state.player;

    if state.round == 1
        selection = 5;
        return
    elseif state.round == 2 && ~state.empty_space(5)
        selection = 9;
        return
    end

    % initial selection
    selection = open_spaces(1);
    for space = open_spaces
    
        move_score = get_move_score(state.data, state.player, state.empty_space, state.round, space, current_player); 

        % Good move, take it
        if move_score == 1
            selection = space;
            return;

        % Neutral move, save it but keep looking for better
        elseif move_score == 0
            selection = space;
        end
    end
    
    % Unbeatable TicTacToe AI 
    function score = get_move_score(data, player, empty_space, round, move, moving_player)
        data(move) = player;
        empty_space(move) = false;
        empty_spaces = find(empty_space);
        
        % recursion terminations
        if moving_player*winner_check(data) > 0
            score = 1;
        elseif moving_player*winner_check(data) < 0
            score = -1;
        elseif isempty(empty_spaces)
            score = 0;

        % new recursion
        else
            scores = nan(1, length(empty_spaces));
            
            for i = 1:length(empty_spaces)

                move = empty_spaces(i);

                scores(i) = get_move_score(data, -player, empty_space, round + 1, move, moving_player);

            end

            if moving_player*player == 1
                score = min(scores);
            else
                score = max(scores);
            end
        end
    end

end

function state = pve_game_loop(state, cpu_level)

    while state.winner == 0 && state.round < 9
    
        state.round = state.round + 1;
        if state.player == 1

            [x_click, y_click] = get_valid_click(state);
            selection = click_2_index(x_click, y_click);
        
        else

            if cpu_level == 1
                selection = dumb_ai_move(state);
            elseif cpu_level == 2
                selection = better_ai_move(state);
            else
                selection = my_ai_move(state);
            end

        end
    
        [x_click, y_click] = index_2_click(selection);
        
        state.empty_space(selection) = false;
        state.data(selection) = state.player;
        state.x_click = x_click;
        state.y_click = y_click;
        update_board(state)
        pause(0.2);

        if abs(state.winner) == 1
            return
        end

        state.player = -state.player;
        if state.player == 1
            state.whos_turn = 'X';
        else
            state.whos_turn = 'O';
        end
    
    end

end

function state = pvp_game_loop(state)

    while state.round < 9
    
        state.round = state.round + 1;

        [x_click, y_click] = get_valid_click(state);
        selection = click_2_index(x_click, y_click);
        [x_click, y_click] = index_2_click(selection);
    
        state.empty_space(selection) = false;
        state.data(selection) = state.player;
        state.x_click = x_click;
        state.y_click = y_click;
        update_board(state)
        state.winner = winner_check(state.data);

        if abs(state.winner) == 1
            return
        end

        state.player = -state.player;
        if state.player == 1
            state.whos_turn = 'X';
        else
            state.whos_turn = 'O';
        end
    
    end

end

function state = eve_game_loop(state, cpu1_level, cpu2_level)

    while state.winner == 0 && state.round < 9
    
        state.round = state.round + 1;
        if state.player == 1
            if cpu1_level == '1'
                selection = dumb_ai_move(state);
            elseif cpu1_level == '2'
                selection = better_ai_move(state);
            else
                selection = my_ai_move(state);
            end
            
        else
            
            if cpu2_level == '1'
                selection = dumb_ai_move(state);
            elseif cpu2_level == '2'
                selection = better_ai_move(state);
            else
                selection = my_ai_move(state);
            end
            
        end

        [x_click, y_click] = index_2_click(selection);
    
        state.empty_space(selection) = false;
        state.data(selection) = state.player;
        state.x_click = x_click;
        state.y_click = y_click;
        update_board(state)
        pause(0.2);

        if abs(state.winner) == 1
            return
        end

        state.player = -state.player;
        if state.player == 1
            state.whos_turn = 'X';
        else
            state.whos_turn = 'O';
        end
    
    end

end
