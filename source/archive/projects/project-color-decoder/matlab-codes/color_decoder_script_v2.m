%Color decoder script
%--------------------------------------------------------------------------

%Generate the secret color code:
    the_color_code = generate_color_code();
    
%Set up the gameboard:
    set_up_the_gameboard();

%Start the game.
    clc
    disp('Welcome to the Color Decoder Game!')
    disp(' ')
    disp('You have 10 chances to guess the four-color secret code.')
    disp('You need to get the four colors correct, and they must be')
    disp('in the right order.')
    disp('Colors may be re-used. For example, red could appear more')
    disp('than once in the sequence.')
    disp('With every guess, you get feedback:')
    disp('(1) how many colors are correct AND in the correct position, and')
    disp('(2) how many colors are correct but not in the correct position.')
    disp(' ')
    disp('The secret code has been generated. Here we go!')
    disp(' ')
    
%Set the number of remaining guesses and set up a while loop for guesses.
    num_remaining_guesses = 10;
    win_flag = 0;
    while num_remaining_guesses > 0 && win_flag == 0
        
        %User makes guess by choosing clicking on the plot:
        guess_num = 11 - num_remaining_guesses;
        user_code = get_user_guess(guess_num);
        
        %Check user's guess.
        [win_flag, num_correct_in_position, num_correct_color_only]...
                    = check_user_guess(the_color_code,user_code);
                
        %Show visual feedback
        visual_feedback(num_correct_in_position, num_correct_color_only, ...
                        guess_num)

        num_remaining_guesses = num_remaining_guesses-1;
        
        if ~win_flag
            disp('Your guess was incorrect. You matched both the color')
            disp(['and position of ', num2str(num_correct_in_position), ' items, and you got'])
            disp(['an additional ', num2str(num_correct_color_only), ' colors correct, but not'])
            disp('in the correct position.')
            disp(' ')
        end
    end

%Final message
    visually_reveal_secret_code(the_color_code);
    if win_flag == 1
        disp('Congrats! You cracked the color code!')
    else
        disp('Sorry--you are out of guesses.')
        disp(['The correct color code is ', the_color_code, '.'])
    end
