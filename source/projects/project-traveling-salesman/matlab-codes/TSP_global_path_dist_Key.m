% =========================================================================
%  Given a list of GPS coordinates, P_1, P_2, ..., P_N, on earth, this
%  program computes the total distance traveled moving through all the
%  points in the list and returning back to the starting point. That is,
%
%   total distance = d(P_1,P_2)+d(P_2,P_3)+ ... +d(P_N−1,P_N)+d(P_N,P_1)
%
%  where d(P_i,P_j) = global distance between P_i and P_j.
%
% INPUT:
%   pt_list (N x 2) list of GPS (degree) coordinates. 
% OUTPUT:
%   total_dist (1 x 1) closed distance between all the points in pt_list.
% =========================================================================
function total_dist = TSP_global_path_dist_Key(pt_list)
    [number_of_points,~] = size(pt_list);
    pt_list = [pt_list;pt_list(1,:)];
    total_dist = 0;
    for i = 1:number_of_points
       total_dist = total_dist + TSP_global_dist_Key(pt_list(i:i+1,:)); 
    end
end
% =========================================================================
% HR:
%
% =========================================================================

% HELPER FUNCTIONS
% Paste your TSP_global_dist code here
function g_dist = TSP_global_dist_Key(P)
    rad_of_earth = 3959;
    lat1 = P(1,1)*pi/180;
    lat2 = P(2,1)*pi/180;
    lon1 = P(1,2)*pi/180;
    lon2 = P(2,2)*pi/180;
    dlat = (lat1-lat2);
    dlon = (lon1-lon2);

    h = (sin(dlat/2))^2+cos(lat1)*cos(lat2)*(sin(dlon/2))^2;
    g_dist=2*rad_of_earth*asin(sqrt(h));
end