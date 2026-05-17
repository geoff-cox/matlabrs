% HR: none
% James Wynn
% 11/9/2023
% 
% HW 5 P 2
% Strategically returns an AI move on available ttt space

function index = HW5P2_my_ai_move_Wynn(game_state)
global unresponsive

    data = game_state.data;
    play = game_state.player;

    for k = 1:9

        temp_data = data;
        
        if data(k) == 0

            temp_data(k) = play;
            win = HW4P8_winner_check_Wynn(temp_data);
    
            if win == play
    
                index = k;
                return
    
            end
        end
    end

    mi = data(2,2) * play;
    tl = data(1,1) * play;
    tr = data(1,3) * play;
    bl = data(3,1) * play;
    br = data(3,3) * play;

    if mi == 0

        index = 5;
        return

    elseif tl >= 0 && tr >= 0 && bl >= 0

        if data(1) == 0
        
            index = 1;
            return
        end

    elseif tl >= 0 && tr >= 0 && br >= 0

        if data(7) == 0

            index = 7;
            return  
        end

    elseif tl >= 0 && bl >= 0 && br >= 0

        if data(3) == 0

            index = 3;
            return
        end

    elseif tr >= 0 && br >= 0 && bl >= 0

        if data(9) == 0

            index = 9;
            return
        end
    end

    for j = 1:9

        temp_data = data;
        
        if data(j) == 0

            temp_data(j) = play * -1;
            win = HW4P8_winner_check_Wynn(temp_data);
    
            if win == play * -1
    
                index = j;
                return
    
            end
        end
    end

    index = HW4P9_dumb_ai_move_Wynn(game_state);
end


% =========================================================================
% HW 4 P 8
% Returns ttt winner

function result = HW4P8_winner_check_Wynn(data)

    diag_sum = sum(data(1,1) + data(2,2) + data(3,3));
    adiag_sum = sum(data(3,1) + data(2,2) + data(1,3));

    for i = 1:3
    
        col_sum = sum(data(i,:));
        row_sum = sum(data(:,i));
    
        if col_sum == 3 || row_sum == 3 || diag_sum == 3 || adiag_sum == 3
    
            result = 1;
            return
    
        elseif col_sum == -3 || row_sum == -3 || diag_sum == -3 || adiag_sum == -3
    
            result = -1;
            return
    
        else
    
            result = 0;
    
        end
    end
end

% =========================================================================
% HW 4 P 9
% Returns an AI move on available ttt space with equal probability

function index = HW4P9_dumb_ai_move_Wynn(game_state)

    n = 0;

    matrix = game_state.data;
    spaces = game_state.empty_space;

    for k = 1:10
    
        if k == 10

            index = [];
            return

        elseif spaces(k) == 1

            inf_loop_counter = 0;
            while n ~= 1
                inf_loop_counter = inf_loop_counter + 1;
                if inf_loop_counter > 1e6
                    unresponsive = true;
                    return
                end

                index = randi(9);
                valid = matrix(index);
                
                if valid == 0
        
                    n = 1;
                    return 
        
                else
        
                    n = 0;
        
                end
            end
        end
    end
end
