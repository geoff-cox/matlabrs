function selection = HW5P2_my_ai_move_v1(state)

    selection = randi(9);
    while ~state.empty_space(selection)
        selection = randi(9);
    end

end