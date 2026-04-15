% best possible move ai


function move_to = TTT_ai_move_3_clements(game_state,player)
x = 0;
    locations = TTT42_get_open_spaces_Clements(game_state);
    l = numel(locations);
    if l == 8
        x = 1;
    
    elseif l == 6
        x = 2;
        
    end
    while x == 1
        if game_state(1) == player/-1 || game_state(3) == player/-1 || game_state(7) == player/-1 || game_state(9) == player/-1 || game_state(2) == player/-1 || game_state(4) == player/-1 || game_state(6) == player/-1 || game_state(8) == player/-1 
            move_to = 5;
            return
        elseif game_state(5) == player/-1
            move_to = 3;
            return
        end
       x = 0;
    end
    while x == 2
        if game_state(1) == player/-1 && game_state(9) == player/-1 && game_state(5) == player
            move_to = 2;
            return
        elseif game_state(3) == player/-1 && game_state(7) == player/-1 && game_state(5) == player
            move_to = 2;
            return
        elseif game_state(3) == player && game_state(5) == player/-1 && game_state(7) == player/-1
            move_to = 9;
                return        
        
        end
        x = 0;
    end
    
    move_to = TTT_ai_move_2_Clements(game_state,player);
end



% HR: None
    
    



        

        
            