function HW6P8_display_guess_boxes_Key(guess_boxes)
    % close any currently opened figures
    close all
    % define the figure and set the position
    fig = figure('Position',[100,100,600,600]);
    plot([-2 22],[-2 34],'w.')
    %ax = gca;
    grid on;
    axis equal
    xticks(-2:2:22)
    yticks(-2:2:34)
    % ax.XColor = 'none'; ax.YColor = 'none'; 
    axis image;
    % remove MATLAB Toolbar and Menubar
    set(fig, 'ToolBar', 'none'); set(fig, 'MenuBar', 'none')
    title('WORDLE','FontSize',30)
    hold on;
    
    %Create boxes for word guesses
    for i = 1:6
        for j = 1:5
            fill(guess_boxes(i,j).xvals, ...
                 guess_boxes(i,j).yvals, ...
                 guess_boxes(i,j).color)
            text(guess_boxes(i,j).xvals(1)+1.8,...
                 guess_boxes(i,j).yvals(1)+1.8,...
                 guess_boxes(i,j).letter,...
                 'FontSize',30, ...
                 'HorizontalAlignment','center')
        end
    end
    
end