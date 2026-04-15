function [guess_boxes,keyboard] = HW6_update_colors_in_structs_Key(guess_boxes,keyboard,attempt_num,colors)
% For testing
% close all;
% guess_boxes = HW6_create_guess_boxes_structure_Key();
% keyboard = HW6_create_keyboard_structure_Key();
% attempt_num = 2;
% 
% guess = 'DIRTR';
% for k = 1:5
%     guess_boxes(attempt_num,k).letter = guess(k);
% end
% 
% keyboard.D.color = 'g';
% keyboard.I.color = 'y';
% keyboard.T.color = 'y';
% keyboard.P.color = [0.35 0.35 0.35];
% colors = 'ygggw';
% 
% HW6_display_game_board_Key(guess_boxes,keyboard)
% 

    for k = 1:5
        
        guess_color = colors(k);
        guess_boxes(attempt_num,k).color = guess_color;
        guess_letter = guess_boxes(attempt_num,k).letter;
        current_color_on_keyboard = keyboard.(guess_letter).color;

        if guess_color == 'g'
            % If the guess color is green, then set the letter on the
            % keyboard to green also
            keyboard.(guess_letter).color = 'g';
        end
        if guess_color == 'w' && length(current_color_on_keyboard) == 3
            % If the letter isn't in the word, and the current color on
            % the keyboard is neither green nor yellow, then set the letter
            %  on the keyboard dark grey
            keyboard.(guess_letter).color = [0.35 0.35 0.35];
        end
        if guess_color == 'y' 
            if length(current_color_on_keyboard) == 3
                keyboard.(guess_letter).color = 'y';
             end
        end
    end

end
%HW6_display_game_board_Key(guess_boxes,keyboard)