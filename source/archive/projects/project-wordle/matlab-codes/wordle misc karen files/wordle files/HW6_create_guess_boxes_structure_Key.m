function guess_boxes = HW6_create_guess_boxes_structure_Key()

    %Preallocate an empty 6 by 5 array of structures 
    guess_boxes(6,5) =struct('xvals',zeros(1,4),...
                             'yvals',zeros(1,4), ...
                             'letter','',...
                             'color','w');
    %Initialize the boxes to be white and not have a letter
    for i = 1:6
        for j = 1:5
            guess_boxes(i,j).xvals = [4*j-3.8 4*j-0.2 4*j-0.2 4*j-3.8];
            guess_boxes(i,j).yvals = [32.2-4*i 32.2-4*i 35.8-4*i 35.8-4*i];
            guess_boxes(i,j).letter = '';
            guess_boxes(i,j).color = 'w';
        end
    end
end