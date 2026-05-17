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