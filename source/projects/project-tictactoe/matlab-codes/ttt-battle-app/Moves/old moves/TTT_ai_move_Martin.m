

function move_to = TTT_ai_move_3_martin(game_state,player)
n = numel(game_state);
new_game_state1 = game_state;
new_game_state2 = game_state;
win_status = TTT_detect_winning_move_martin(game_state);
rand_move = TTT44_ai_move_1_martin(game_state);

for i = 1:n
    if player == 1
        if win_status(1) > 0
            move_to = win_status(1);
        elseif win_status(2) > 0
            move_to = win_status(2);
        else
            if game_state(5) == 0
                move_to = 5;
            elseif game_state(8) == 0
                if game_state(2) == 0
                    move_to = 8;
                end
            elseif game_state(7) == 0
                if game_state(3) == 0
                    move_to = 7;
                end
            elseif game_state(9) == 0
                move_to = 9;
            elseif game_state(1) == 0
                move_to = 1;
            elseif game_state(2) == 0
                move_to = 2;
            elseif game_state(1) == 0
                if game_state(3) == 0
                    move_to = 3;
                end
            else
                move_to = rand_move;
                
                
                
            end
        end
    elseif player == -1
        if win_status(2) > 0
            move_to = win_status(2);
        elseif win_status(1) > 0
            move_to = win_status(1);
        else
            if game_state(5) == 0
                move_to = 5;
            elseif game_state(8) == 0
                if game_state(2) == 0
                    move_to = 8;
                end
            elseif game_state(7) == 0
                if game_state(3) == 0
                    move_to = 7;
                end
            elseif game_state(9) == 0
                move_to = 9;
            elseif game_state(1) == 0
                move_to = 1;
            elseif game_state(2) == 0
                move_to = 2;
            elseif game_state(1) == 0
                if game_state(3) == 0
                    move_to = 3;
                end
            else
                move_to = rand_move;
                
                
                
            end
        end

end
end
end

function move_to = TTT_ai_move_2_martin(game_state,player)
win_status = TTT_detect_winning_move_martin(game_state);
n = 1:win_status;
move_to = []; 
new_game_state1 = game_state;
new_game_state2 = game_state;
winner1 = 0;
winner2 = 0;

for i = 1:9
    if game_state(i) == 0
       new_game_state1(i) = 1;
       winner1 = TTT41_winner_check_martin(new_game_state1);
      
       new_game_state2(i) = -1;
       winner2 = TTT41_winner_check_martin(new_game_state2);
       if winner1 == 1
           if player == 1
               move_to = win_status(1);
           elseif player == -1
               move_to = win_status(1);
           end
       elseif winner2 == -1
           if player == 1
               move_to = win_status(2);
           elseif player == -1
               move_to = win_status(2);
           end
       else
           move_to = TTT44_ai_move_1_martin(game_state);
       end
    end
    new_game_state1 = game_state;
    new_game_state2 = game_state;
end
end
function move_to = TTT44_ai_move_1_martin(game_state)
locations = P22_locate_zeros_martin(game_state);
n = numel(locations);

move_to = [];

if n > 0
    val = randi(n);
    move_to = locations(val);
end



end
function locations = P22_locate_zeros_martin(nums)
j = 1;
k = 1;
N = numel(nums);
locations = 0;
    while j <= N
        if nums(j) == 0
            locations(k) = j;
            k = k+1;
        end
        j = j + 1;
    end
    locations([j:end])  = [];
end
function win_status = TTT_detect_winning_move_martin(game_state)
n = numel(game_state);
new_game_state1 = game_state;
new_game_state2 = game_state;
a = 1;
win_status = [0,0];
win_one = [];
win_two = [];
for i = 1:n
   if game_state(i) == 0
       new_game_state1(i) = 1;
       winner1 = TTT41_winner_check_martin(new_game_state1);
       new_game_state1 = game_state;
       
       new_game_state2(i) = -1;
       winner2 = TTT41_winner_check_martin(new_game_state2);
       new_game_state2 = game_state;
       
       if winner1 == 1
           win_status(1) = i;

       elseif winner2 == -1
           win_status(2) = i;
       end
end

end
end
function winner = TTT41_winner_check_martin(game_state)

a = P32_matrix_sums_martin(game_state);
n = numel(a);
winner = 0; 

for i = 1:n
     if a(i) == 3
        winner = 1;

        return
     elseif a(i) == -3
         winner = -1;

         return
     else
         winner = 0;
     end
end
end
function values = P32_matrix_sums_martin(A)

diag_sums = P31_diagonal_sums_martin(A);

r_sum = 0;
c_sum = 0;

r_sum = sum(A,2);
c_sum = sum(A);

values = [r_sum;c_sum';diag_sums];


end
function diag_sums = P31_diagonal_sums_martin(A)

[m,n] = size(A);
diag_sums1 = 0;
anti_diag_sums = 0;
h = 1;
g = m;
k = 1;
p = 0;

    if m >= n
        p = n;
    elseif n >= m
        p = m;
    end
    
    for i = 1:p
        diag_sums1 = diag_sums1 + A(i,h);
        h = h + 1;
    end
    
    for j = 1:p
        anti_diag_sums = anti_diag_sums + A(g,k);
        g = g - 1;
        k = k + 1;
    end
    
    diag_sums = [diag_sums1;anti_diag_sums];
end
%
% If you called any programs from a previous HW assignment in this function,
% copy and paste them here.  Otherwise, delete this comment.
%
% =========================================================================
% HR:
%
% =========================================================================
