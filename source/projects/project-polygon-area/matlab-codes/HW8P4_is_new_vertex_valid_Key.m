% This program determines if any of the edges of the current polygon 
% intersect with each other. It also has the option to include an edge from 
% the last vertex to the first. 

function valid_vertex = HW8P4_is_new_vertex_valid_Key(vx,vy,vertices)
    
    % Initialize output (assume the vertex is valid) 
    valid_vertex = true;
    
    % If there is only one vertex then the new one is valid
    if length(vertices) == 1
        return
    end

    % if the click landed on the last edge, then it is not valid and
    % we end the program immediately
    last_edge = struct('x1',vertices(end-1).x,'y1', vertices(end-1).y, ...
                       'x2',vertices(end).x,  'y2', vertices(end).y);
    
    on_last_edge = HW8P2_is_pt_on_line_segment_Key(vx,vy,last_edge);

    if on_last_edge 
        valid_vertex = false;
        return
    end
    
    % If there are only two vertices, then the new one is valid
    if length(vertices) == 2
        return
    end

    % create the new edge as line segment between the new vertex and the 
    % last vertex in collection of vertices.
    new_edge = struct('x1',vertices(end).x, 'y1', vertices(end).y, ...
                      'x2',vx             , 'y2', vy);

    % Scan through each edge of the polygon
    for k = 2:length(vertices)-1
            
        % Get the kth edge from vertices
        edge.x1 = vertices(k-1).x;
        edge.y1 = vertices(k-1).y;
        edge.x2 = vertices(k).x;
        edge.y2 = vertices(k).y;

        % determine if the new edge intersects with this edge
        intersects = HW8P3_do_line_segments_intersect_Key(new_edge,edge);
    
        % if there is an intersection, then the new edge is not valid and
        % we end the program immediately
        if intersects
            valid_vertex = false;
            return
        end
    end
end
