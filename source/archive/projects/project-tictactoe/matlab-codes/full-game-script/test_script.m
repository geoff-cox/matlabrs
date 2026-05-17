game_state.board = zeros(3);
game_state.round = 0;
game_state.winner = 0;
game_state.whos_turn = 'X';
game_state.player = 1;
game_state.empty_space = true(1,9);
game_state.x_click = 2;
game_state.y_click = 3;

HW4P2_display_initial_board     % This gives you a figure to test on
HW4P3_update_board(game_state)  % This is the function you are testing