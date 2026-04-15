function [is_game_over, is_winner] = HW6P6_check_game_over_Key(current_guess, ...
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
