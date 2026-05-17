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
function rects = MS_display_interface_lastname(N)
    % define the figure and set the position
    fig = 
    % set the plot axes by plotting a point at [0,0] (bottom left corner)
    % and a point [N+2,N+2] (upper right corner)
    
    % remove the axis lines and force the x and y scaling to be equal
    ax = gca; ax.XColor = 'none'; ax.YColor = 'none'; axis image;
    % remove MATLAB Toolbar and Menubar
    set(fig, 'ToolBar', 'none'); set(fig, 'MenuBar', 'none')
    % use a double for loop to create a N x N matrix of rectangles
    
    
    
    
    
end