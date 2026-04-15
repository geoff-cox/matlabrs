function HW8P1_initial_display_Key(x_min,x_max,y_min,y_max)
    
    % close any currently opened figures
    close all

    % define the figure and set the position
    fig = figure('Position',[100,100,600,600]);
    plot([x_min x_max],[y_min y_max],'w.')
    grid on;
    axis equal
    xticks(x_min:2:x_max)
    yticks(y_min:2:y_max)
    axis image;

    % remove MATLAB Toolbar and Menubar
    set(fig, 'ToolBar', 'none'); set(fig, 'MenuBar', 'none')

    % add a title
    title('Polygon Area','FontSize',30)

    % set hold on for future plots
    hold on;
    
end
