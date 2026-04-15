function HW6_color_letter_on_keyboard_Key(the_letter,color)

    keyboard_string = 'QWERTYUIOP';
    for k = 1:10
        if keyboard_string(k) == the_letter
            fill([0.5*(k-1) 0.5*k 0.5*k 0.5*(k-1)],[-1 -1 -0.5 -0.5],color)
            text(0.15+(k-1)*0.5,-0.75,keyboard_string(k),'FontSize',16)
            return
        end
    end
    keyboard_string = 'ASDFGHJKL';
     for k = 1:9
       if keyboard_string(k) == the_letter
            fill([0.5*k-0.25 0.5*k+0.25 0.5*k+0.25 0.5*k-0.25],[-1.5 -1.5 -1 -1],color)
            text(0.4+(k-1)*0.5,-1.25,keyboard_string(k),'FontSize',16)
            return
       end
    end
    keyboard_string = 'ZXCVBNM';
    for k = 1:7
       if keyboard_string(k) == the_letter
            fill([0.5*k+0.25 0.5*k+0.75 0.5*k+0.75 0.5*k+0.25],[-2 -2 -1.5 -1.5],color)
            text(0.4+k*0.5,-1.75,keyboard_string(k),'FontSize',16)
            return
       end
    end

end

