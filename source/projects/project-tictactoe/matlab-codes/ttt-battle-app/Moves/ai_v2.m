function selection = ai_v2(state)
    
    temp_board = state.data;

    for player = [state.player -state.player]
        for idx = 1:9
            if temp_board(idx) == 0
                temp_board(idx) = player;
                if winner_check(temp_board) == player
                    selection = idx;
                    return
                else
                    temp_board(idx) = 0;
                end
            end
        end
    end

    selection = dumb_ai_move(state);

end

function result = winner_check(board)
  
    values(1:3) = sum(board, 2);
    values(4:6) = sum(board)';
    values(7)   = sum(board([1 5 9]));
    values(8)   = sum(board([3 5 7]));
    
    if any(values == 3)
        result = 1;
    elseif any(values == -3)
        result = -1;
    else
        result = 0;
    end
  
end

function selection = dumb_ai_move(state)

    selection = randi(9);
    while ~state.empty_space(selection)
        selection = randi(9);
    end

end