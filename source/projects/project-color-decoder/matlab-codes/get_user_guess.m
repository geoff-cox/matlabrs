function user_code = get_user_guess(guess_num)

%Start by making sure all 4 targets are available.
    target1_available = true;
    target2_available = true;
    target3_available = true;
    target4_available = true;
    user_code = 'nnnn';
    
    for i = 1:4
        %Choose the desired color:
        x = 0;
        y = 0;
        while (x<=6) || (x>=7) ...
                     || (y<=2.5) ...
                     || (y>=3.5 && y<=4) ...
                     || (y>=5 && y<=5.5) ...
                     || (y>=6.5 && y<=7) ...
                     || (y>=8)
            [x, y] = ginput(1);
        end
        if y>=7
            color = 'b';
        elseif y >= 5.5
            color = 'r';
        elseif y >= 4
            color = 'g';
        elseif y >= 2.5
            color = 'y';
        end
    
        %Then user chooses target:
            ymin = guess_num - 1;
            ymax = guess_num;
            x = 0;
            y = 0;
            while (y<=ymin || y >= ymax || x <= 0 || x >= 4) ...
                        || (x >0 && x<=1 && ~target1_available) ...
                        || (x >1 && x<=2 && ~target2_available) ...
                        || (x >2 && x<=3 && ~target3_available) ...
                        || (x >3 && x<=4 && ~target4_available)
                [x, y] = ginput(1);
            end
            if x<=1
                fill([0 1 1 0],[ymin ymin ymax ymax],color);
                target1_available = false;
                user_code(1) = color;
            elseif x<=2
                fill([1 2 2 1],[ymin ymin ymax ymax],color)
                target2_available = false;
                user_code(2) = color;
            elseif x<=3
                fill([2 3 3 2],[ymin ymin ymax ymax],color);
                target3_available = false;
                user_code(3) = color;
            else 
                fill([3 4 4 3],[ymin ymin ymax ymax],color);
                target4_available = false;
                user_code(4) = color;
            end
    end
end