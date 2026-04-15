function [x,y] = HW6P2_get_valid_click_Key()
    valid_click = false;
    while ~valid_click
        [x,y] = ginput(1);
        valid_click = HW6P1_is_point_valid_Key(x,y);
    end
end