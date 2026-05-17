function colors = HW6P5_get_current_guess_colors_Key(guess,word)
    
    % default colors
    colors = 'wwwww';
    
    % Initialize a vector to keep track of which letters in the word have
    % already been matched.
    matched = false(1,5);
    % VERSION 1
    for k = 1:5
        if guess(k) == word(k)
            % Mark the position in the word so we know it's been counted.
            matched(k) = true;
            % Then put green in the colors array to indicate there's an
            % exact match in that position.
            colors(k) = 'g';
        else
            for i = 1:5
                if guess(k) == word(i) && ~matched(i)
                    matched(i) = true;
                    colors(k) = 'y';
                    break
                end
            end
        end
    end

    % VERSION 2 (MAYBE EASIER FOR THE STUDENTS TO GRASP)
    %     for k = 1:5
    %        if guess(k) == word(k)
    %            % Mark the position in the word so we know it's been counted.
    %            matched(k) = true;
    %            % Then put green in the colors array to indicate there's an
    %            % exact match in that position.
    %            colors(k) = 'g';
    %        end
    %     end
    %     
    %     % Now we check for which things we should mark yellow.
    %     for k = 1:5
    %         if colors(k)~='g'
    %             for i = 1:5
    %                 if guess(k) == word(i) && matched(i) == false
    %                     matched(i) = true;
    %                     colors(k) = 'y';
    %                     break
    %                 end
    %             end
    %         end
    %     end


end
