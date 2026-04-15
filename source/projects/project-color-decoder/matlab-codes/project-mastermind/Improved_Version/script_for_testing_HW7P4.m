% For testing HW7P4_update_colors_in_structs:

load('HW7_test_update_colors');

%% Test 1 -----------------------------------------------------------------
close all
% Before Figure
HW7P2_display_game_board_Key(guess_boxes1,keyboard1,true)  % Comment out the close 
                                                      % all command in the
                                                      % display_game_board
                                                      % function!
title('Test 1 - BEFORE')

% After Figure
HW7P2_display_game_board_Key(guess_boxes1,keyboard1,true)
title('Test 1 - AFTER'); fig = gcf; fig.Position(1) = 700;

attempt_num = 3;
colors1 = 'wwgyy';
[guess_boxes1_new,keyboard1_new] ...
    = HW7P4_update_colors_in_structs_Key(guess_boxes1, keyboard1, ...
                                              attempt_num, colors1);
HW7P2_display_game_board_Key(guess_boxes1_new,keyboard1_new,false)

%% Test 2 -----------------------------------------------------------------
close all
% Before Figure
HW7P2_display_game_board_Key(guess_boxes2,keyboard2,true)
title('Test 2 - BEFORE')

% After Figure
HW7P2_display_game_board_Key(guess_boxes2,keyboard2,true)
title('Test 2 - AFTER'); fig = gcf; fig.Position(1) = 700;

attempt_num = 2;
colors2 = 'wwwww';
[guess_boxes2_new,keyboard2_new] ...
    = HW7P4_update_colors_in_structs_Key(guess_boxes2, keyboard2, ...
                                              attempt_num, colors2);
HW7P2_display_game_board_Key(guess_boxes2_new,keyboard2_new,false)

%% Test 3 -----------------------------------------------------------------
close all
% Before Figure
HW7P2_display_game_board_Key(guess_boxes3,keyboard3,true)
title('Test 3 - BEFORE')

% After Figure
HW7P2_display_game_board_Key(guess_boxes3,keyboard3,true)
title('Test 3 - AFTER'); fig = gcf; fig.Position(1) = 700;

attempt_num = 3;
colors3 = 'wwgyy';
[guess_boxes3_new,keyboard3_new] ...
    = HW7P4_update_colors_in_structs_Key(guess_boxes3, keyboard3, ...
                                              attempt_num, colors3);
HW7P2_display_game_board_Key(guess_boxes3_new,keyboard3_new,false)


%% Test 4 -----------------------------------------------------------------
close all
% Before Figure
HW7P2_display_game_board_Key(guess_boxes4,keyboard4,true)
title('Test 4 - BEFORE')

% After Figure
HW7P2_display_game_board_Key(guess_boxes4,keyboard4,true)
title('Test 4 - AFTER'); fig = gcf; fig.Position(1) = 700;

attempt_num = 2;
colors4 = 'ggggg';
[guess_boxes4_new,keyboard4_new] ...
    = HW7P4_update_colors_in_structs_Key(guess_boxes4, keyboard4, ...
                                              attempt_num, colors4);
HW7P2_display_game_board_Key(guess_boxes4_new,keyboard4_new,false)
