% =========================================================================
% This program provides a visual version of the current state of the
% Tic-Tac_Toe game board. The board should be a character array that can be
% displayed using MATLAB's disp command. Your visual game board should
% contain the available spaces as an absolute index location and the spaces
% occupied by either X or O. A template board is provided.
% 
% INPUT:
%   game_state (3 x 3) current state of the TTT game board
% OUTPUT:
%   visual_state (m x n) visual version of the game board
% =========================================================================
function visual_state = TTT43_display_board_Key(game_state)
    visual_state = [' 1 | 4 | 7 ';...  % Sample game board. 
                    '-----------';...  % You can use this or change it.
                    ' 2 | 5 | 8 ';...
                    '-----------';...
                    ' 3 | 6 | 9 '];

    for k = 1:numel(game_state)
        if game_state(k) == 1
            visual_state = P42_find_replace_char_Key(visual_state,num2str(k),'X');
        elseif game_state(k) == -1
            visual_state = P42_find_replace_char_Key(visual_state,num2str(k),'O');
        end
    end

end

function new_char_array = P42_find_replace_char_Key(char_array,find_char,replace_char)
    new_char_array = char_array;

    for k = 1:numel(char_array)
        if new_char_array(k) == find_char
            new_char_array(k) = replace_char;
        end
    end
end
