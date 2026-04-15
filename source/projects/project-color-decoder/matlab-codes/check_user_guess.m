function [is_it_a_win, num_correct_in_position, num_correct_color_only]...
                = check_user_guess(the_color_code,user_code)
    
    %initialize output values
    is_it_a_win = false;
    num_correct_color_only = 0;
    correct_boolean = zeros(1,4);
    spare_user_colors = 'nnnn';
    spare_code_colors = 'nnnn';
    spare_counter = 0;
    
    %Check to see which elements are an exact match.
    for i = 1:4
        if the_color_code(i) == user_code(i)
            correct_boolean(i) = 1;
        else
            spare_counter = spare_counter + 1;
            spare_user_colors(spare_counter) = user_code(i);
            spare_code_colors(spare_counter) = the_color_code(i);
        end
    end
    num_correct_in_position = sum(correct_boolean);
    
    %If all are exact matches, then user wins
    if num_correct_in_position == 4
        is_it_a_win = true;
%     elseif num_correct_in_position == 3
%         num_correct_color_only = 1;
%         %also num_correct_in_position = 0...but this is the default
    else
        for j = 1:spare_counter
            k = 1;
            color_match_flag = true;
            while k<=spare_counter && color_match_flag
                if spare_code_colors(j) == spare_user_colors(k)
                    num_correct_color_only = num_correct_color_only + 1;
                    color_match_flag = false;
                    spare_user_colors(k) = 'n';
                end
                k = k+1; 
            end

        end
    end
            
end