function triangle_area = HW8P8_triangle_area_Key(T_xvals,T_yvals)
    
    % Compute the edges of the triangle as 3d vectors in the xy-plane
    u = [T_xvals(2) - T_xvals(1) T_yvals(2) - T_yvals(1) 0];
    v = [T_xvals(3) - T_xvals(1) T_yvals(3) - T_yvals(1) 0];
    
    % Use the calculus 3 formula
    triangle_area = 0.5*norm(cross(u,v));

end