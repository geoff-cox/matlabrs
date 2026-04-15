% =========================================================================
% Name: Ethan Severns
% HR:  Copy and pasted some code form P2_ttt_move_v2, asked LTC Cox how to
% implement some code I had ideas for. 
% Inputs: 
% 1) game board (3 × 3 game board matrix for the current state of a tic-tac-toe game)
% 2) player (-1 or 1 depending on which player is moving)
%
% Outputs:
%   1)  move (absolute index of selected game_board space).
% =========================================================================

function move = P8_ttt_move_Severns(game_board, player)

move = 0;

%for this code, player one should only choose from spaces 1, 3, 7 and 9
%If the computer uses P2, it will try to block the winning moves
%eventually, it will become so that there's two spaces for X to go, and O
%can only block one of them. 

vec_sum_list = game_board; %vector version of game board
vec_sum_list2 = vec_sum_list(:)'; 
mov_posb = P2_find_zeros_Severns(vec_sum_list2);%possible places for next move 

L = length(mov_posb);
for k= 1:L
wv = 0; %win vector to build
for t = 1:L
    if mov_posb(t) == 1
        wv(1) = 1;
    
    elseif mov_posb(t) == 3
        wv(2) = 3;
    
    elseif mov_posb(t) == 7
        wv(3) = 7;
    
    elseif mov_posb(t) == 9 
        wv(4) = 9;
    end
end% finding spaces 1, 3, 7, and 9
W = length(wv); 
for w = 1:W %eliminate the zeros in wv
    if wv(w) == 0
        wv(w) = [];
    end
end
i = randi(wv);
move = mov_posb(i);


end
if wv == 0
    move = P2_ttt_move_v2_Severns(game_board, player);
end
end

function move = P2_ttt_move_v2_Severns(game_board, player)

move = 0;


vec_sum_list = game_board; %vector version of game board
vec_sum_list2 = vec_sum_list(:)'; 
mov_posb = P2_find_zeros_Severns(vec_sum_list2);%possible places for next move 

L = length(mov_posb);
for k = 1:L
    copy = game_board;
    copy(mov_posb(k)) = player;
    
    winner = P1_ttt_winner_check_Severns(copy);
    if winner == player
        move = mov_posb(k);
      return
    end
end
for j = 1:L
    copy = game_board;
    copy(mov_posb(j)) = player*-1; 
   
    winner = P1_ttt_winner_check_Severns(copy);
    if winner == player*-1
        copy(mov_posb(j)) = player;
        move = mov_posb(j);
            return
    end
end

end
function outcome = P1_ttt_winner_check_Severns(game_board)



A = P3_matrix_path_sums_Severns(game_board);

w = length(A);
outcome = 0; %no winner until the game has been played (for loop)
for w = 1:8
    if A(w) == 3
        outcome = 1; %1 = player X
    elseif A(w) == -3 
        outcome = -1; %-1 is player O
    end
    

end
end
function move_space = P2_ttt_move_v1_Severns(game_board)


vec_sum_list = game_board; %vector version of game board
vec_sum_list2 = vec_sum_list(:)'; 
mov_posb = P2_find_zeros_Severns(vec_sum_list2);%possible places for next move 
MPL = length(mov_posb); 

i = randi(MPL); %integer of mov_posb

move_space = mov_posb(i);%random outcome of the moves possible
end
function locations = P2_find_zeros_Severns(nums)

N = length(nums);
locations = [];
a = 0; %arbitrary variable to assist me in creating a vector with the
       %locations.


for k = 1:N
    if nums(k)== 0
        a = a + 1; 
        locations(a) = k; %a creates a new index to be the length of locations
       
    end
end
end



