% For testing HW7P4_update_colors_in_structs:

load('HW7_test_update_colors');

%% Test 1 -----------------------------------------------------------------
close all
HW7P2_display_game_board_Key(guess_boxes1,keyboard1)  % Comment out the close 
                                                      % all command in the
                                                      % display_game_board
                                                      % function!
attempt_num = 3;
colors1 = 'wwgyy';
[guess_boxes1,keyboard1] ...
    = HW7P4_update_colors_in_structs_Key(guess_boxes1, keyboard1, ...
                                              attempt_num, colors1);
HW7P2_display_game_board_Key(guess_boxes1,keyboard1)


%% Test 2 -----------------------------------------------------------------
% close all
% HW7P2_display_game_board_lastname(guess_boxes2,keyboard2)
% attempt_num = 2;
% colors2 = 'wwwww';
% [guess_boxes2,keyboard2] ...
%     = HW7P4_update_colors_in_structs_lastname(guess_boxes2, keyboard2, ...
%                                               attempt_num, colors2);
% HW7P2_display_game_board_lastname(guess_boxes2,keyboard2)


%% Test 3 -----------------------------------------------------------------
% close all
% HW7P2_display_game_board_lastname(guess_boxes3,keyboard3)
% attempt_num = 3;
% colors3 = 'wwgyy';
% [guess_boxes3,keyboard3] ...
%     = HW7P4_update_colors_in_structs_lastname(guess_boxes3, keyboard3, ...
%                                               attempt_num, colors3);
% HW7P2_display_game_board_lastname(guess_boxes3,keyboard3)


%% Test 4 -----------------------------------------------------------------
% close all
% HW7P2_display_game_board_lastname(guess_boxes4,keyboard4)
% attempt_num = 2;
% colors4 = 'ggggg';
% [guess_boxes4,keyboard4] ...
%     = HW7P4_update_colors_in_structs_lastname(guess_boxes4, keyboard4, ...
%                                               attempt_num, colors4);
% HW7P2_display_game_board_lastname(guess_boxes4,keyboard4)
