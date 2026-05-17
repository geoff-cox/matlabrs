%=========================================================================
%Name: Joshua Myers
% HR:  Helper functions
% Struggled with problem
%=========================================================================
function move = P8_ttt_move_Myers(game_board, player)
A = game_board(:)';
indicies_of_zeros = P2_find_zeros_Myers(A);
for k = 1:9
    if indicies_of_zeros(k) == 1 || 3 || 7 || 9
        move = indicies_of_zeros(k);
    elseif indicies_of_zeros(k) == 5
        move = 5;
    end
end
    move_space = P2_ttt_move_v1_Myers(game_board);
A = game_board(:)';
indicies_of_zeros = P2_find_zeros_Myers(A);
length_of_zero_vec = length(indicies_of_zeros);
rand_val = randi(length_of_zero_vec);
move_space = indicies_of_zeros(rand_val);
move = P2_ttt_move_v2_Myers(game_board,player)
copy_of_gb = game_board;
for k =1:9
    move_space = P2_ttt_move_v1_Myers(copy_of_gb);
    copy_of_gb(move_space) = player;
    outcome = P1_ttt_winner_check_Myers(copy_of_gb);
    if outcome == player
        move = move_space;
    return
    else
        copy_of_gb = game_board;
    end     
end
player = player*-1;
for k = 1:9
    copy_of_gb = game_board;
    move_space = P2_ttt_move_v1_Myers(copy_of_gb);
    copy_of_gb(move_space) = player;
    outcome = P1_ttt_winner_check_Myers(copy_of_gb);
    if outcome == player
        move = move_space;
        return
    else
end
end
end
function move_space = P2_ttt_move_v1_Myers(game_board)
A = game_board(:)';
indicies_of_zeros = P2_find_zeros_Myers(A);
length_of_zero_vec = length(indicies_of_zeros);
rand_val = randi(length_of_zero_vec);
move_space = indicies_of_zeros(rand_val);
end

function locations = P2_find_zeros_Myers(nums)
N=length(nums);
locations=[];
v=0; %counter variable
for k=1:N
    if nums(k)==0
        v=v+1;
        locations(v)=k;
    end
end
end
function move = P2_ttt_move_v2_Myers(game_board,player)
copy_of_gb = game_board;
for k =1:9
    move_space = P2_ttt_move_v1_Myers(copy_of_gb);
    copy_of_gb(move_space) = player;
    outcome = P1_ttt_winner_check_Myers(copy_of_gb);
    if outcome == player
        move = move_space;
    return
    else
        copy_of_gb = game_board;
    end     
end
player = player*-1;
for k = 1:9
    copy_of_gb = game_board;
    move_space = P2_ttt_move_v1_Myers(copy_of_gb);
    copy_of_gb(move_space) = player;
    outcome = P1_ttt_winner_check_Myers(copy_of_gb);
    if outcome == player
        move = move_space;
        return
    else
    end
end
end
%==========================================================================
function move = P1_ttt_winning_move_Myers(game_board,player,open_spaces)
N = length(open_spaces);
move = 0;
copy_of_gb = game_board;
for k = 1:N
    copy_of_gb(open_spaces(k)) = player;
    if P1_ttt_winner_check_Myers(copy_of_gb)== player
        move = open_spaces(k);
        return
    end
end  
end