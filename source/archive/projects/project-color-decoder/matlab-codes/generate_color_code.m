function the_color_code = generate_color_code()

    the_color_vec = randi([1 4],1,4);
    the_color_code = 'bbbb';
    for i = 1:4
        color_num = the_color_vec(i);
        if color_num == 2
            the_color_code(i) = 'g';
        elseif color_num == 3
            the_color_code(i) = 'r';
        elseif color_num == 4
            the_color_code(i) = 'y';
        end
    end
end