%  Math Concept used to check if a number is between 2 other numbers:
%
%  c lies between a and b if     (c-a)*(c-b) < 0 
% 
% -------------------------------------------------------------------------
function on_line = HW8P2_is_pt_on_line_segment_Key(x0,y0,line)
    
    on_line = false;

    % get the slope and y-intercept of the line
    m = (line.y2 - line.y1)/(line.x2 - line.x1);
    b = -m*line.x1 + line.y1;
    
    % check the vertical case first. In this case we only need to see if 
    % Py is between the y-values of the line segment
    if abs(m) == inf && (y0 - line.y1) * (y0 - line.y2) < 0 && x0 == line.x1
        on_line = true;
    
    % check if both x0 and y0 are between the x and y-values of 
    % the line segment.
    elseif (x0 - line.x1) * (x0 - line.x2) <= 0 && ...
           (y0 - line.y1) * (y0 - line.y2) <= 0
        
        % Compute the y-value of the line above the x-value = x0
        y_line = m*x0 + b;

        % Now see if y-value of the line is equal to y0. Be careful of
        % round-off error with == here.
        if round(y_line,8) == round(y0,8)
            on_line = true;
        end
    end
end