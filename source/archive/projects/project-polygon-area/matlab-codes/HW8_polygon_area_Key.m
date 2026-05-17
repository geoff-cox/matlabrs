%% Polygon Area Script

% =========================================================================
% SET-UP
% =========================================================================

% Set x and y ranges for display interface
x_min = 0;
x_max = 40;
y_min = 0;
y_max = 40;

% Set a max number of allowable vertices
max_vertices = 25;

% Pre-allocate vertices collection struct 
vertices(1:max_vertices) = struct('x',-1,'y',-1);

% keep track of the number of vertices
vertex_count = 0;

% Initialize display
HW8P1_initial_display_Key(x_min,x_max,y_min,y_max);

% =========================================================================
% USER INTERACTION (Create Polygon)
% =========================================================================

% Get first vertex
[x_click,y_click] = ginput(1);

% Add the rounded x, y values to the vertices collection. Round to the
%  nearest integer to make closing the polygon relatively easy for user.
vertices(1).x = round(x_click);
vertices(1).y = round(y_click);
vertex_count = vertex_count + 1;

% plot the first vertex
plot(vertices(1).x,vertices(1).y,'ok')

% ------------------------------------------------------------------------
% Interaction Loop
%
% Break out of loop if polygon is closed or the max number of vertices 
%  have been reached.
while true
    
    % get mouse click and round
    [x_click,y_click] = ginput(1);
    
    x_click = round(x_click);
    y_click = round(y_click);
    
    % check if this click closes the polygon
    if x_click == vertices(1).x && y_click == vertices(1).y
        
        % Plot closing edge and end loop
        plot([vertices(vertex_count).x vertices(1).x], ...
             [vertices(vertex_count).y vertices(1).y],'-ok')
        break
    end

    % determine if the new vertex creates a valid edge
    add_vertex = HW8P4_is_new_vertex_valid_Key(x_click, y_click, ...
                                            vertices(1:vertex_count));

    if add_vertex

        vertex_count = vertex_count + 1;
        vertices(vertex_count).x = x_click;
        vertices(vertex_count).y = y_click;
        
        plot([vertices(vertex_count-1).x vertices(vertex_count).x], ...
                 [vertices(vertex_count-1).y vertices(vertex_count).y], ...
                 '-ok')

        % If the max number of vertices was reached, also make sure the  
        % edge connecting the last vertex to the first one does not 
        % intersect with any other edge of the polygon. Otherwise, increase
        % the vertex count and plot the new vertex and edge.
        if vertex_count >= max_vertices
            is_simple = HW8P5_is_polygon_simple_Key(vertices);

            % If simple, plot the last edge and we're done. 
            if is_simple
                plot([vertices(end).x vertices(1).x], ...
                     [vertices(end).y vertices(1).y],'-ok')
                break
            end
        end

    end
    % Notes: 
    %   * If the polygon is not simple after adding the vertex, the "bad"
    %     vertex will be overwritten in the next loop since we didn't 
    %     increase the vertex count.
    %   * It is possible to plot vertices such that you cannot make a
    %     simple polygon no matter where you click the next vertex. We 
    %     will ignore this rare situation. The code must be terminated by
    %     closing the figure.
    
end

% =========================================================================
% POST INTERACTION (Compute Area of Polygon)
% =========================================================================

% If the max number of vertices was not reached, remove trailing unused 
% vertices. Otherwise, make sure the edge connecting the last vertex to the 
% first one does not intersect with any other edge of the polygon and plot 
% the last edge.
if vertex_count < max_vertices
    vertices(vertex_count + 1:end) = [];
end

% define polygon containing box for monte-carlo 
containing_box = struct('x1',x_min,'x2',x_max,'y1',y_min,'y2',y_max);

% approximate area using monte-carlo simulation
approx_area = HW8P7_approx_polygon_area_Key(vertices,containing_box);

% compute exact area using the ear-clipping algorithm
% exact_area = HW8P9_exact_polygon_area_Key(vertices);  
exact_area = polyarea([vertices.x],[vertices.y]);

% fill the polygon with a transparent color 
fill([vertices.x],[vertices.y],'b','FaceAlpha',0.4)

% display both approximate and exact areas
text(2,39,"Approximate Area = " + num2str(round(approx_area,2)));
text(2,37,"Exact Area = " + num2str(round(exact_area,2)));

% =========================================================================
% END OF SCRIPT - HELPER FUNCTIONS BELOW
% =========================================================================

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

function is_simple = HW8P5_is_polygon_simple_Key(vertices)
    
    N = length(vertices);
    
    % Initialize output (assume yes and change to no if an edge intersects) 
    is_simple = true;

    % Copy an additional first vertex to the end of vertices to handle 
    % cycling back to the first vertex.
    vertices(end + 1) = vertices(1);
    
    % Set each edge of the polygon for convenience
    edges(1:N) = struct('x1',0,'y1',0,'x2',0,'y2',0);
    for i = 1:N
        % Get the ith edge from vertices
        edges(i).x1 = vertices(i).x;
        edges(i).y1 = vertices(i).y;
        edges(i).x2 = vertices(i+1).x;
        edges(i).y2 = vertices(i+1).y;
    end
    % scan through the remaining edges but ignore adjacent edges since
    % the polygon was constructed so that they cannot intersect.
    for j = 1:N
        this_edge = edges(j);
        
        % set non-adjacent edges as a copy of all edges, but delete 
        % this_edge and the adjacent ones
        non_adj_edges = edges;

        % Handle the j = 1 and j = N case separately 
        if j == 1
            non_adj_edges([1 2 N]) = [];
        elseif j == N
            non_adj_edges([1 N-1 N]) = [];
        else
            non_adj_edges([j-1 j j+1]) = [];
        end

        for k = 1:length(non_adj_edges)

            % does this edge and the kth non-adjacent edge intersect?
            intersect = HW8P3_do_line_segments_intersect_Key( ...
                                                        this_edge, ...
                                                        non_adj_edges(k));
        
            % if so, then the polygon is not simple
            if intersect
                is_simple = false;
                return
            end

        end
    end

end

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
        
%         %----------- For debugging
%         if in_polygon
%             plot(Px,Py,'b+')
%         else
%             %plot(Px,Py,'rx')
%         end
%         %-------------------------

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

