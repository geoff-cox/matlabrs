% =========================================================================
% NAME:
% HR:
%
% =========================================================================
function HW6P8_display_guess_boxes_lastname(guess_boxes)
    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % DON'T EDIT THE CODE HERE!
    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    % close any currently opened figures
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

    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % DO edit the code below to display the guess boxes.
    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    %Enter code here
    
    
end