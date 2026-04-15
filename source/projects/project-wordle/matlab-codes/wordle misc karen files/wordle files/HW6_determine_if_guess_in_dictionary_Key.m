function is_a_word = HW6_determine_if_guess_in_dictionary_Key(current_guess, dictionary_words)
    
    is_a_word = false;
    for k = 1:14854
        if current_guess == dictionary_words(k)
            is_a_word = true;
            break
        end
    end
        
end