function [selection] = HW5P2_my_ai_move_Eynon(game_state)

if game_state.empty_space(5) == 1
    selection = 5;
    return
elseif game_state.empty_space(1) == 1
    selection = 1;
    return
elseif game_state.empty_space(3) == 1
    selection = 3;
    return
elseif game_state.empty_space(7) == 1
    selection = 7;
    return
elseif game_state.empty_space(9) == 1
    selection = 9;
    return
end

if game_state.whos_turn == 'X'
    if game_state.data(1,1) == 1 && game_state.data(1,3) == 1
        selection = 4;
        return
    elseif game_state.data(1,1) == 1 && game_state.data(3,1) == 1
        selection = 2;
        return
    elseif game_state.data(1,3) == 1 && game_state.data(3,3) == 1
        selection = 8;
        return
    elseif game_state.data(3,1) == 1 && game_state.data(3,3) == 1
        selection = 6;
        return
    end
else
    if game_state.data(1,1) == -1 && game_state.data(1,3) == -1
        selection = 4;
    end
    if game_state.data(1,1) == -1 && game_state.data(3,1) == -1
        selection = 2;
    end
    if game_state.data(1,3) == -1 && game_state.data(3,3) == -1
        selection = 8;
    end
    if game_state.data(3,1) == -1 && game_state.data(3,3) == -1
        selection = 6;
    else 
        [selection] = ai_v2(game_state);
    end
end
end
