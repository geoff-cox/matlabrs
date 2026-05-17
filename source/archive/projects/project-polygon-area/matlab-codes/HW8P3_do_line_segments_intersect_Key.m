% This program determines the intersection point of two line segments, if
% it exists, via the two primary tasks:
%
%   1. locates the theoretical intersection point of extended line segments 
%   2. checks if that point is on the actual line segments
%
% -------------------------------------------------------------------------

function intersect = HW8P3_do_line_segments_intersect_Key(line1,line2)
    
    % =====================================================================
    % COMPUTE SLOPES AND Y_INTERCEPTS OF EXTENDED LINE SEGMENTS
    % =====================================================================
    
    % Compute slope and y-intercept for the Eqn of Line 1: y = m1*x + b1
    % If m1 == inf, then the line is vertical and the y-int is not defined. 
    m1 = (line1.y2 - line1.y1)/(line1.x2 - line1.x1);
    b1 = -m1*line1.x1 + line1.y1;
    
    % Compute slope and y-intercept for the Eqn of Line 2: y = m2*x + b2
    m2 = (line2.y2 - line2.y1)/(line2.x2 - line2.x1);
    b2 = -m2*line2.x1 + line2.y1;
    
    % Lets treat slopes of +infinity and -infinity as equal
    if abs(m1) == inf
        m1 = abs(m1);
    elseif abs(m2) == inf
        m2 = abs(m2);
    end
    % =====================================================================
    % PARALLEL CASE
    %   The line segments intesect as long as at least one endpoint of one
    %   line lies on the other line.
    % =====================================================================
    if m1 == m2
        
        % Checking if endpoint 1 of line1 is on line 2
        EP1_of_L1_on_L2 = HW8P2_is_pt_on_line_segment_Key(line1.x1, ...
                                                          line1.y1, ...
                                                          line2);
        % Checking if endpoint 2 of line1 is on line 2
        EP2_of_L1_on_L2 = HW8P2_is_pt_on_line_segment_Key(line1.x2, ...
                                                          line1.y2, ...
                                                          line2);
        if EP1_of_L1_on_L2 || EP2_of_L1_on_L2
            intersect = true;
        else
            intersect = false;
        end

        return

    % =====================================================================
    % NON-PARALLEL CASE
    %   Either one of the lines are vertical or we are in the standard case
    % =====================================================================
    elseif m1 == inf    % line 1 is vertical
        
        x_I = line1.x1;
        y_I = m2*x_I + b2;
    
    elseif m2 == inf    % line 2 is vertical
        
        x_I = line2.x1;
        y_I = m1*x_I + b1;
    
    % Note: Both lines being vertical is covered by PARALLEL Case
    else                % standard case
    
        x_I = (b2 - b1)/(m1 - m2);
        y_I = m1*x_I + b1;
    
    end
    
    % =====================================================================
    % CHECK IF INTERSECTION POINT LIES ON THE ACTUAL LINE SEGMENTS
    % =====================================================================
    IP_on_L1 = HW8P2_is_pt_on_line_segment_Key(x_I,y_I,line1);
    IP_on_L2 = HW8P2_is_pt_on_line_segment_Key(x_I,y_I,line2);
    
    % If not on either line, set the output to empty
    if IP_on_L1 && IP_on_L2
        intersect = true;
    else
        intersect = false;
    end

end