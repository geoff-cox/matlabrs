% =========================================================================
% NAME:
% HR:
%
% =========================================================================
function wordle_key(secret_word)
    %----------------------------------------------------------------------
    % Initialize variables:
    %----------------------------------------------------------------------
    
    %1--Create structure to hold info on all guesses~~~~~~~~~~~~~~~~~~~~~~~
    guess_boxes = create_guess_boxes_structure_Key();
    
    %2--Create structure for qwerty keyboard~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    keyboard = create_keyboard_structure_Key();
    
    %3--Get the dictionary of valid words and the set of potential wordle 
    %    words~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    [dictionary_words, wordle_words] = get_word_lists_Key();
    
    %4--Initialize other game variables:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    is_game_over = false;             % game over flag

    is_winner = false;                % winner flag

    current_guess = '_____';          % default value of the current guess;
                                      %   will be an string of five
                                      %   letters
                                                                           
    current_attempt_num = 1;          % current attempt number
    
    num_of_wordle = randi([1 200],1,1);    % this is the number of the
                                            %   chosen wordle word...
                                            %That is, there are 200 words
                                            %   in the list, and this is
                                            %   the randomly chosen index.
    
    if nargin == 1
        if ~ischar(secret_word) || length(secret_word) ~= 5
            msgbox('The secret word must be 5 letters!')
            close all
            return
        end
        the_wordle_word = upper(secret_word);
    else
        the_wordle_word = char(wordle_words(num_of_wordle));    
    end                                        % this chosen wordle word
    
    %----------------------------------------------------------------------
    % Display the starting gameboard:
    %----------------------------------------------------------------------
    display_game_board_Key(guess_boxes, keyboard, true);
    
    %----------------------------------------------------------------------
    % Now play the game:
    %----------------------------------------------------------------------
    while ~is_game_over
        
        %Get a guess:
        for col = 1:5
            %First get a valid click...
            [x,y] = get_valid_click_Key();
            %Get the clicked letter and store it in guess_boxes struct
            guessed_letter = get_the_letter_Key(x,y,keyboard);
            guess_boxes(current_attempt_num,col).letter = guessed_letter;
            %Add letter the current guess
            current_guess(col) = guessed_letter;
            %Put that letter in the appropriate empty box on the game board
            text(guess_boxes(current_attempt_num,col).xvals(1)+1.8,...
                 guess_boxes(current_attempt_num,col).yvals(1)+1.8,...
                 guess_boxes(current_attempt_num,col).letter,...
                 'FontSize',30,'HorizontalAlignment','center')
        end
        
        %Is current guess a word in the dictionary?
        if nargin == 1 && isequal(current_guess, the_wordle_word) % allow word entered by user
            is_a_word = true;
        else
            is_a_word = determine_if_guess_in_dictionary_Key( ...
                                                        current_guess, ...
                                                        dictionary_words);
        end

        if ~is_a_word
            % If the current guess is not a real word, we clear the attempt
            for col = 1:5
                guess_boxes(current_attempt_num,col).letter = '';
            end
            % then refresh the gameboard:
            display_game_board_Key(guess_boxes, keyboard, false);
            title('That is not a word; try again.')           

        else
            % In this case, the guess is a real word, so we need to check 
            % the guess against the wordle word:
            current_guess_colors = get_current_guess_colors_Key( ...
                                                        current_guess, ...
                                                        the_wordle_word);

            % Add the colors to the guess boxes and keyboard
            [guess_boxes,keyboard] = update_colors_in_structs_Key( ...
                                                    guess_boxes, ...
                                                    keyboard, ...
                                                    current_attempt_num, ...
                                                    current_guess_colors);
        
            %Check for game over and if the player is a winner
            [is_game_over, is_winner] = check_game_over_Key( ...
                                                    current_guess, ...
                                                    the_wordle_word, ...
                                                    current_attempt_num);

            current_attempt_num = current_attempt_num + 1;
            %And refresh the gameboard
            display_game_board_Key(guess_boxes, keyboard, false);
        end
    end

    % GAME OVER:
    %If we've made it out of the while loop, the game is over.
    %----------------------------
    if is_winner
        title("Congrats, you discovered the Wordle!",'FontSize',12)
    else
        title("You didn't guess the wordle:",'FontSize',14)
        text(10,33,the_wordle_word,"FontSize",30,...
            'HorizontalAlignment','center')
    end
end    

% HELPER FUNCTIONS --------------------------------------------------------

function is_valid = is_point_valid_Key(x,y)
    is_valid = false;   % assume not valid
    % In qwerty region?
    if y >= 0 && y <= 2 && x>=3 && x<=17
        is_valid = true;
    elseif y>=2 && y<=4 && x>=1 && x<=19
        is_valid = true;
    elseif y>=4 && y<=6 && x>=0 && x<=20
        is_valid = true;
    end
end

function [x,y] = get_valid_click_Key()
    valid_click = false;
    while ~valid_click
        [x,y] = ginput(1);
        valid_click = is_point_valid_Key(x,y);
    end
end

function [dictionary_words, wordle_words] = get_word_lists_Key()
    dictionary_words = readlines('wordle_dictionary.txt');
    wordle_words = readlines('some_wordle_words.txt');
end

function is_a_word = determine_if_guess_in_dictionary_Key(current_guess, dictionary_words)
    
    is_a_word = false;
    for k = 1:14854
        if current_guess == dictionary_words(k)
            is_a_word = true;
            break
        end
    end
        
end

function colors = get_current_guess_colors_Key(guess,word)
    
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

function [is_game_over, is_winner] = check_game_over_Key(current_guess, ...
                                                             the_wordle_word, ...
                                                             current_attempt_num)
    is_game_over = false;
    is_winner = false;
    if current_guess == the_wordle_word
        is_game_over = true;
        is_winner = true;
    elseif current_attempt_num >= 6
        is_game_over = true;
        is_winner = false;
    end

end

function guess_boxes = create_guess_boxes_structure_Key()

    %Preallocate an empty 6 by 5 array of structures 
    guess_boxes(6,5) =struct('xvals',zeros(1,4),...
                             'yvals',zeros(1,4), ...
                             'letter','',...
                             'color','w');
    %Initialize the boxes to be white and not have a letter
    for i = 1:6
        for j = 1:5
            guess_boxes(i,j).xvals = [4*j-3.8 4*j-0.2 4*j-0.2 4*j-3.8];
            guess_boxes(i,j).yvals = [32.2-4*i 32.2-4*i 35.8-4*i 35.8-4*i];
            guess_boxes(i,j).letter = '';
            guess_boxes(i,j).color = 'w';
        end
    end
end

function keyboard_struct = create_keyboard_structure_Key()

    default_key_struct = struct('xvals',zeros(1,4),...  
                                'yvals',zeros(1,4),...
                                'color',[0.5 0.5 0.5]); %default color is grey
    
    % =====================================================================
    % Top of keyboard:
    keys = 'QWERTYUIOP';
    x = 0; % x value of the bottom left corner of the first key 
    for k = 1:length(keys)
        keyboard_struct.(keys(k)) = default_key_struct;
        keyboard_struct.(keys(k)).xvals = [x x+2 x+2 x];
        keyboard_struct.(keys(k)).yvals = [4 4 6 6];
        x = x + 2; % jump to the bottom left corner of next key
    end

    % =====================================================================
    % Middle row of keyboard:
    keys = 'ASDFGHJKL';
    x = 1; % x value of the bottom left corner of the first key 
    for k = 1:length(keys)
        keyboard_struct.(keys(k)) = default_key_struct;
        keyboard_struct.(keys(k)).xvals = [x x+2 x+2 x];
        keyboard_struct.(keys(k)).yvals = [2 2 4 4];
        x = x + 2; % jump to the bottom left corner of next key
    end

    % =====================================================================
    % Bottom row of keyboard:
    keys = 'ZXCVBNM';
    x = 3; % x value of the bottom left corner of the first key 
    for k = 1:length(keys)
        keyboard_struct.(keys(k)) = default_key_struct;
        keyboard_struct.(keys(k)).xvals = [x x+2 x+2 x];
        keyboard_struct.(keys(k)).yvals = [0 0 2 2];
        x = x + 2; % jump to the bottom left corner of next key
    end

end

function display_game_board_Key(guess_boxes,keyboard,initial)
    % close any currently opened figures
    
    if initial
        close all
        % define the figure and set the position
        fig = figure('Position',[100,100,600,600]);
        plot([-2 22],[-2 34],'w.')
        ax = gca;
        grid on;
        axis equal
        xticks(-2:2:22)
        yticks(-2:2:34)
        % ax.XColor = 'none'; ax.YColor = 'none'; 
        axis image;
        % remove MATLAB Toolbar and Menubar
        set(fig, 'ToolBar', 'none'); set(fig, 'MenuBar', 'none')
        title('WORDLE','FontSize',30)
        hold on;
    end
    
    %Create boxes for word guesses
    for i = 1:6
        for j = 1:5
            fill(guess_boxes(i,j).xvals, ...
                 guess_boxes(i,j).yvals, ...
                 guess_boxes(i,j).color)
            text(guess_boxes(i,j).xvals(1)+1.8,...
                 guess_boxes(i,j).yvals(1)+1.8,...
                 guess_boxes(i,j).letter,...
                 'FontSize',30, ...
                 'HorizontalAlignment','center')
        end
    end
    
    %Create qwerty keyboard
    keyboard_string = 'QWERTYUIOPASDFGHJKLZXCVBNM';
    for k = 1:26
       this_letter = keyboard_string(k);
       fill(keyboard.(this_letter).xvals,...
            keyboard.(this_letter).yvals, ...
            keyboard.(this_letter).color)
       text(keyboard.(this_letter).xvals(1)+1,...
            keyboard.(this_letter).yvals(1)+1,...
            this_letter,'FontSize',20,'FontName','Consolas',...
            'HorizontalAlignment','center')
    end
    
end

function letter = get_the_letter_Key(x,y,keyboard)
    
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
    
end

function [guess_boxes,keyboard] = update_colors_in_structs_Key(guess_boxes,keyboard,attempt_num,colors)

    for k = 1:5
        guess_color = colors(k);
        
        %Update color in the guess box
        guess_boxes(attempt_num,k).color = guess_color;
        
        % Get the letter from the guess box so we can adjust that letter
        % on the keyboard.
        guess_letter = guess_boxes(attempt_num,k).letter;
        
        %Get the current color on the keyboard.
        current_color_on_keyboard = keyboard.(guess_letter).color;

        if guess_color == 'g'
            % If the guess color is green, then set the letter on the
            % keyboard to green also
            keyboard.(guess_letter).color = 'g';
        elseif guess_color == 'y' && length(current_color_on_keyboard) == 3
            % If the guess color is yellow, and the color on the keyboard
            % is grey, then set the letter on the keyboard to yellow also.
            keyboard.(guess_letter).color = 'y';
        elseif guess_color == 'w' && length(current_color_on_keyboard) == 3
            % If the guess color is white, and the current color on
            % the keyboard is neither green nor yellow, then set the letter
            % on the keyboard to dark grey
            keyboard.(guess_letter).color = [0.35 0.35 0.35];
        end
        
    end

end
















