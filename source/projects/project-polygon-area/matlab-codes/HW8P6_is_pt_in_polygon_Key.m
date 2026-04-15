
function in_polygon = HW8P6_is_pt_in_polygon_Key(Px,Py,vertices)
    
    in_polygon = false;
    
    edge_cross_count = 0;
    
    % Define the "horizontal" ray coming from x = -infinity (we can just 
    % use -1000) and ending at the point in question.
    % To avoid horzontal edges lying on the ray we shift the initial point
    % of the ray up slightly. 
    ray.x1 = -1000;
    ray.y1 = Py + 1;
    ray.x2 = Px;
    ray.y2 = Py;

    % Copy an additional first vertex to the end of vertices to handle 
    % cycling back to the first vertex.
    extended_vertices = [vertices vertices(1)];
    
    for k = 1:length(vertices)

        % get (x0,y0), (x1,y1), and y2 (x2 is not used)
        x0 = extended_vertices(k).x;
        y0 = extended_vertices(k).y;
        x1 = extended_vertices(k+1).x;
        y1 = extended_vertices(k+1).y;

        % create kth edge
        edge = struct('x1', x0, 'y1', y0, 'x2', x1, 'y2', y1);
        
        % check if the kth vertex lies on the kth edge
        if HW8P2_is_pt_on_line_segment_Key(Px,Py,edge)
            in_polygon = true;
            return
        end

        % Check if the edge of the polygon intersects the ray. If so, 
        % count that edge unless that line is horizontal.
        intersect = HW8P3_do_line_segments_intersect_Key(ray,edge);
        
        if intersect
            edge_cross_count = edge_cross_count + 1;
        end

    end
    
    % The the number of edge crossing is a non-zero even number, then the
    % point must lies inside the polygon.
    if edge_cross_count > 0 && mod(edge_cross_count,2)
        in_polygon = true;
    end
end




