function colors = HW6P5_get_current_guess_colors_Key(guess,word)
    
    %default colors
    colors = 'wwwww';
    
    % Initialize a vector to keep track of which letters in the word have
    % already been matched.  0 indicates it hasn't been matched, and 1
    % indicates it has been matched already.
    already_counted = zeros(1,5);
    for k = 1:5
       if guess(k) == word(k)
           % Mark the position in the word so we know it's been counted.
           already_counted(k) = 1;
           % Then put green in the colors array to indicate there's an
           % exact match in that position.
           colors(k) = 'g';
       end
    end
    
    % Now we check for which things we should mark yellow.
    for k = 1:5
        if colors(k)~='g'
            for i = 1:5
                if guess(k) == word(i) && already_counted(i)==0
                    already_counted(i) = 1;
                    colors(k) = 'y';
                    break
                end
            end
        end
    end
    
end
