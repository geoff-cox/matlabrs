function [guess_boxes, color_boxes] = HW6P7_create_guess_boxes_structure_Key()

    % Preallocate an empty 6 by 4 array of structures 
    guess_boxes(6,4) = struct('xvals',zeros(1,4),...
                              'yvals',zeros(1,4), ...
                              'letter','',...
                              'color','w');

    % Initialize the boxes to be white and not have a letter
    for i = 1:6
        for j = 1:4
            guess_boxes(i,j).xvals = [4*j-3.8 4*j-0.2 4*j-0.2 4*j-3.8];
            guess_boxes(i,j).yvals = [32.2-4*i 32.2-4*i 35.8-4*i 35.8-4*i];
            guess_boxes(i,j).letter = '';
            guess_boxes(i,j).color = 'w';
        end
    end
   
    % Preallocate an empty 1 by 4 array of structures 
    color_boxes(1,4) = struct('xvals',zeros(1,4),...
                              'yvals',zeros(1,4), ...
                              'color','w');

    % Initialize the boxes to be white and not have a letter
    colors = 'bgyr';
    for k = 1:4
        color_boxes(k).xvals = [4*k-3.8 4*k-0.2 4*k-0.2 4*k-3.8];
        color_boxes(k).yvals = [0.2 0.2 0.8 0.8];
        color_boxes(k).color = colors(k);
    end
    
end