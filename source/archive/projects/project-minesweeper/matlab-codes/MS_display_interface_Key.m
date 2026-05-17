% =========================================================================
% Given the size of the square grid, N, this program displays the starting
% game board and returns the rectangle objects that represent each space on
% the grid.
%
% INPUT:
%   N (1 x 1) size of the N x N square grid.
% OUTPUT:
%   rects (N x N) array of rectangle objects.
% =========================================================================
function rects = MS_display_interface_Key(N)
    % define the figure and set the position
    fig = figure('Position',[10,10,50*(N+2),50*(N+2)]);
    % set the plot axes by plotting a point at [0,0] (bottom left corner)
    % and a point [N+2,N+2] (upper right corner)
    plot([0 N+2],[0 N+2],'w.')
    % remove the axis lines and force the x and y scaling to be equal
    ax = gca; ax.XColor = 'none'; ax.YColor = 'none'; axis image;
    % remove MATLAB Toolbar and Menubar
    set(fig, 'ToolBar', 'none'); set(fig, 'MenuBar', 'none')
    % use a double for loop to create a N x N matrix of rectangles
    for i = 1:N
        for j = 1:N
            rects(j,i) = rectangle('Position',[i N-j+1 1 1],'FaceColor',[0 204/255 102/255]);
        end
    end
end