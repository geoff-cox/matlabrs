function keyboard_struct = HW6_create_keyboard_structure_Key()

    default_key_struct = struct('xvals',[],'yvals',[],'color',[0.5 0.5 0.5]);
    
    % =====================================================================
    % Top of keyboard:
    keys = 'QWERTYUIOP';
    x = 0; % x value of the bottom left corner of the first key 
    for k = 1:length(keys)
        keyboard_struct.(keys(k)) = default_key_struct;
        keyboard_struct.(keys(k)).xvals = [x x+2 x+2 x];
        keyboard_struct.(keys(k)).yvals = [4 4 6 6];
        x = x + 2; % jump to the bottom left corner of next key
    end

    % =====================================================================
    % Middle row of keyboard:
    keys = 'ASDFGHJKL';
    x = 1; % x value of the bottom left corner of the first key 
    for k = 1:length(keys)
        keyboard_struct.(keys(k)) = default_key_struct;
        keyboard_struct.(keys(k)).xvals = [x x+2 x+2 x];
        keyboard_struct.(keys(k)).yvals = [2 2 4 4];
        x = x + 2; % jump to the bottom left corner of next key
    end

    % =====================================================================
    % Bottom row of keyboard:
    keys = 'ZXCVBNM';
    x = 3; % x value of the bottom left corner of the first key 
    for k = 1:length(keys)
        keyboard_struct.(keys(k)) = default_key_struct;
        keyboard_struct.(keys(k)).xvals = [x x+2 x+2 x];
        keyboard_struct.(keys(k)).yvals = [0 0 2 2];
        x = x + 2; % jump to the bottom left corner of next key
    end

end