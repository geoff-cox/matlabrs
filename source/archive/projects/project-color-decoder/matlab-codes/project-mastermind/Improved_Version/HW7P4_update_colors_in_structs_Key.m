function [guess_boxes,keyboard] = HW7P4_update_colors_in_structs_Key(guess_boxes,keyboard,attempt_num,colors)

    for k = 1:5
        guess_color = colors(k);
        
        %Update color in the guess box
        guess_boxes(attempt_num,k).color = guess_color;
        
        % Get the letter from the guess box so we can adjust that letter
        % on the keyboard.
        guess_letter = guess_boxes(attempt_num,k).letter;
        
        %Get the current color on the keyboard.
        current_color_on_keyboard = keyboard.(guess_letter).color;

        if guess_color == 'g'
            % If the guess color is green, then set the letter on the
            % keyboard to green also
            keyboard.(guess_letter).color = 'g';
        elseif guess_color == 'y' && length(current_color_on_keyboard) == 3
            % If the guess color is yellow, and the color on the keyboard
            % is grey, then set the letter on the keyboard to yellow also.
            keyboard.(guess_letter).color = 'y';
        elseif guess_color == 'w' && length(current_color_on_keyboard) == 3
            % If the guess color is white, and the current color on
            % the keyboard is neither green nor yellow, then set the letter
            % on the keyboard to dark grey
            keyboard.(guess_letter).color = [0.35 0.35 0.35];
        end
        
    end

end