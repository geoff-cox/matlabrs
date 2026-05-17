function approx_area = HW8P7_approx_polygon_area_Key(vertices,box)
    
    % set the number of monte-carlo simulations
    num_of_sims = 10000;
    
    % track the number of random points that land inside the polygon
    pts_in_count = 0;
    
    % compute the area of the box containing the polygon
    area_of_box = (box.x2 - box.x1)*(box.y2 - box.y1);
    
    % simulation loop
    for k = 1:num_of_sims
        
        % get a random x and y coordinate in containing box
        Px = (box.x2 - box.x1)*rand() + box.x1;
        Py = (box.y2 - box.y1)*rand() + box.y1;

        % check if random point lands inside polygon
        in_polygon = HW8P6_is_pt_in_polygon_Key(Px,Py,vertices);
        
        %----------- For debugging
        if in_polygon
            plot(Px,Py,'b+')
        else
            %plot(Px,Py,'rx')
        end
        %-------------------------

        % if point lands inside polygon, count it
        if in_polygon
            pts_in_count = pts_in_count + 1;
        end

    end
    
    % compute the ratio of the points from containing that fell inside the 
    % polygon
    ratio_of_pts_in = pts_in_count/num_of_sims;
    
    % get the approximate area by scaling the area of the containing box by
    % the ratio of the points that landed in the polygon.
    approx_area = ratio_of_pts_in*area_of_box;
end


