function letter = HW6_get_the_letter_Key(x,y,keyboard)
    
    keys = 'QWERTYUIOPASDFGHJKLZXCVBNM';
    for i = 1:26
        this_letter = keys(i);
        xL = keyboard.(this_letter).xvals(1);   % left x
        xR = keyboard.(this_letter).xvals(2);   % right x
        yB = keyboard.(this_letter).yvals(1);   % bottom y
        yT = keyboard.(this_letter).yvals(3);   % top y
        if xL <= x && x <= xR && yB <= y && y <= yT
            letter = this_letter;
            break
        end
    end

%     if y>=4
%         keyboard_string = 'QWERTYUIOP';
%         letter = keyboard_string(floor(x/2)+1);
%     elseif y>=2
%         keyboard_string = 'ASDFGHJKL';
%         letter = keyboard_string(floor((x-1)/2)+1);
%     else
%         keyboard_string = 'ZXCVBNM';
%         letter = keyboard_string(floor((x-1)/2));
%     end
    
end

% Change Log
% None 
% Optional Changes 
% 1. Search keyboard struct for letter