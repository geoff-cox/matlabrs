%hr:in class help
%mack,DL
function selection = HW5P2_my_ai_move_Mack(state)
selection=0;
if state.player == -1
    if state.empty_space(5)==1
        selection = 5;
        return
    end

end
if state.player == -1
    l=length(state.empty_space);
    selection = 0;
    orig=state.data;
    tst=state.data;

    for k=1:l
        if state.empty_space(k)==1
            tst(k)=1;
            result = HW4P8_winner_check(tst);
            if result==1
                selection =k;
                return
            else
                tst=orig;
            end
        end
    end
    for k=1:l
        if state.empty_space(k)==1
            tst(k)=-1;
            result = HW4P8_winner_check(tst);
            if result == -1
                selection =k;
                return
            else
                tst=orig;
            end
        end
    end
    if selection == 0
        if state.empty_space(1)==1
            selection = 1;
            return
        end
        if state.empty_space(3)==1
            selection = 3;
            return
        end
        if state.empty_space(7)==1
            selection = 7;
            return
        end
        if state.empty_space(9)==1
            selection = 9;
            return
        end
    end
end

end

