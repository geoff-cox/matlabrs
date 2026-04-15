function selection = HW5P2_my_ai_move_Kohan(game_state)

    for k = 1:9
        %check to see if desired moves are available
        if game_state.data(1) == 0 
            selection = 1;
            return
        elseif game_state.data(3) == 0
            selection = 3;
            return
        elseif game_state.data(7) == 0
            selection = 7;
            return
        elseif game_state.data(9) == 0
            selection = 9;
            return
        elseif game_state.data(5) == 0
            selection = 5;
            return
        end
    end

    for k = 1:9
        % check for winning move, take if found
            if game_state.data(k) == 0
                check = game_state.data;
                check(k) = game_state.player-2;
                if HW4P8_winner_check(check) == -1
                    selection = k;
                    return
                end
            end
    end
    for k = 1:9
            % check for blocking move, take if found
            if game_state.data(k) == 0
                check = game_state.data;
                check(k) = game_state.player;
                if HW4P8_winner_check(check) == 1
                    selection = k;
                    return
                end
            end    
    end
    for k = 1:9
        % if there is not move that blocks a win or wins, choose random
        if game_state.data(k) == 0
            game_state.data(k) = game_state.player-2;
            if HW4P8_winner_check(game_state.data) == 0
                selection = ai_v1(game_state);
            end
        end
    end
end
