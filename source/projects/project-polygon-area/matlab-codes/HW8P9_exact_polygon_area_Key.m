% Psuedocode:
%
% Initialize polygon(P) area to zero.
% Repeat as long as the number of remaining vertices is greater than 2
    % Get locations of a "valid" triangle to clip
    % Compute the center of the triangle
    % If center is in P
        % Compute area of triangle
        % Add area of the triangle to area of P
        % Delete middle vertex of the triangle (i.e. clip ear)

%   Note: This code assumes the polygon is simple (no edges cross) so a
%         valid ear must exist and be removed for each pass through the 
%         for loop. Expect infinite loops on this one.           

function exact_area = HW8P9_exact_polygon_area_Key(vertices)

    exact_area = 0;
    
    k = 1;
    while length(vertices) > 3
        
        % get an ear from the polygon. Handle k=1 and k=N separately
        if k == 1
            ear = [vertices(end) vertices(1:2)];
            non_ear = vertices(3:end-1);
        else
            ear = vertices(k-1:k+1);
            non_ear = vertices([1:k-2 k+2:end]);
        end
        
        % Save the x and y values of the triangular ear
        ear_xvals = [ear.x];
        ear_yvals = [ear.y];

        % compute the center point of the triangular ear
        center_x = mean([ear.x]);
        center_y = mean([ear.y]);
        
        % check to see if the center point of ear is in the polygon
        center_pt_in_polygon = HW8P6_is_pt_in_polygon_Key(center_x, ...
                                                          center_y, ...
                                                          vertices);
% % --------------------------- debugging ---------------------------------
%         plot_poly(vertices,ear,center_x,center_y)
% % -----------------------------------------------------------------------
        
        % Now, we need to see if any of the non-ear vertices lie in 
        % this ear.
        for j = 1:length(non_ear)
% % --------------------------- debugging ---------------------------------
%             hold on
%             plot(non_ear(j).x,non_ear(j).y,'o','MarkerSize',10)
%             hold off
% % -----------------------------------------------------------------------
            vertex_in_ear = HW8P6_is_pt_in_polygon_Key(non_ear(j).x, ...
                                                       non_ear(j).y, ...
                                                       ear);
            if vertex_in_ear
                % We found a vertex in the ear
                break
            end
        end

        % if the polygon without the vertex is simple and the center pt of 
        % the ear is in the polygon, then add the ear area to the polgon. 
        % Otherwise, we restore the removed vertex and increase k.
        if center_pt_in_polygon && ~vertex_in_ear
        
            ear_area = HW8P8_triangle_area_Key(ear_xvals,ear_yvals);
            exact_area = exact_area + ear_area;

            % remove ear by deleting the center vertex
            vertices(k) = [];

            % reset k
            k = 1;

        else
            % go to the next ear
            k = k + 1;
        end

    end

    % At this point the polygon is or has been reduced to a triangle.
    ear_area = HW8P8_triangle_area_Key([vertices.x],[vertices.y]);
    exact_area = exact_area + ear_area;
end