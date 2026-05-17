function [dictionary_words, wordle_words] = HW6P3_get_word_lists_Key()
    dictionary_words = readlines('wordle_dictionary.txt');
    wordle_words = readlines('some_wordle_words.txt');
end