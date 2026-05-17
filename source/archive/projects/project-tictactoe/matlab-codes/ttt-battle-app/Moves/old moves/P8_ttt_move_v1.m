function move = P8_ttt_move_v1(game_board,player)
open_spaces = find(game_board(:) == 0);
num_open_spaces = length(open_spaces);
randomIndex = randi(num_open_spaces);
move = open_spaces(randomIndex);
end
