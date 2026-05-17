% This program determines if any of the edges of the current polygon 
% intersect with each other. It also has the option to include an edge from 
% the last vertex to the first. 

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
