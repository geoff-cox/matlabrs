function is_valid = HW6P1_is_point_valid_Key(x,y)
    is_valid = false;   % assume not valid
    % In qwerty region?
    if y >= 0 && y <= 2 && x>=3 && x<=17
        is_valid = true;
    elseif y>=2 && y<=4 && x>=1 && x<=19
        is_valid = true;
    elseif y>=4 && y<=6 && x>=0 && x<=20
        is_valid = true;
    end
end