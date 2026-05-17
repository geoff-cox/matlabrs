function [guess_boxes,keyboard] = HW6_update_colors_Key(guess_boxes,keyboard,num,colors)

    for k = 1:5
        guess_boxes(num,k).color = colors(k);
        guess_letter = guess_boxes(num,k).letter;
        if keyboard.(guess_letter).color ~= 'g'
            if colors(k) == 'w'
                keyboard.(guess_letter).color = [0.35 0.35 0.35];
            else
                keyboard.(guess_letter).color = colors(k);
            end
        end
    end

end