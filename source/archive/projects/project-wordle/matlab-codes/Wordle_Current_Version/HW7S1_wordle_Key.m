% =========================================================================
% NAME:
% HR:
%
% =========================================================================

    %----------------------------------------------------------------------
    % Initialize variables:
    %----------------------------------------------------------------------
    
    %1--Create structure to hold info on all guesses~~~~~~~~~~~~~~~~~~~~~~~
    guess_boxes = HW6P7_create_guess_boxes_structure_Key();
    
    %2--Create structure for qwerty keyboard~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    keyboard = HW7P1_create_keyboard_structure_Key();
    
    %3--Get the dictionary of valid words and the set of potential wordle 
    %    words~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    [dictionary_words, wordle_words] = HW6P3_get_word_lists_Key();
    
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
    
                                        
    the_wordle_word = char(wordle_words(num_of_wordle));    
                                            % this chosen wordle word
                                        
    %the_wordle_word = 'PEACH';
    %the_wordle_word = 'TROLL';
    %the_wordle_word = 'CLOCK';
    
    %----------------------------------------------------------------------
    % Display the starting gameboard:
    %----------------------------------------------------------------------
    HW7P2_display_game_board_Key(guess_boxes, keyboard, true);
    
    %----------------------------------------------------------------------
    % Now play the game:
    %----------------------------------------------------------------------
    while ~is_game_over
        
        %Get a guess:
        for col = 1:5
            %First get a valid click...
            [x,y] = HW6P2_get_valid_click_Key();
            %Get the clicked letter and store it in guess_boxes struct
            guessed_letter = HW7P3_get_the_letter_Key(x,y,keyboard);
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
        is_a_word = HW6P4_determine_if_guess_in_dictionary_Key( ...
                                                        current_guess, ...
                                                        dictionary_words);
        
        if ~is_a_word
            % If the current guess is not a real word, we clear the attempt
            for col = 1:5
                guess_boxes(current_attempt_num,col).letter = '';
            end
            % then refresh the gameboard:
            HW7P2_display_game_board_Key(guess_boxes, keyboard, false);
            title('That is not a word; try again.')           

        else
            % In this case, the guess is a real word, so we need to check 
            % the guess against the wordle word:
            current_guess_colors = HW6P5_get_current_guess_colors_Key( ...
                                                        current_guess, ...
                                                        the_wordle_word);

            % Add the colors to the guess boxes and keyboard
            [guess_boxes,keyboard] = HW7P4_update_colors_in_structs_Key( ...
                                                    guess_boxes, ...
                                                    keyboard, ...
                                                    current_attempt_num, ...
                                                    current_guess_colors);
        
            %Check for game over and if the player is a winner
            [is_game_over, is_winner] = HW6P6_check_game_over_Key( ...
                                                    current_guess, ...
                                                    the_wordle_word, ...
                                                    current_attempt_num);

            current_attempt_num = current_attempt_num + 1;
            %And refresh the gameboard
            HW7P2_display_game_board_Key(guess_boxes, keyboard, false);
        end
    end

    % GAME OVER:
    %If we've made it out of the while loop, the game is over.
    %----------------------------
    if is_winner
        title("Congrats, you discovered the Wordle!")
    else
        title("You didn't guess the wordle:")
        text(10,33,the_wordle_word,"FontSize",30,...
            'HorizontalAlignment','center')
    end
    