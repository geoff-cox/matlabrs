% ========================================================================
% GAME SCRIPT
% ========================================================================

clear; close all;

% Game Settings
max_level = 5;
game_over = false;
winner = false;

game_info = struct( ...
    'max_level', max_level, ...         % set max level(# of guesses)
    'colors', ['b','g','y','r','w','k'], ...    % initialize color array
    'level', 1, ...                     % initialize current guess level
    'color_selected', 1, ...            % initialize current selected color
    'guesses', zeros(max_level,4), ...  % initialize guess matrix
    'solution', randi([1 4],1,4), ...   % generate solution
    'feedback', zeros(max_level,4) ...  % initialize guess feedback matrix
    );

game_info.solution

display_initial_game(game_info);

while ~game_over
    [x,y] = get_click(game_info);
    game_info = process_click(x,y,game_info);
    [game_over,winner] = check_game_over(game_info);
end

if winner
    title("Congrats, you discovered the secret code!")
else
    title("You failed to discover the secret code, best of luck next time.")
end

% ========================================================================
% HELPER FUNCTIONS
% ========================================================================

function [x,y] = get_click(info)
    valid_click = false;
    while ~valid_click
        [x,y] = ginput(1);
        valid_click = is_valid_click(x,y,info.level);
    end
end

function is_valid = is_valid_click(x,y,level)
    is_valid = false;   % assume not valid
    % Within x boundary?
    if x >= 0 && x <= 4
        % In the color region OR the correct game region(based on level)?
        if y >= -2 && y <= -1 || level == ceil(y)
            is_valid = true;
        end
    end
end

function new_info = process_click(x,y,old_info)
    new_info = old_info;
    if y >= -2 && y <= -1       % update color
        new_info.color_selected = ceil(x);
    else
        new_info.guesses(new_info.level,ceil(x)) = new_info.color_selected;
        cur_guess = new_info.guesses(new_info.level,:);
        zero_count = any_matches(cur_guess,0);
        update_display(new_info);
        if zero_count == 0     % is guess level full?
            any_count = any_matches(cur_guess, new_info.solution);
            exact_count = exact_matches(cur_guess, new_info.solution);
            new_fb = zeros(1,4);
            new_fb(1:any_count) = 5;
            new_fb(1:exact_count) = 6;
            new_info.feedback(new_info.level,:) = new_fb;
            update_display(new_info);
            new_info.level = new_info.level + 1;
        end
    end
    
end

function update_display(info)
    level = info.level;
    guess = info.guesses(level,:);
    colors = info.colors;
    feedback = info.feedback;
    for k = 1:4
        if guess(k) ~= 0
            fill([k-1 k-1 k k],[level level-1 level-1 level], colors(guess(k)))
        else
            fill([k-1 k-1 k k],[level level-1 level-1 level], 'w')
        end
        if feedback(level,k) > 0
            fill([4.1+0.45*(k-1) 4.1+0.45*(k-1)+0.35 4.1+0.45*(k-1)+0.35 4.1+0.45*(k-1)],[(level-1) (level-1) (level-1)+0.35 (level-1)+0.35], colors(feedback(level,k)))
        end
    end 
end

function [is_game_over, is_winner] = check_game_over(info)
    is_game_over = false;
    is_winner = false;
    if info.level > info.max_level % losing condition
        is_game_over = true;    
    elseif info.level > 1 && info.feedback(info.level-1,end) == 6 % winning condition
        is_game_over = true;
        is_winner = true;
    end
end

function count = exact_matches(list1, list2)
    n1 = length(list1);
    n2 = length(list2);
    if n1 < n2
        n = n1;
    else
        n = n2;
    end
    count = 0;
    for j = 1:n
        if list1(j) == list2(j)
            count = count + 1;
        end
    end
end

function count = any_matches(list1, list2)
    j = 1;
    count = 0;
    while ~isempty(list1)
        for k = 1:length(list2)
            if list1(j) == list2(k)
                count = count + 1;
                list2(k) = [];
                break
            end
        end
        list1(j) = [];
    end
end

function display_initial_game(info)
    % define the figure and set the position
    fig = figure('Position',[100,100,50*(info.max_level+1),50*(info.max_level+1)]);
    % set the plot axes by plotting a point at [0,0] (bottom left corner)
    % and a point [N,N] (upper right corner)
    plot([-2 6],[-2 info.max_level+1],'w.')
    % remove the axis lines and force the x and y scaling to be equal
    ax = gca; ax.XColor = 'none'; ax.YColor = 'none'; axis image;
    % remove MATLAB Toolbar and Menubar
    set(fig, 'ToolBar', 'none'); set(fig, 'MenuBar', 'none')
    
    hold on;
    for k = 0:info.max_level
        plot([0 4],[k k],'k')   % Horizontal line
    end
    for k = 0:4
        plot([k k],[0 info.max_level],'k')   % Vertical line
        plot([k k],[-1 -2],'k')
    end
    
    plot([0 4],[-1 -1],'k')     % top
    plot([0 4],[-2 -2],'k')     % bottom
    
    for k = 0:3
        fill([k k k+1 k+1],[-1 -2 -2 -1], info.colors(k+1))
    end
end