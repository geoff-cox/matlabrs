function valid_boolean = check_user_input(user_string)

    valid_boolean = true;
    if length(user_string) ~= 4
        disp(['Invalid input.  Please try again.',newline]);
        valid_boolean = false;
    else
        color_choice1_valid = is_this_a_valid_color_choice(user_string(1));
        color_choice2_valid = is_this_a_valid_color_choice(user_string(2));
        color_choice3_valid = is_this_a_valid_color_choice(user_string(3));
        color_choice4_valid = is_this_a_valid_color_choice(user_string(4));
        
        if (~color_choice1_valid || ~color_choice2_valid...
                                    || ~color_choice3_valid...
                                    || ~color_choice4_valid)
            disp(['Invalid input.  Please try again.',newline]);
            valid_boolean = false;
        end
    end
        
    
end