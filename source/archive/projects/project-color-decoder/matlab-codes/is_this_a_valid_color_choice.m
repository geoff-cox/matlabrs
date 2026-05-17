function valid_color_choice_boolean = is_this_a_valid_color_choice(color_char)
    %valid chars: b,g,r,y
    valid_color_choice_boolean = false;
    if color_char == 'b' || color_char == 'g' ...
                            || color_char == 'r' ...
                            || color_char == 'y'
        valid_color_choice_boolean = true;
    end
    
end