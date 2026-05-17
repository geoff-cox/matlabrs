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