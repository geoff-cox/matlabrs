function keyboard_struct = HW7P1_create_color_board_structure()

    % =====================================================================
    % Top of keyboard:
    colors = 'bgyr';
    x = 0; % x value of the bottom left corner of the first key 
    for k = 1:length(colors)
        keyboard_struct.(colors(k)).xvals = [x x+2 x+2 x];
        keyboard_struct.(colors(k)).yvals = [4 4 6 6];
        x = x + 2; % jump to the bottom left corner of next key
    end

end