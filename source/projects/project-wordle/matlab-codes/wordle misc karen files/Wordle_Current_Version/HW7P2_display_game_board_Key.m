function HW7P2_display_game_board_Key(guess_boxes,keyboard,initial)
    % close any currently opened figures
    
    if initial
        close all
        % define the figure and set the position
        fig = figure('Position',[100,100,600,600]);
        plot([-2 22],[-2 34],'w.')
        ax = gca;
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
    end
    
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
    
    %Create qwerty keyboard
    keyboard_string = 'QWERTYUIOPASDFGHJKLZXCVBNM';
    for k = 1:26
       this_letter = keyboard_string(k);
       fill(keyboard.(this_letter).xvals,...
            keyboard.(this_letter).yvals, ...
            keyboard.(this_letter).color)
       text(keyboard.(this_letter).xvals(1)+1,...
            keyboard.(this_letter).yvals(1)+1,...
            this_letter,'FontSize',20,'FontName','Consolas',...
            'HorizontalAlignment','center')
    end
    
end
